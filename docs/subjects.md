# Aspen bus subjects (ADR-0003)

| Subject | Purpose |
|---------|---------|
| `aspen.fleet.node.register` | Node registration |
| `aspen.fleet.node.heartbeat` | Node heartbeat |
| `aspen.fleet.ops.status` | Ops manager aggregate |
| `aspen.fleet.mission.*` | Swarm mission lifecycle |
| `aspen.edge.<node>.heartbeat` | Optional RRM detail |
| `aspen.edge.<node>.propose_act` | Micro-agent proposals |
| `aspen.edge.<node>.command` | RRM → micro-agent |
| `aspen.safety.estop` | Global e-stop |
| `aspen.safety.clear` | Clear e-stop (human) |

Envelope: `schemas/event-envelope.schema.json`
