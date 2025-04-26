# 🛠️ Neovim Setup Guide for Modern Perl Development

This guide is tailored to support my practice repository focused on modern Perl structure, validation, testing, and maintainability.

---

> Work close to the code. Structure what you touch. Leave everything a little clearer than you found it.


## 🎯 Neovim Priorities for This Project

| Priority                       | Why                                         |
|--------------------------------|---------------------------------------------|
| **Fast startup, no bloat**     | Stay close to the code, avoid distraction   |
| **Perl syntax highlighting**   | Make code more readable                     |
| **Basic LSP integration**      | Jump to definitions, quick diagnostics      |
| **Formatter and linter hooks** | Enforce hygiene without manual overhead     |
| **Async test running**         | Run test files quickly from within Neovim   |
| **Minimal distractions**       | Focus on crafting code, not editor fiddling |

---

## 📦 Neovim Base Setup

### 1. Start from [`kickstart.nvim`](https://github.com/nvim-lua/kickstart.nvim)

```bash
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
```

A clean, minimal starting point.

### 2. Extend init.lua with Perl Support

In your init.lua, add this after plugin setup:

```lua
-- Treesitter for Perl
require('nvim-treesitter.configs').setup {
  ensure_installed = { "perl" },
  highlight = { enable = true },
}

-- LSP configuration for Perl
require('lspconfig').perlls.setup {
  cmd = { "perl", "-MPerl::LanguageServer", "-e", "Perl::LanguageServer::run", "--", "--port", "13603", "--nostdio" },
  filetypes = { "perl" },
  root_dir = require('lspconfig').util.root_pattern('.git', '.perltidyrc'),
}

-- null-ls setup for Perl::Tidy (formatting) and Perl::Critic (linting)
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.perltidy.with({
      command = "perltidy",
    }),
    null_ls.builtins.diagnostics.perlcritic.with({
      command = "perlcritic",
      args = { "--severity", "4", "--theme", "core" },
    }),
  },
})
```

You will need to install these Perl modules:

```bash
cpan Perl::LanguageServer Perl::Tidy Perl::Critic
```

## 🎹 Keymap Cheat Sheet for Perl

| Action                    | 	Keybinding (Suggestion) | 	Notes                          |
|---------------------------|--------------------------|---------------------------------|
| Format current buffer     | <leader>pf               | Trigger Perl::Tidy              | 
 | Lint current buffer       | <leader>pl               | Trigger Perl::Critic            | 
 | Run tests in current file | <leader>tt               | Use vim-test or simple mappings | 
 | Jump to symbol definition | gd                       | via LSP                         | 
 | Find files                | <leader>ff (Telescope)   | Search project files            | 


Example key mappings (inside your init.lua):

```lua
vim.keymap.set('n', '<leader>pf', vim.lsp.buf.format, { desc = 'Format Perl File' })
vim.keymap.set('n', '<leader>pl', function()
  vim.cmd('NullLsInfo') -- simple placeholder; use proper diagnostics when configured
end, { desc = 'Lint Perl File' })

-- Optional if using vim-test
vim.keymap.set('n', '<leader>tt', ':TestFile<CR>', { desc = 'Run test file' })
```

## 🧠 Why Keep It Simple?

* My focus is not mastering my editor — it's mastering clear structure and sustainable habits in Perl.
* Tooling supports flow, but doesn't become the work itself.
* Simple keymaps and minimal config let me stay close to the code and stay in motion.

## 📜 Related Files to Include in the Repository

| File	             | Purpose                              | 
|:------------------|:-------------------------------------|
| .perltidyrc       | Auto-format Perl code consistently   |
| .perlcriticrc     | Enforce baseline static checks       |
| .gitignore        | Clean up artifacts and editor cruft  |
| docs/dev-notes.md | Reflection on goals and tested ideas | 
| README.md         | Project overview and philosophy      | 


