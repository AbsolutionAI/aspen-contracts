# Lab port registry (defaults)

| Port | Service |
|------|---------|
| 3100 | Paperclip blueprint |
| 8788 | Hermes WebUI (if enabled) |
| 8080 | Optional gateway |
| 11434 | Ollama (localhost only) |
| 4222 | NATS (if bundled) |
| 8008 | Matrix homeserver (docs-only demos) |

Override via compose env; keep host firewall tight.
