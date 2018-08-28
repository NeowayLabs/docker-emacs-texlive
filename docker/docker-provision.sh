#!/bin/bash
# docker-provision.sh --- Single layer Docker provisioning script.

# ----------------------------------------
# Prepare to install packages and fonts
# ----------------------------------------
sed -i 's/main/main contrib/' /etc/apt/sources.list    # add contrib
apt-get update      # update package lists
apt-get install -y --no-install-recommends curl unzip


# ----------------------------------------
# Install CircleCI dependencies
# ----------------------------------------
apt-get install -y --no-install-recommends \
        git \
        openssh-client \
        tar \
        gzip \
        ca-certificates


# ----------------------------------------
# Install texlive w/XeLaTeX support
# ----------------------------------------
apt-get install -y --no-install-recommends \
        xz-utils \
        xzdec \
        texlive \
        texlive-generic-recommended \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-xetex \
        latexmk
# texlive-fonts-extra


# ----------------------------------------
# Install & configure Emacs
# ----------------------------------------
apt-get install -y --no-install-recommends emacs-nox
emacs --script /root/install-org.el               # install latest org-mode


# ----------------------------------------
# Install fonts
# ----------------------------------------
apt-get install -y --no-install-recommends fontconfig fontconfig-config
mkdir -p /usr/share/fonts/{truetype,opentype}     # create directories for
mkdir -p /tmp/fonts                               # temporary location for downloading fonts
cd /tmp/fonts

for installer in /root/fonts.install.d/*.sh; do
  _name=$(sed -n 's|# Name: \(.*\)|\1|p' $installer)

  if [ -n "$_name" ]; then
    echo ">>>>> Installing $_name"
  fi

  source $installer
done

# clean up font packages
cd /
rm -r /tmp/fonts


# clean up os packages
apt-get purge -y unzip && apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y
