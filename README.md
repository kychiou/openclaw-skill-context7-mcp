# OpenClaw Skill - Context7 MCP

Context7 MCP integration for OpenClaw - Get up-to-date library documentation.

## What is this?

Context7 provides AI assistants with access to the latest documentation for popular libraries and frameworks, reducing hallucinations.

## Installation

```bash
# Install Context7 MCP server
mcporter add context7 --npm @upstash/context7-mcp

# Or use the install script
cd /path/to/openclaw-skill-context7-mcp
chmod +x install.sh
./install.sh
```

## Configuration

Add to your mcporter config (`~/.config/mcporter.json`):

```json
{
  "mcpServers": {
    "context7": {
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "CONTEXT7_API_KEY": "your_api_key_here"
      }
    }
  }
}
```

Get API key from: https://context7.com

## What it provides

AI agents can query documentation:

```bash
# Find library ID
mcporter call context7.resolve-library-id --args '{"query":"nextjs","libraryName":"nextjs"}'

# Query documentation
mcporter call context7.query-docs --args '{"libraryId":"LIBRARY_ID","query":"API usage"}'
```

## Usage Examples

**Android Compose:**
```
User: How to use Column in Android Compose?
AI: mcporter call context7.resolve-library-id --args '{"query":"android compose","libraryName":"android-compose"}'
→ Gets library ID
→ Queries documentation
→ Provides accurate API usage
```

**Next.js:**
```
User: App Router basics?
AI: Resolves Next.js library → Queries documentation → Returns current API info
```

## Supported Libraries

Next.js, React, Vue, Android Compose, Python, Go, Rust, and 100+ more!

## License

MIT
