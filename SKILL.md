---
name: context7-mcp
description: Context7 MCP - Get up-to-date library documentation to reduce AI hallucinations.
homepage: https://context7.com
metadata:
  openclaw:
    emoji: "📚"
    requires:
      bins: ["mcporter"]
---

# Context7 MCP

Get up-to-date library documentation to reduce AI hallucinations.

## What is Context7?

Context7 is an MCP server that provides AI assistants with access to the latest documentation for popular libraries and frameworks. It helps reduce "hallucinations" by providing accurate, version-specific information.

## Setup

### Configure mcporter with Context7 HTTP endpoint

Add to `~/.config/mcporter.json` or project config:

```json
{
  "mcpServers": {
    "context7": {
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "CONTEXT7_API_KEY": "YOUR_API_KEY"
      }
    }
  }
}
```

Get API key from: https://context7.com

## Usage

### Step 1: Find library ID

```bash
mcporter call context7.resolve-library-id --args '{"query":"android compose","libraryName":"android-compose"}'
```

### Step 2: Query documentation

```bash
mcporter call context7.get-library-docs --args '{"libraryId":"LIBRARY_ID","query":"Column layout"}'
```

### List available tools

```bash
mcporter list context7 --schema
```

## Example Queries

### Android Compose
```bash
mcporter call context7.resolve-library-id --args '{"query":"android compose","libraryName":"android-compose"}'
mcporter call context7.get-library-docs --args '{"libraryId":"/websites/developer_android_develop_ui_compose_designsystems","query":"Column"}'
```

### Next.js
```bash
mcporter call context7.resolve-library-id --args '{"query":"nextjs","libraryName":"nextjs"}'
mcporter call context7.get-library-docs --args '{"libraryId":"LIBRARY_ID","query":"App Router"}'
```

### React
```bash
mcporter call context7.resolve-library-id --args '{"query":"react","libraryName":"react"}'
mcporter call context7.get-library-docs --args '{"libraryId":"LIBRARY_ID","query":"hooks"}'
```

## When to Use

- Writing code with specific library APIs
- Need to verify current API methods
- Avoiding deprecated function usage
- Getting accurate code examples

## Tips

- Use the library ID from step 1 for precise queries
- Ask specific questions (e.g., "Column layout parameters" instead of just "Column")
- Context7 returns code snippets you can reference directly
