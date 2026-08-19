# Maintainer publishing checklist

## One-time repository publication

The initial workflow is pinned to Deft validator commit
`d9c1530dec444ac7bc863168b472f12e68cfef6f`, the first published core commit containing the finalized 1.1
module validator. Future pins must remain full 40-character commit SHAs; do not
substitute a branch, tag, `master`, or an older validator.

The workflow remains intentionally configurable through a
manual `deft_ref` input or the `DEFT_VALIDATOR_REF` repository variable, but it
always rejects non-SHA revisions.

The screenshots listed in `screenshots/README.md` should be captured from the
validated integrated Deft build. They may be added in the publication commit or
in a follow-up documentation commit; they are never part of the runtime module
artifact.

## Release a module version

1. Run both local validation helpers from clean sibling checkouts.
2. Confirm CI checks the intended pinned Deft validator commit.
3. Confirm `deft.module.json` is the only file selected in Deft's local sideload
   flow.
4. Record the canonical digest in the README and release notes.
5. Tag the exact reviewed source commit with the module version.
6. Vendor that same manifest, source URL, full source commit, license, and
   digest into Deft core through its `module:vendor` workflow.

Never claim a source URL or commit in Deft's lockfile until the public remote
exists and the referenced commit is reachable from it.
