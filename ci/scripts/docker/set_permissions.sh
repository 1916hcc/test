#!/usr/bin/env bash
set -euo pipefail

source /ssd1/E2E/common/env.sh
source ci/scripts/common/log.sh

docker exec "${DOCKER_NAME}" bash -lc "
    set -e
    conda activate ${CONDA_ENV}
    chmod -R 777 /workspace
"