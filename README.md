# Contacts for Deft

The first-party CRM module for [Deft](https://github.com/Maneek21/Deft). It
adds a relationship workspace without adding domain-specific CRM code to Deft
core. The installable product is one declarative file:
[`deft.module.json`](./deft.module.json). It contains no JavaScript, SQL,
remote installer, credentials, or executable payload.

Current release: `1.1.0`

Canonical manifest digest:
`sha256:431d879dd511261346c2d38b1c6341f61eb7878ea4690ca836425b3a0c2c266d`

## What it adds

| Collection | Purpose | Included views |
| --- | --- | --- |
| Contacts | People, roles, ownership, status, tags, and contact history | Table, status board, form, details |
| Companies | Accounts and organizations, industry, ownership, and status | Table, status board, form, details |
| Deals | Opportunity value, stage, close date, company, and primary contact | Pipeline, close timeline, table, form, details |
| Activities | Calls, emails, meetings, and notes related to CRM records | Timeline, table, form, details |

The `company` text field on Contacts remains in the manifest so records made
with Contacts 1.0 stay readable. New records should use the normalized
`company_id` relationship.

## Why it feels native

Deft core renders the manifest, stores its records in the generic multi-tenant
module tables, and applies the same governance used by native Deft data:

- **Defty:** Defty discovers the module schema and uses governed
  `module_record_*` operations. Reads and writes follow the workspace's module
  access and approval settings.
- **MCP:** Deft's MCP endpoint exposes the same schema, query, search, create,
  update, and archive operations. The module itself does not run an MCP server.
- **Universal search:** every collection declares its title, subtitle, and
  searchable fields, so enabled module records appear in Deft search with
  native deep links.
- **Tasks and audit:** records can be linked to tasks, and mutations retain
  Deft's actor, approval, idempotency, revision, and audit controls.

These capabilities come from a compatible Deft runtime. This repository is a
declarative domain model, not an alternate execution environment.

## Install by local sideload

1. Obtain `deft.module.json` from a trusted checkout or tagged release of this
   repository.
2. In Deft, open **Settings → Modules** and choose the local manifest upload.
3. Review the module id (`com.deft.contacts`), version, and digest before
   applying it.
4. Enable the module and choose the appropriate Defty/agent access level for
   the workspace.

Deft v1 intentionally does not install modules from URLs and does not execute
code or assets from a module repository. Do not upload this README, the fixture
data, or the screenshots directory; only upload `deft.module.json`.

## Validate locally

The authoritative validator lives in Deft. With sibling checkouts:

```text
workspace/
├── Deft/
└── deft-module-contacts/
```

run either:

```powershell
./scripts/validate.ps1
```

```sh
./scripts/validate.sh
```

Pass a different Deft checkout as the first argument when needed. The helpers
run `corepack pnpm module:check <this-repository>` from that checkout and verify
the expected `1.1.0` digest. See [CONTRIBUTING.md](./CONTRIBUTING.md) for the
release rules.

## Fixtures and screenshots

[`fixtures/demo-records.json`](./fixtures/demo-records.json) is documentation
data, not an import format. Every person and company is fictional; emails,
websites, and domains use the reserved `.test` suffix, and phone numbers use
the fictional 555-01xx range.

The screenshot capture contract is in
[`screenshots/README.md`](./screenshots/README.md). Screenshots are deliberately
captured from Deft rather than mocked in this repository.

## License

GNU Affero General Public License v3.0 only (`AGPL-3.0-only`). If you modify
this module and make it available to users over a network, AGPL section 13
requires offering those users the corresponding source. See [LICENSE](./LICENSE).
