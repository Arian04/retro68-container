variable "IMAGE_NAME" {
  default = "retro68"
}

variable "REGISTRY" {
  default = "ghcr.io"
}

variable "NAMESPACE" {
  default = "arian04"
}

variable "IMAGE" {
  default = "${REGISTRY}/${NAMESPACE}/${IMAGE_NAME}"
}

variable "CI" {
  default = false
}

variable "PLATFORMS" {
    default = CI ? [
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64"
  ] : []
}

group "default" {
  targets = ["retro68"]
}

target "retro68" {
  context = "./src"
  dockerfile = "Dockerfile"
  tags = [
    "${IMAGE}:latest"
  ]
  platforms = PLATFORMS
}
