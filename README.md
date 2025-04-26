# 📝 Modern Perl Practice Repository

Welcome to my Perl practice project.  

This repository is structured to **develop disciplined habits** when working in Perl, especially in codebases that lack polish, structure, or modern practices. This project follows the principles derived from *Modern Perl (Fourth Edition)*, alongside my personal adaptations for better clarity, modularity, and maintainability.

---

## 🎯 Goals

- Structure Perl code cleanly and predictably.
- Validate and document input contracts explicitly.
- Modularize behavior and isolate responsibilities.
- Write meaningful, isolated, maintainable tests.
- Embrace CPAN libraries for reliability and focus.

---

## 📚 Practices and Principles

| Area                    | Practice                                                                                                 |
|-------------------------|----------------------------------------------------------------------------------------------------------|
| **Project Structure**   | Use `lib/` for modules, `script/` for entry points, `t/` for tests                                       |
| **Input Handling**      | Named arguments unpacked and validated using `Params::Validate` or `Params::ValidationCompiler`          |
| **Data Structures**     | Define DTOs and value objects using `Moo`, with immutable attributes (`is => 'ro'`)                      |
| **Code Hygiene**        | Standardize formatting with `Perl::Tidy`, code quality with `Perl::Critic`                               |
| **Testing Strategy**    | Group related checks with `subtest`, work toward modularized testing with `Test::Routine` or `Test2::V0` |
| **Tooling Philosophy**  | IntelliJ **AND/OR** Lightweight Neovim setup with LSP, async linting, formatting, and test running       |
| **Performance Insight** | Profile code only when necessary, using `Devel::NYTProf`                                                 |

---

## 🛠️ Project Layout

```bash
├── lib/ # Application modules (namespaced) 
│ └── MyApp/ # Structured domain modules 
│ └── ... 
├── script/ # Executable scripts 
│ └── ... 
├── t/ # Test files 
│ └── ... 
├── .perltidyrc # Perl::Tidy config 
├── .perlcriticrc # Perl::Critic config 
└── README.md # This guide

```

---

## 🚦 Development Approach

- **Stabilize**: Understand current behavior. Validate assumptions.
- **Structure**: Introduce modular code and DTOs gradually. Prefer clean contracts over sprawling procedural logic.
- **Expand**: Incrementally adopt modern CPAN tools and practices.
- **Test**: Cover new structures with clear, grouped tests.
- **Refactor**: Optimize structure without changing behavior until stable.

---

## 📜 Guiding Philosophy

> **Perl is not chaos. It is raw material. Craft with clarity, validate intent, compose with care.**  
> *– Stijn's Modern Perl Mantra*

---

## ✅ "Battle Card" Cheat Sheet

1. **Stabilize First**  
2. **Enforce Structure Locally**  
3. **Trust CPAN**  
4. **Incremental Testing**  
5. **Own the Environment**

---

# 📌 Notes

This project is a learning and discipline exercise.  
The practices developed here will also influence how I stabilize and evolve real-world Perl codebases.

---

