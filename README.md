# emacs-texlive

TeX Live and Emacs in a Docker container.

This project contains the configuration for a Docker container that can be used
for generating decent looking PDFs with Org Mode and/or XeLaTeX. The
configuration is centered around an installation of TeX Live which provides
XeLaTeX and it's supporting tools and packages. The image's default entry point
is `latexmk`.

> *NOTE*: For details about how to use this image see the use cases below.

In addition to what the Tex Live distribution packages, the following open
source fonts are included:

| Name                                                                    | License     |
| ----------------------------------------------------------------------- | ----------- |
| [Adobe Source Code Pro](https://github.com/adobe-fonts/source-code-pro) | [OFL 1.1]   |
| [Adobe Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro) | [OFL 1.1]   |
| [Lato](http://www.latofonts.com/lato-free-fonts/)                       | [OFL 1.1]   |
| [Libre Caslon Text](https://github.com/impallari/Libre-Caslon-Text)     | [OFL 1.1]   |
| [Libre Franklin](https://github.com/impallari/Libre-Franklin)           | [OFL 1.1]   |
| [Montserrat](https://github.com/JulietaUla/Montserrat)                  | [OFL 1.1]   |
| [Nimbus Sans L](https://www.fontsquirrel.com/fonts/nimbus-sans-l)       | [GNU GPLv2] |

[OFL 1.1]: https://opensource.org/licenses/OFL-1.1
[GNU GPLv2]: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html

> *TIP*: You can make OTF or TTF fonts from your local system available to the container by mapping a volume it into the container in the appropriate directory underneath */usr/share/fonts* (e.g. */usr/share/fonts/opentype* for OTF fonts and */usr/share/fonts/truetype* for TTF fonts).
>
>     docker run --rm -it \
>       -v /Library/fonts:/usr/share/fonts/truetype \
>       hgjt/emacs-texlive:latest

A copy of Emacs 25 with the latest version of Org Mode is also included, which
can be used as a headless compiler for converting *.org* files to *PDF*. See
*User Case #2* for example.


## Docker

> *NOTE*: In these examples, replace 1.x.x with a proper version number.


### Building a *emacs-texlive* Docker image

To build the image:

    $ make build


### Publishing the *emacs-texlive* Docker image

> *NOTE*: You will likely want to set the image tag via the `IMAGE_TAG`
> environment varialbe when publishing an image. Omitting the image tag will
> default to *latest*.

1. Login to Dockerhub

        $ docker login

2. Push the image to Dockerhub

        $ make publish IMAGE_TAG=<semantic version number here>


## Usage

### Use Case #1: Generate a PDF From a LaTeX File

To generate a PDF of a LaTeX file, mount it's parent directory to `/docs`:

    $ docker run --rm \
      -v `pwd`:/docs \
      hgjt/emacs-texlive:latest \
      -xelatex <your-tex-file>.tex


### Use Case #2: Generate a PDF From a Org Mode File

*emacs-texlive* is bundled with a template for converting orgmode files to
LaTeX. This is an opinionated configuration that aims at generating a fairly
minimalist document from notes or lists.

> *NOTE*: If your needs go beyond the bundled configuration, see *Use Case #3*
> for configuring *emacs-texlive* in your local Emacs.

To generate a PDF from an Org mode file:

    $ docker run \
        -it \
        --rm \
        -v `pwd`:/docs \
        --entrypoint emacs \
        hgjt/emacs-texlive:latest \
        -l /root/emacs.el \
        --visit <your-org-file>.org \
        --batch \
        --eval "(org-latex-export-to-pdf)"


### Use Case #3: Integrating *emacs-texlive* With Emacs

*emacs-texlive* can be used as the *PDF processor* for converting org files to
PDF via LaTeX (i.e. it orchestrates the PDF generation by converting the org
file to LaTeX and then running the LaTeX file through a processor). This allows
you to use a local configuration of orgmode to influence the generated LaTeX and
just use the *emacs-texlive* image to process the generated LaTeX file.

First, you will need to ensure that Emacs is able to find the `docker` command
on its path:

```elisp
;; OS-X specific customizations
(when (eq system-type 'darwin)
  ;; configure path for external processes
  (setenv "PATH"
          (concat "/opt/local/bin" ":" "/usr/local/bin" ":" (getenv "PATH")))

  ;; configure path for subprocesses
  (setq exec-path
        (append exec-path '("/opt/local/bin" "/usr/local/bin"))) )
```

Once the path is set up correctly, you will need to set the `org-latex-pdf-process` variable. Here is an example configuration:

```elisp
(eval-after-load "org"
  (lambda ()
    (setq org-agenda-default-appointment-duration 30
          org-export-with-toc nil
          org-export-with-author nil
          org-export-with-title nil
          org-export-with-section-numbers nil
          org-latex-pdf-process '("docker run --rm -v `pwd`:/docs hgjt/emacs-texlive:latest -xelatex /docs/%b")
          org-latex-default-class "simple"
          org-latex-title-command "\\date{} \\maketitle"
          org-latex-listings t)

          (unless (boundp 'org-latex-classes)
            (setq org-latex-classes nil))
          (add-to-list 'org-latex-classes
                       '("simple"
                         "\\documentclass[11pt]{article}
          %% <you custom latex config here>
          %% see docker/root/emacs.el for a more detailed example

          [NO-DEFAULT-PACKAGES]
          [NO-PACKAGES]"
                         ("\\section{%s}" . "\\section*{%s}")
                         ("\\subsection{%s}" . "\\subsection*{%s}")
                         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                         ("\\paragraph{%s}" . "\\paragraph*{%s}")
                         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))) ))
```
