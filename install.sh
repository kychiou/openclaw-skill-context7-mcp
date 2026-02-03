#!/bin/bash
# Context7 MCP Installation Script for OpenClaw
# Uses mcporter (OpenClaw built-in) for safety

set -e

echo "📚 Installing Context7 MCP..."

# Check if mcporter is installed (OpenClaw built-in)
if ! command -v mcporter &> /dev/null; then
    echo "❌ mcporter not found. Please install OpenClaw first."
    exit 1
fi

# Install Context7 MCP server via mcporter (safe, verified source)
echo "⏳ Installing @upstash/context7-mcp via mcporter..."
mcporter add context7 --npm @upstash/context7-mcp

# Verify installation
if mcporter list | grep -q "context7"; then
    echo "✅ Context7 MCP installed successfully!"
    echo ""
    echo "📝 Next steps:"
    echo "   1. (Optional) Get API key from https://context7.com"
    echo "   2. Set environment variable for systemd:"
    echo "      systemctl --user set-environment CONTEXT7_API_KEY=your_key"
    echo "   3. Restart OpenClaw:"
    echo "      systemctl --user restart openclaw-gateway"
    echo ""
    echo "💡 Usage examples:"
    echo "   mcporter call context7.get_library_docs --args '{\"library\":\"nextjs\",\"version\":\"latest\"}'"
else
    echo "❌ Installation failed. Please check mcporter configuration."
    exit 1
fi
