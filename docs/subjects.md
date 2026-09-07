# Aspen bus subjects (ADR-0003 / ADR-0007)

## Fleet, Edge & Safety (ADR-0003)

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

## Sentinel & Authz (ADR-0007)

| Subject | Purpose | Payload summary |
|---------|---------|----------------|
| `aspen.sentinel.fleet.overview` | Sentinel fleet dashboard | aggregate plants/nodes/status, degraded[] |
| `aspen.sentinel.audit.event` | Durable audit trail | {event_id, actor, action, target, result, ts} |
| `aspen.sentinel.osint.ingest` | Sentinel OSINT pane | source, raw/ref, confidence, tags[] |
| `aspen.sentinel.incident.channel` | Incident bridge (Buzz / Matrix) | incident_id, severity, summary, link |
| `aspen.authz.gate.request` | Authorization gate request | capability, resource, context, proposer_agent_id |
| `aspen.authz.gate.decision` | Dual-human authorization decision | request_id, decision (grant/deny), humans[], note? |
| `aspen.authz.capability.grant` | Capability grant (scoped token) | agent_id, caps[], expires?, scope |

Envelope: `schemas/event-envelope.schema.json`

Example dual-human authorization payload: `schemas/examples/dual-human-authz.json`

### Safety rules (ADR-0003 / ADR-0007)

- All messages use `event-envelope.schema.json` (`id, source, type, time, data`).
- Safety-adjacent subjects (`aspen.authz.*`, `aspen.safety.*`, `aspen.edge.*.propose_act`) emit **only** `propose_act` until two distinct humans authorize via `aspen.edge.<node>.authorize` or `aspen.authz.gate.decision`.
- Gatekeeper layer (BEL-215 / ADR-0009) mediates all real-system access (NATS, ROS2, OPC-UA, Git, etc.).

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