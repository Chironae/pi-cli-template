#!/bin/bash

echo "🛠️  Running CLI Tool Setup Script"

TOOL_NAME=$(basename "$PWD")

if [[ ! -f your-tool.sh ]]; then
  echo "❌ Could not find your-tool.sh in this folder."
  exit 1
fi

# Rename script
mv your-tool.sh "$TOOL_NAME.sh"

# Update Makefile
sed -i "s/your-tool/$TOOL_NAME/g" Makefile

# Update workflow files
sed -i "s/your-tool/$TOOL_NAME/g" .github/workflows/*.yml

# Update README_CHEATSHEET.md and README.md (if you want)
sed -i "s/your-tool/$TOOL_NAME/g" README_CHEATSHEET.md
sed -i "s/your-tool/$TOOL_NAME/g" README.md

echo "✅ Renamed tool to: $TOOL_NAME"
echo "✅ Updated Makefile and workflow files"
