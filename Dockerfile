FROM archlinux:base-devel

# Create a non-root user
RUN useradd -m developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Update system and install required packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    git \
    neovim \
    nodejs \
    npm \
    python \
    python-pip \
    python-pynvim \
    python-black \
    python-pylint \
    ripgrep \
    fd \
    wget \
    unzip \
    sudo
# Set up language servers and tools
RUN npm install -g typescript typescript-language-server prettier neovim

# Set working directory
WORKDIR /home/developer
USER developer

# Make Neovim directory to mount the github repository config to
RUN mkdir -p ~/.config/nvim