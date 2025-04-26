# Overview

# Developer Notes

## Why This Practice Project Exists

Lately, I’ve found myself working more with Perl — and feeling some resistance toward it.  
Compared to other languages I use, Perl often feels unstructured, under-supported by modern tooling, and messy in ways that are hard to ignore.

Instead of fighting the language or wishing it were something else, I decided to shift my approach:  
**Focus on improving clarity, structure, and flow inside my own work**, regardless of what the surrounding code looks like.

This practice repository is my attempt to:
- Develop modern, sustainable Perl habits
- Validate ideas for structuring and validating code cleanly
- Create small examples of “green islands” — modules, tests, and practices that feel natural and maintainable
- Reframe my relationship with Perl from frustration to pragmatic craftsmanship

---

## Ideas I’m Testing Here

- **Input Handling**: Always validate function inputs, either via `Params::Validate` or `Params::ValidationCompiler`. Named parameters only. No relying on `@_` directly.

- **Data Structures**: Encapsulate related data into immutable objects using `Moo`, rather than passing around anonymous hashes.

- **Testing Style**: Write modular, grouped tests using `subtest` blocks. Later experiments may include `Test::Routine` or `Test2::V0` to improve isolation and organization.

- **Code Hygiene**: Stick to consistent autoformatting (`Perl::Tidy`) and basic static checking (`Perl::Critic`) to catch low-hanging errors before runtime.

- **Project Layout**: Maintain a clean split between libraries (`lib/`), executables (`script/`), and tests (`t/`). No sprawling monolithic scripts.

- **Tooling**: Keep the environment lightweight but supportive — Either whatever plugins exist in my IDE of choice, alongside Neovim with linting, formatting, LSP where available. No chasing heavyweight IDE features.

- **Philosophy**: Accept that Perl will always have some rough edges. Focus on building clear, maintainable systems within that reality.

---

## Mindset Notes

- Stabilize first — understand what’s happening before reaching for "better" solutions.
- Structure incrementally — greenfield code gets the best habits first.
- Trust the ecosystem — use CPAN modules instead of rebuilding common patterns.
- Keep habits sustainable — favor small, repeatable improvements over massive cleanups.
- Write as if I’m leaving a map for the future me — who may not remember the full context.

---

> **Perl isn't chaos by default. It's material for careful builders**
