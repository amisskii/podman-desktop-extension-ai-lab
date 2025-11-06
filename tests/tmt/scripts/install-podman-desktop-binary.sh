#!/bin/bash
set -euo pipefail

# **********************************************************************
#  Copyright (C) 2025 Red Hat, Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#  SPDX-License-Identifier: Apache-2.0
# **********************************************************************

echo "TESTTTTT"

# Get the latest prerelease tag
TAG=$(curl -s -H "Accept: application/vnd.github+json" \
     -H "Authorization: Bearer ${GITHUB_TOKEN}" \
     https://api.github.com/repos/podman-desktop/prereleases/releases \
  | jq -r '.[0].tag_name')

echo "Latest tag: ${TAG}"

# Download the latest tar.gz asset
curl -L -o podman-desktop.tar.gz \
  "https://github.com/podman-desktop/prereleases/releases/download/$TAG/podman-desktop-${TAG#v}.tar.gz"

ls

# Extract it
mkdir -p podman-desktop-binary
tar -zxvf podman-desktop.tar.gz -C podman-desktop-binary

echo "Extraction complete"
pwd
ls -al podman-desktop-binary
