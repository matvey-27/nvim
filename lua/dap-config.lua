local dap = require('dap')
local dapui = require('dapui')

-- UI с окнами для переменных, стеков, консоли и т.д.
dapui.setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.40 },        -- переменные
        { id = "breakpoints", size = 0.15 },   -- точки останова
        { id = "stacks", size = 0.25 },        -- стек вызовов
        { id = "watches", size = 0.20 },       -- отслеживаемые выражения
      },
      size = 50,
      position = "left"
    },
    {
      elements = {
        { id = "repl", size = 0.5 },           -- REPL
        { id = "console", size = 0.5 },        -- консоль
      },
      size = 10,
      position = "bottom"
    }
  },
  controls = {
    enabled = true,
    element = "repl",
    icons = {
      pause = "⏸", play = "▶️", step_into = "⤵️", step_over = "⏭",
      step_out = "⤴️", step_back = "⏮", run_last = "🔁", terminate = "⏹",
    },
  }
})

-- Открытие и закрытие UI автоматически
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Адаптер и конфигурация C++
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
  {
    name = "Запуск файла",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Путь к исполняемому файлу: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'Включить красивый вывод (GDB)',
        ignoreFailures = false
      }
    },
  }
}

dap.configurations.c = dap.configurations.cpp
