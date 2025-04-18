# EgoVim
A neovim-docker repo for building a cross-plat neovim instance.

### Usage
This repo is intended to be used as a base for building a cross-platform neovim instance.

### Build
In the root of the repo there are 3 Docker related files:
- `Dockerfile` - the base file for building the image and its dependencies
- `docker-compose.yml` - the file for building the image and container
- `docker-bake.hcl` - the bake file for building the image for multiple platforms

To build the image and run the container, run the following commands:

This will build the image for three platforms: linux/amd64, linux/arm64, and linux/arm/v8

```
docker buildx bake
```
**[Note]:** buildx bake will take a bit and produce warnings at the end]

This will run the container with the image built above
```
docker compose up -d
```

From the root of the repo, run the following command to start neovim:
```
docker exec -it egovim bash
```

Confirm your local directories are mounted to the volume:
```
ls -la /path/to/directory
```

Run neovim:
```
nvim
```