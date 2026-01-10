#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Arc(No Reduced Motion)
# @raycast.mode inline
# @raycast.refreshTime 1h

# Optional parameters:
# @raycast.icon https://resources.arc.net/hc/theming_assets/01HZPQZ0F2XCQNFEFY41C54GGW

# Documentation:
# @raycast.description This script opens Arc with --force-prefers-no-reduced-motion option.
# @raycast.author ay4toh5i

open -a "Arc" --args --force-prefers-no-reduced-motion
