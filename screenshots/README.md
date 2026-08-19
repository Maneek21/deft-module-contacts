# Screenshot capture contract

Screenshots must be captured from a clean Deft demo workspace running this
exact manifest. Do not add hand-built mockups or captures containing real user,
customer, organization, or workspace data.

Use the fictional records in `../fixtures/demo-records.json` as the visual
content reference. Crop browser chrome where practical, retain enough Deft
navigation to establish that the module feels native, and check text at 100%
zoom before committing.

## Required shots

| Filename | Viewport | What it must prove |
| --- | --- | --- |
| `contacts-table-desktop.png` | 1440 × 1000 | Contacts in the primary sidebar, collection navigation, table columns, related company, owner, and tags |
| `companies-board-desktop.png` | 1440 × 1000 | Status board grouping with native module chrome |
| `deals-pipeline-desktop.png` | 1440 × 1000 | Deal stages, values, company/contact relations, and close dates |
| `activities-timeline-desktop.png` | 1440 × 1000 | Chronological activities and CRM record relationships |
| `contact-detail-mobile.png` | 390 × 844 | Usable responsive record details, activity, relations, and linked tasks |
| `modules-settings-sideload.png` | 1440 × 1000 | Local manifest preview with module id, version, and digest before apply |

## Acceptance checklist

- [ ] Screenshot corresponds to Contacts `1.1.0` and the digest in the root README.
- [ ] Only fictional `.test` fixture content appears.
- [ ] No email, notification, browser profile, token, local path, or developer
      tooling is visible.
- [ ] Loading, empty, error, focus, hover, or selection artifacts do not obscure
      the intended state.
- [ ] Desktop and mobile text remain legible without scaling the image up.
- [ ] PNG metadata has been stripped if the capture tool embeds local details.
