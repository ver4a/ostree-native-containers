FROM quay.io/fedora-ostree-desktops/kinoite:40

RUN rpm-ostree override remove firefox firefox-langpacks

RUN rpm-ostree install virt-manager && rpm-ostree cleanup --repomd

RUN rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN rpm-ostree override remove libavcodec-free libavfilter-free libpostproc-free libswresample-free libswscale-free libavutil-free libavformat-free --install=ffmpeg
