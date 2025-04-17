FROM archlinux/archlinux:latest

# Update system and install required packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    curl \
    git \
    neovim \
    ripgrep \
    # Lua requirements
    luarocks \
    # Mason requirements \
    cargo \
    cmake \
    gcc \
    ghostscript \
    imagemagick \
    lazygit \
    make \
    rust \
    tree-sitter \
    # Node.js
    nodejs \
    npm \
    # Ruby requirements
    ruby \
    # Python requirements
    python \
    python-pip \
    python-pynvim \
    python-black \
    python-pylint \
    ripgrep \
    #Additional tools
    bash \
    fd \
    fzf \
    gzip \
    unzip \
    wget \
    # Clipboard support
    xclip \
    wl-clipboard \
    sudo
# Set up language servers and tools
RUN npm install -g typescript typescript-language-server prettier neovim

# Create a non-root user
RUN useradd -m developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \

# Set working directory
WORKDIR /home/developer
USER developer

# Make Neovim directory to mount the github repository config to
RUN mkdir -p ~/.config/nvim