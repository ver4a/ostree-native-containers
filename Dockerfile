FROM quay.io/fedora-ostree-desktops/kinoite:40

RUN rpm-ostree override remove firefox firefox-langpacks

RUN rpm-ostree install virt-manager && rpm-ostree cleanup --repomd
