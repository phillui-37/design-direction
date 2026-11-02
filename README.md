# design-direction

A portable agent skill for turning a product brief into a distinctive, usable interface or visual system. It is runtime-independent and works with the user's existing framework, files, design system, and available rendering tools.

## Install

Clone this private repository with an authenticated GitHub account, then run the Bash installer (macOS Bash 3.2 or newer, or Linux):

```sh
gh repo clone phillui-37/design-direction
cd design-direction
bash install.sh --dry-run
bash install.sh
```

Keep the checkout in a stable location. The installer links the whole skill directory, including its reference files, into both runtimes.

The targets are `$HOME/.agents/skills/design-direction` and `$HOME/.config/alma/skills/design-direction`. The links point to this repository, so updates to its files are immediately available. Run `./install.sh --dry-run` to preview or `./install.sh --uninstall` to remove only links that still point to this repository. The installer checks both targets before creating either link and will stop without changing existing files, directories, or unrelated links.

The standard `SKILL.md` frontmatter supports skill discovery by compatible agents and Alma. Open a fresh session or reload skills if your runtime caches its skill list. On another runtime, link or copy this entire directory into that runtime's documented skill location. The design instructions require no Alma-specific tools.

## Use

Ask your agent to apply `design-direction` when creating or refining a product interface, presentation, or visual system. Give it the brief and any relevant existing code, references, brand rules, or copy. The skill asks only blocking questions, builds on existing systems, scopes edits, and inspects rendered output when tools permit.

Example prompts:

- “Use design-direction to redesign this dashboard. Keep the existing React stack and supplied copy.”
- “Use design-direction to explore three directions for this landing page before implementation.”
- “Use design-direction to fix mobile overflow and keyboard focus without changing the visual identity.”

## Update

Run `git pull --ff-only` in the checkout, or copy the updated repository into the same location. Since installed paths are symlinks, they use the new files directly. To move the repository, remove the old links with `./install.sh --uninstall` before installing from the new location.

## Uninstall

Run `./install.sh --uninstall`. It removes only symlinks whose resolved target is this repository. It leaves conflicting paths untouched and reports them.

## Contents

- `SKILL.md`: concise runtime-independent workflow.
- `reference.md`: compact implementation and review checklist.
- `SOURCES.md`: provenance, source URLs, and adaptation notes.
- `LICENSE`: MIT license for original authored material in this package.
- `install.sh`: portable shared-link installer.
