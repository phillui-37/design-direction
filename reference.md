# Design direction reference

Use this checklist selectively. Fit it to the medium, users, and existing product instead of treating it as a mandatory template.

## Brief and context

- Who is this for, what are they trying to do, and what should be easiest to notice or act on?
- What copy and assets are supplied? Preserve them unless editing is requested.
- What already exists: framework, components, tokens, brand rules, content model, responsive behavior, and interaction patterns?
- Ask only questions whose answers materially change the solution. For unresolved details that do not block progress, make a visible, revisable assumption.

## Direction and system

- Choose a visual idea that fits the product's purpose and audience. A clear direction can be quiet or expressive; distinction comes from coherent choices rather than novelty for its own sake.
- Define the role of each type style, color, spacing step, surface, shape, image treatment, and layout region. Prefer existing tokens and assets where they fit; avoid redundant rules.
- Use imagery that serves the content and has an appropriate source. Avoid generic stock or familiar AI imagery when it weakens the identity. Gradients, common fonts, SVGs, and other techniques are fine when they suit the work.
- For an exploratory brief, present up to three genuinely distinct directions, described in terms the user can compare. For a specific request, proceed with the best-fitting direction.

## Implementation

- Follow the existing stack, component conventions, and file structure. Make the smallest set of coherent changes that delivers the request.
- Use semantic elements and accessible names, labels, keyboard operation, visible focus, and clear states. Do not use color as the sole signal.
- Use fluid dimensions and content-aware breakpoints. Check narrow and wide layouts, long text, and relevant interaction states.
- Respect `prefers-reduced-motion`; animation should explain state or hierarchy, not obstruct use.

## Review and useful heuristics

- When rendering tools are available, inspect the actual page or artifact at useful sizes. Look for clipping, overflow, weak hierarchy, inconsistent spacing, broken assets, focus visibility, and interaction problems. Correct what you can.
- Report rendering limits honestly if actual output could not be inspected.
- Contrast: target WCAG 2.2 AA ratios of 4.5:1 for normal text and 3:1 for large text. Verify text against the surface it appears on.
- Targets: 44×44 CSS pixels is a useful comfort goal. Context and applicable platform guidance matter; smaller controls may be usable when separated and easy to activate.
- Slides: 24px body type in a 1920px-wide design is a starting heuristic, not an invariant. Consider viewing distance and final display size.
- Print: 12pt body type is a starting heuristic. Consider actual trim size, viewing conditions, and the document's purpose.
- Randomized alternatives can help break habitual choices during exploration. Make that variation optional and reproducible where used; choose intentionally in the final design.
