.PHONY: smoke scan
smoke:
	@python3 -c "import json; json.load(open('schemas/event-envelope.schema.json')); json.load(open('schemas/examples/heartbeat.json')); print('smoke ok')"
scan:
	@command -v gitleaks >/dev/null && gitleaks detect -v || echo 'gitleaks not installed; skip'
