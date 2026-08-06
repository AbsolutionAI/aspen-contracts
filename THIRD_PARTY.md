# Third-party review

1. Clone repo
2. `make smoke`
3. Confirm no secrets: `make scan` if gitleaks installed
4. Review schemas for accidental env-specific hostnames
