# # Neovim Config by matvey-27

Добро пожаловать в персональный конфиг Neovim, построенный на Lua. Здесь собраны лучшие плагины для превращения Neovim в полноценную, быструю и супер удобную IDE

![](./screenshot/Снимок%20экрана%20от%202025-08-23%2011-21-54.png)

### 🚀 Быстрый старт

`git clone https://github.com/matvey-27/nvim ~/.config/nvim`

Требуется **Neovim 0.5+**.
Плагины устанавливаются автоматически при первом запуске.

### 🧩 Основные плагины

| Категория         | Плагины                                                           |
| ----------------- | ----------------------------------------------------------------- |
| Цветовые схемы    | kanagawa.nvim, gruvbox, everforest                                |
| Файловый менеджер | neo-tree.nvim, nvim-web-devicons, nui.nvim, plenary.nvim          |
| Вкладки           | barbar.nvim                                                       |
| Строка статуса    | lualine.nvim                                                      |
| Синтаксис         | nvim-treesitter                                                   |
| LSP               | nvim-lspconfig, mason.nvim, mason-lspconfig.nvim, lsp-zero.nvim   |
| Автодополнение    | nvim-cmp, cmp-nvim-lsp, LuaSnip                                   |
| Поиск             | telescope.nvim                                                    |
| Терминал          | toggleterm.nvim                                                   |
| Отладка           | nvim-dap, nvim-dap-virtual-text, nvim-dap-ui, mason-nvim-dap.nvim |

### Подробнее о каждом плагине

- **Цветовые схемы:**
  
  - `kanagawa.nvim` — японская эстетика
  
  - `gruvbox` — легендарная тёмная тема
  
  - `everforest` — мягкая и зелёная

- **Файловый менеджер:**
  
  - `neo-tree.nvim` — быстрый файловый браузер
  
  - `nvim-web-devicons` — иконки для файлов
  
  - `nui.nvim`, `plenary.nvim` — UI и вспомогательные функции

- **Вкладки:**
  
  - `barbar.nvim` — вкладки буферов

- **Строка статуса:**
  
  - `lualine.nvim` — красивая и кастомная строка статуса

- **Синтаксический анализ:**
  
  - `nvim-treesitter` — современный парсер для кода

- **LSP и автодополнение:**
  
  - `nvim-lspconfig`, `mason.nvim`, `mason-lspconfig.nvim` — настройка и менеджмент LSP серверов
  
  - `lsp-zero.nvim` — быстрое подключение LSP
  
  - `nvim-cmp`, `cmp-nvim-lsp`, `LuaSnip` — автодополнение и сниппеты

- **Поиск:**
  
  - `telescope.nvim` — быстрый fuzzy finder

- **Терминал:**
  
  - `toggleterm.nvim` — терминал внутри Neovim

- **Отладка:**
  
  - `nvim-dap`, `nvim-dap-virtual-text`, `nvim-dap-ui`, `mason-nvim-dap.nvim` — полноценная отладка прямо в редакторе

### 📁 Структура репозитория

- `init.lua` — главный точка входа для всех модулей и плагинов

- `lua/` — отдельные файлы по темам, lsp, файловому менеджеру, отладке и пр.

### 📚 Документация

Вся информация по горячим клавишам, новым командам и настройкам — в `DOCS.md`.

### 🤝 Контакты и обратная связь

**Автор:** matvey-27
Предложения и баги — через Issues или Pull Requests

### ⚡ Быстрый FAQ

- **Где менять настройки?** – В файлах внутри `lua/` и `init.lua`

- **Как добавить свой плагин?** – Добавь в раздел с плагинами в `init.lua`

- **Плагины не ставятся?** – Проверь интернет и версию Neovim

Список плагинов может быть неполным — полный список на GitHub.
