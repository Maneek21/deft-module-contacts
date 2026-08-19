# Contributing

By contributing, you agree that your contribution is licensed under this
repository's GNU Affero General Public License v3.0 only
(`AGPL-3.0-only`) terms.

Contacts is a first-party reference module for Deft's declarative module
contract. Contributions should improve the CRM domain model while keeping Deft
core generic.

## Repository contract

- `deft.module.json` is the only runtime artifact.
- Do not add JavaScript, SQL, binaries, remote installers, network fetches, or
  secrets to the runtime package.
- Documentation, fixtures, schemas, validation helpers, and screenshots are
  authoring/review material only.
- Keep every example fictional. Use `.test` for domains and email addresses and
  the reserved 555-01xx range for North American-looking phone numbers.
- Do not commit exports from a real CRM, analytics identifiers, access tokens,
  or screenshots containing personal or workspace data.

## Make a change

1. Edit `deft.module.json`.
2. Update the JSON Schema snapshot if the Deft module contract changed.
3. Update `fixtures/demo-records.json` for collection or field changes.
4. Update the changelog and screenshot shot list.
5. Run `./scripts/validate.ps1` or `./scripts/validate.sh` against a compatible
   sibling Deft checkout.
6. Confirm the formatter produces no diff:

   ```sh
   corepack pnpm --dir ../Deft module:format ../deft-module-contacts
   git diff --exit-code -- deft.module.json
   ```

7. Open a pull request with the previous and new manifest digests.

## Versioning and compatibility

- **Patch:** presentation/search metadata changes that do not invalidate stored
  records.
- **Minor:** additive collections, fields, select options, or views.
- **Major:** a proposed removal, rename, type change, or semantic break. Deft's
  v1 updater may reject these changes; include an explicit data migration and
  rollback design before proposing one.
- Any changed manifest must have a strictly newer semantic version.
- Preserve old fields when an additive normalized field can keep existing data
  readable, as Contacts 1.1 does with `company` and `company_id`.

## Pull-request checklist

- [ ] The authoritative Deft `module:check` command passes.
- [ ] The manifest is canonically formatted and under the Deft size limit.
- [ ] Collection, field, search, relation, navigation, and view references are
      valid.
- [ ] The version and changelog describe the compatibility impact.
- [ ] Fixtures contain only explicitly fictional `.test` data.
- [ ] Screenshots, if changed, contain no real personal or workspace data.
- [ ] No executable runtime artifact, secret, or unreviewed network dependency
      was added.
