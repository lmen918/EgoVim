target "default" {
  inherits = ["egovim"]
}

target "egovim" {
  dockerfile = "Dockerfile"
  context = "."
  platforms = ["linux/amd64", "linux/arm64/v8", "windows/amd64"]
  output = ["type=image, push=true"]
}