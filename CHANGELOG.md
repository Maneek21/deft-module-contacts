# Changelog

All notable changes to the Contacts module are documented here. Versions follow
[Semantic Versioning](https://semver.org/).

## 1.1.0 — 2026-08-18

### Added

- Companies, Deals, and Activities collections alongside Contacts.
- Declarative record relationships between the four collections.
- Workspace-member ownership and free-form tag fields.
- Status boards for contacts and companies, a deal pipeline and close-date
  timeline, and an activity timeline.
- Default module navigation to the Contacts table.

### Compatibility

- Retained the Contacts `company` text field from 1.0. New data should use the
  normalized `company_id` relationship.

## 1.0.0 — 2026-08-17

- Initial single-collection Contacts directory manifest.
