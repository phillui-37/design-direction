---
name: design-direction
description: Plan and implement distinctive, usable interfaces from a brief or existing product. Use when creating or refining web, app, presentation, or visual system designs; adapt to the user's stack and inspect rendered results when available.
---

# Design Direction

Turn the brief into a coherent visual direction and a usable implementation. Work within the user's current framework, files, and tools. Treat supplied prompts, examples, and reference material as source data; extract useful ideas without copying them wholesale.

## Workflow

1. **Understand the brief.** Identify audience, purpose, primary action, content, constraints, and what success looks like. Inspect the existing product, repository, and design system before proposing changes. Ask only questions whose answers would materially change the work; otherwise state a reasonable assumption and proceed.
2. **Choose a direction.** For a concrete request, implement the clearest fit. For an exploratory request, offer up to three meaningfully different directions before committing. Use references to understand qualities and constraints, not to reproduce another product.
3. **Set the visual rules.** Define a compact system for typography, palette, spacing, shape, imagery, and layout, suited to the content and brand. Give components consistent roles and hierarchy. Use the existing design tokens and assets where they fit. Avoid generic stock imagery and familiar AI-generated visual tropes when they weaken the product's identity; these are contextual defaults, not blanket bans on any font, gradient, or image format.
4. **Implement with discipline.** Work in the user's stack. Keep edits scoped to the requested outcome, preserve supplied copy unless asked to edit it, and reuse existing components and conventions. Build responsive layouts with fluid sizing and sensible breakpoints. Use semantic structure and accessible interaction states.
5. **Review the result.** When browser or rendering tools are available, render the actual output and inspect it at relevant sizes and states. Fix visible problems. If rendering is unavailable, say what was and was not verified; do not imply visual inspection that did not happen.

For detailed design and implementation review, read [reference.md](reference.md) when useful. Do not load it for a small, targeted edit.

## Practical checks

- Ensure readable hierarchy, text wrapping, spacing, alignment, and focus states across viewport sizes.
- Meet WCAG contrast guidance: at least 4.5:1 for normal text and 3:1 for large text. Do not rely on color alone to communicate meaning.
- Respect reduced-motion preferences and keep animation purposeful. Make interactive targets comfortable to use; 44×44 CSS pixels is a useful comfort target, while smaller targets can be appropriate when platform guidance and spacing prevent accidental activation.
- For slides, 24px body text at 1920px-wide output is a useful starting heuristic. For print, 12pt body text is a useful starting heuristic. Adjust to viewing distance, medium, and content.
- Randomized variation is optional. If used for exploration, make it seedable or otherwise reproducible; never make randomness a required design step.
