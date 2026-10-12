#!/usr/bin/env sh
# Claude Code: add the Localnord MCP server, then run /mcp in Claude Code
# and pick "localnord" to sign in with your Localnord account.
claude mcp add --transport http localnord https://app.localnord.io/api/mcp/mcp
