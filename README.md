# EgoVim
A repo intended to be used as a base for building a cross-platform neovim instance within a docker comtainer.

---
## Usage
The `Dockerfile` is built to use an Arch Linux image, install basic dependencies and neovim.

The `docker-compose.yml` file is used to build the image and specifies neovim as a service.
 - The `volumes` section specifies the directories to be mounted to the container. The first entry mounts the repository files to the default neovim config directory and should NOT be changed unless you know what you are doing.
     - The second entry mounts the immediate local parent directory to the container. This is where the user's project files are stored. This can be changed, or more directories can be added to separate mount points.

The `docker-bake.hcl` file is used to build the image for multiple platforms. 
 - The `platforms` section specifies the platforms to build the image for. 
    - If you receive errors about the image's platform not matching the host platform, add your host platform to the list. Also, platforms can be removed from the list if they will not be needed.

---
#### How to Build:
In the root of the repo there are 3 Docker related files:
- `docker-bake.hcl` - the buildx file for building the image on multiple platforms
- `docker-compose.yml` - the file for building the image and container
- `Dockerfile` - the base file for building the image and its dependencies

To build the image and run the container, run the following commands:

---
**BuildX** will build the image for three platforms: linux/amd64, linux/arm64, and linux/arm/v8:
```
docker buildx bake
```
**[Note]:** buildx bake will take a little bit of time to build the image and will produce warnings at the end]

---
**Compose** will run the container with the image built above:
```
docker compose up -d
```

---
Run **Exec** from the root of the repo to start neovim:
```
docker exec -it egovim bash
```

---
Confirm your local directories are mounted to the volume:
```
ls -la /path/to/directory
```

---
Run neovim:
```
nvim
```