#!/bin/bash
# Read JSON-formatted data from stdin
input=$(cat)

# Get fields
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
input_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // "0"')
output_tokens=$(echo "$input" | jq -r '.context_window.total_output_tokens // "0"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // "0"')
duration_ms=$(echo "$input" | jq -r '.cost.total_api_duration_ms // "0"')

# Convert latency to seconds (1 decimal place)
latency=$(echo "scale=1; $duration_ms / 1000" | bc)

# Render status line
echo "${model} | ${input_tokens}/${output_tokens} tokens | Context: ${used}% used | ${latency}s"
