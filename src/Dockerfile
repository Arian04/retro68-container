# syntax = docker/dockerfile:1

# image args
ARG IMAGE=ghcr.io/autc04/retro68
ARG IMAGE_TAG=latest
ARG UID=1000
ARG GID=1000

##### Project Builder #####
FROM ${IMAGE}:${IMAGE_TAG}

# constants
ENV SCRIPT_NAME="build.sh"
ARG DATA_DIR="/data"
ENV SRC_DIR="${DATA_DIR}/src"
ENV BUILD_DIR="${DATA_DIR}/build"
ARG RETRO68_BUILD_DIR="/Retro68-build"

ARG UID
ARG GID
RUN chown -R "${UID}:${GID}" "${RETRO68_BUILD_DIR}"

COPY --chmod=555 ./${SCRIPT_NAME} /bin

WORKDIR "${DATA_DIR}"

USER ${UID}

VOLUME "${SRC_DIR}"
VOLUME "${BUILD_DIR}"

ENTRYPOINT [ "sh", "-c" ]
CMD ["/bin/${SCRIPT_NAME} \"${SRC_DIR}\" \"${BUILD_DIR}\" "]
