# Localnord MCP server

Manage **Google Business Profile** listings from your AI assistant. The Localnord MCP server connects Claude, ChatGPT, Cursor, VS Code and any other [Model Context Protocol](https://modelcontextprotocol.io) client to your Localnord account: reply to Google reviews, write and publish Google posts, read statistics and rankings, run audits, prepare client reports, in plain language.

```
https://app.localnord.io/api/mcp/mcp
```

- Remote server, Streamable HTTP transport: nothing to install or host
- "Sign in with Localnord" (OAuth 2.1 + PKCE): no key to paste, revocable anytime
- 170+ tools, ready-made prompts and resources
- Granular permissions: read-only, drafts only, review replies, posts, listing edits, paid actions

> "Reply to this week's 5-star reviews on Boulangerie Martin, and show me the drafts for the negative ones."
>
> "Which of my listings lost positions on their main keyword this month?"
>
> "Plan 6 Google posts for December for the Lyon salon and save them as drafts."

## 1. Create your account

[Create a Localnord account](https://app.localnord.io/auth/signup?utm_source=github&utm_medium=readme&utm_campaign=localnord-mcp) (free trial) and connect your Google Business Profile. That's the account your assistant will sign in with.

## 2. Connect your assistant

The first connection opens Localnord in your browser: sign in, choose the permissions, done. Every connection shows up in [**Settings › API › MCP**](https://app.localnord.io/dashboard/settings/api?tab=mcp&utm_source=github&utm_medium=readme&utm_campaign=localnord-mcp), where you can revoke it.

### Claude (web, desktop, mobile)

Settings › Connectors › **Add custom connector**, paste `https://app.localnord.io/api/mcp/mcp`, then **Connect**.

Older Claude Desktop builds without custom connectors can go through [`mcp-remote`](https://www.npmjs.com/package/mcp-remote): [`configs/claude-desktop.json`](configs/claude-desktop.json).

### Claude Code

```bash
claude mcp add --transport http localnord https://app.localnord.io/api/mcp/mcp
```

Then run `/mcp` in Claude Code and pick `localnord` to sign in.

### ChatGPT

Settings › Connectors: turn on developer mode, create a connector with the server URL and choose OAuth.

### Cursor

`~/.cursor/mcp.json` (or `.cursor/mcp.json` in a project), see [`configs/cursor.json`](configs/cursor.json):

```json
{
  "mcpServers": {
    "localnord": { "url": "https://app.localnord.io/api/mcp/mcp" }
  }
}
```

### VS Code (GitHub Copilot)

`.vscode/mcp.json`, see [`configs/vscode.json`](configs/vscode.json):

```json
{
  "servers": {
    "localnord": { "type": "http", "url": "https://app.localnord.io/api/mcp/mcp" }
  }
}
```

### Windsurf

`~/.codeium/windsurf/mcp_config.json`, see [`configs/windsurf.json`](configs/windsurf.json).

### Other clients

Any client that supports remote MCP servers with OAuth works with the URL above. For scripts and automations without an assistant, use the REST API instead: [localnord-node](https://github.com/localnord/localnord-node), [localnord-python](https://github.com/localnord/localnord-python), [n8n and Make templates](https://github.com/localnord/localnord-automation-templates).

## Permissions

You pick them on the consent screen. Each tool requires a minimum permission and the server refuses the rest.

| Scope | What your assistant can do |
|---|---|
| `mcp:read` | Read listings, reviews, statistics, rankings; run quick audits |
| `mcp:write:drafts` | Create post and reply drafts; nothing is published without you |
| `mcp:write:reviews` | Publish replies to Google reviews |
| `mcp:write:content` | Publish posts, upload and delete photos on Google |
| `mcp:write:listing` | Edit hours, description, services and attributes |
| `mcp:write:paid` | Full audits, rank scans, websites (use credits) |
| `mcp:admin` | Everything above plus sensitive actions (SMS, webhooks, client portal) |

## Smaller tool sets

Assistants work better with fewer tools. Add `?toolsets=` to the URL to load only some groups (`core` is always included):

```
https://app.localnord.io/api/mcp/mcp?toolsets=reviews,content
```

Groups: `core`, `reviews`, `content`, `listing`, `analytics`, `prospection`, `agency`.

## What's inside

| Area | Examples of tools |
|---|---|
| Reviews | list and search reviews, draft replies in the listing's language, publish replies, detect fake reviews, review topics |
| Posts and photos | post ideas, post text, publish or schedule posts, photo metadata, photo coverage |
| Listings | hours, special hours, categories, services, attributes, description, sync from Google |
| Analytics | statistics, period comparisons, keywords, local rankings, competitor benchmark, AI visibility |
| Agency | client reports, value proof, client portal, citations, prospect audits |

Ready-made prompts: `reply_to_review_warm`, `reply_to_negative_review`, `weekly_summary`, `monthly_client_report`, `monthly_editorial_plan`, `audit_action_plan`, `review_crisis_management`, `prepare_client_meeting`.

The full, always up-to-date catalog (every tool, its description and required permission) is public: [**app.localnord.io/api/mcp/docs.md**](https://app.localnord.io/api/mcp/docs.md?lang=en). Give that link to your assistant if you want it to plan with the tool list.

## Security

- Each connection is bound to your organization: no other agency's data is reachable.
- Paid or sensitive actions are rate-limited and confirmed before they run.
- Connections are revocable one by one in Settings › API › MCP.

## En français

Le serveur MCP Localnord relie Claude, ChatGPT, Cursor ou VS Code à vos fiches Google Business Profile : réponses aux avis, publications, statistiques, positions, audits, en langage naturel. [Créez votre compte](https://app.localnord.io/auth/signup?utm_source=github&utm_medium=readme&utm_campaign=localnord-mcp) (essai gratuit), ajoutez l'adresse `https://app.localnord.io/api/mcp/mcp` dans votre assistant et connectez-vous avec Localnord. Guide en français : [app.localnord.io/docs/mcp](https://app.localnord.io/docs/mcp).

## License

The configuration files in this repository are [MIT](LICENSE). The Localnord service is subject to its own terms.
