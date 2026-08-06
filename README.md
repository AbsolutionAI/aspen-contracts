# aspen-contracts

**License:** Apache-2.0  
**Layer:** L0 — shared contracts for the [Aspen Grove](https://github.com/AbsolutionAI/aspen-grove) mesh.

Schemas and subject catalogs so standalone Aspen packages can interoperate when composed into a lab C2.

## What this is
- Event envelope JSON Schema
- NATS subject naming conventions (lab)
- Port registry stubs for compose
- Pointers to PACKAGE_MAP

## What this is not
- Production credentials
- Live Paperclip/Hermes state

## Quickstart
```bash
# validate examples (requires ajv-cli or check-jsonschema)
make smoke
```

## Related
- Meta compose: `aspen-grove`
- Map: AspenOS `docs/PACKAGE_MAP.md`
