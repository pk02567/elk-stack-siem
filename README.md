# Host-Based SIEM Using the ELK Stack

A SIEM detecting three MITRE ATT&CK techniques on a single-host Ubuntu VM, built on Elasticsearch, Kibana, and Filebeat.

## What it detects

| Technique | ID | Detection Method | Status |
|---|---|---|---|
| SSH Brute Force | T1110 | KQL threshold: >5 failed SSH events/user in 5 min | Confirmed |
| Sudo Privilege Escalation | T1548 | KQL match on unknown-user sudo attempts | Confirmed |
| Log Tampering | T1070.002 | PAM session-closure pattern heuristic | Partial — see Limitations |

## Architecture

Filebeat ships /var/log/auth.log to Elasticsearch. Kibana Stack Rules evaluate the indexed events on a schedule, and alerts fire on threshold breach. Dashboards use Filebeat's built-in [Filebeat System] ECS visualizations, populated with this project's own data.

## Repo contents

- config/ — Elasticsearch, Kibana, and Filebeat configs (all credentials replaced with REDACTED)
- scripts/ — the three attack simulation scripts used to validate detection
- export.ndjson — exported Kibana rule definitions
- SIEM_ELK_Report_Prateek_v2_redacted.docx — full write-up with methodology, results, and evidence screenshots

## How it was validated

Each script was run against the live stack, and rule firing was confirmed directly in Kibana's Alerts view, not assumed from configuration alone.

## Limitations

The T1070.002 rule fires on a PAM session-closure pattern rather than directly on the truncation event, and during testing it also fired on unrelated routine activity, so it's marked partial rather than confirmed.

## Stack

Elasticsearch, Kibana, Filebeat 8.x, Ubuntu (VirtualBox), Bash

## Team

Developed as part of a team project for the Network Security PBL requirement. SIEM design, ELK Stack configuration, detection rule engineering, and validation by Prateek P Ellur.

## Author

Prateek P Ellur — B.Tech CSE (IoT, Cybersecurity & Blockchain), DSATM
