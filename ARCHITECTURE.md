# Architecture

Packages depend **upward only** on contracts (no reverse dep from contracts to runtime).

## Event envelope
See `schemas/event-envelope.schema.json`.

## Subjects (lab)
Pattern: `aspen.<domain>.<entity>.<verb>`  
Examples: `aspen.agent.heartbeat.tick`, `aspen.issue.status.changed`

## Ports
See `docs/ports.md` — lab defaults; override in compose.
