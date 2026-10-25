#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Translate
# @raycast.mode fullOutput
# @raycast.packageName Local LLM
# @raycast.description Translate clipboard text using Ollama
# @raycast.icon 🌐

set -euo pipefail

ollama run gemma4:e2b --think=false \
  --keepalive 5m \
  "Translate the following text between Japanese and English. Detect the source language automatically. Preserve technical terminology, proper nouns, and formatting. Output only the translation, without explanations: $(pbpaste)"
