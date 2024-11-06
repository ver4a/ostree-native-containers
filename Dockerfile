FROM quay.io/fedora-ostree-desktops/kinoite:40

# Remove firefox
RUN rpm-ostree override remove firefox firefox-langpacks

# Add rpmfusion repositories
RUN rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install ffmpeg (removing all the -free replacements is required)
RUN rpm-ostree override remove libavcodec-free libavfilter-free libpostproc-free libswresample-free libswscale-free libavutil-free libavformat-free ffmpeg-free libavdevice-free --install=ffmpeg

# Bulk of layered packages

RUN rpm-ostree install virt-manager

# Remove rpm metadata cache

RUN rpm-ostree cleanup --repomd
