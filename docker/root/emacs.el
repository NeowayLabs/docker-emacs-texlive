;;; emacs.el --- Local Emacs configuration.
(package-initialize)          ; ensure ELPA packages get loaded


;; personalize based on environment variables, if they exist.
(setq user-mail-address (or (getenv "AUTHOR_EMAIL") user-mail-address)
      user-full-name (or (getenv "AUTHOR_NAME") user-full-name))


(eval-after-load "org"
  (lambda ()
   (setq org-agenda-default-appointment-duration 30
          org-export-with-toc nil
          org-export-with-author nil
          org-export-with-title nil
          org-export-with-section-numbers nil
          org-export-with-smart-quotes t
          org-latex-pdf-process '("latexmk -xelatex %f")
          org-latex-default-class "simple"
          org-latex-title-command "\\date{} \\maketitle")

    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil))
    (add-to-list 'org-latex-classes
                 '("simple"
                   "\\documentclass[11pt]{article}
    \\usepackage{amssymb}                         % AMS math symbols
    \\usepackage{hyperref} % [hidelinks=true]]
    \\usepackage[includeheadfoot,margin=1.5cm]{geometry}
    \\frenchspacing                               % disable additional space after a period
    \\usepackage[parfill]{parskip}                % block paragraphs
    \\usepackage[sf,it,tiny,compact]{titlesec}    % ss/bf titles w/minimal top & bottom margins
    \\titleformat*{\\section}{\\bfseries\\sffamily}
    \\titleformat*{\\subsection}{\\itshape\\sffamily}

    %% BEGIN custom-fonts
    \\usepackage{fontspec}
    \\defaultfontfeatures{Ligatures=TeX}
    \\newfontfamily{\\headerfamily}[
        BoldFont={* SemiBold},%
        BoldItalicFont={* SemiBold Italic}
    ]{Libre Franklin}
    \\setsansfont[
        BoldFont={* SemiBold},
        BoldItalicFont={* SemiBold Italic}
    ]{Libre Franklin}
    \\setromanfont{Libre Caslon Text}
    \\setmonofont{Source Code Pro}
    %% END custom-fonts

    %% BEGIN hacks
    % preserve @macros and define new global macros that expose the title, subtitle,
    % and date outside of the \maketitle command
    \\def \\title#1{\\gdef \\@title{#1} \\gdef \\THETITLE{#1}}
    %% END hacks

    %% BEGIN custom headers/footers
    \\usepackage{fancyhdr}                        % header and footer control
    \\pagestyle{fancy}                            % set header/footer style
    \\fancyhf{}                                   % clear header & footer settings
    \\fancyhead[L]{\\headerfamily{\\textbf{\\THETITLE}}}
    \\fancyfoot[C]{\\thepage}
    \\renewcommand{\\footrulewidth}{0pt}
    %% END customer headers/footers

    [NO-DEFAULT-PACKAGES]
    [NO-PACKAGES]"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))) ))
;;; emacs.el ends here
