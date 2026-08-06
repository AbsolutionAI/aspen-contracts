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

## MQTT edge topics (BEL-190)

Prefix: `aspen/edge/<node_id>/`

| Topic | Direction |
|-------|-----------|
| `sensor/<name>` | device → adapter |
| `command` | adapter → device |

Bridged into fleet bus by edge RRM / MQTTEdgeAdapter (in-memory lab default).

## Audit log (edge)
RRM durable log is local JSONL (not a NATS subject). Events mirror propose_act / estop for offline forensics.

## LangGraph worker (ADR-0005)
| Subject | Purpose |
|---------|---------|
| `aspen.worker.langgraph.job` | Invoke named graph |
| `aspen.worker.langgraph.result` | Graph summary |
| `aspen.edge.<node>.propose_act` | **Only** act-shaped output from worker |

Paperclip remains aspen-dev orchestration SoR — worker is cognitive plugin only.
