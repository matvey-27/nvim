# Горячие клавиши Neovim

## LSP (Language Server Protocol)

### Навигация по коду
| Комбинация | Действие                          |
|------------|-----------------------------------|
| `K`        | Показать документацию (hover)     |
| `gd`       | Перейти к определению             |
| `gD`       | Перейти к объявлению              |
| `gi`       | Перейти к реализации              |
| `gt`       | Перейти к определению типа        |

### Работа с ошибками
| Комбинация    | Действие                          |
|---------------|-----------------------------------|
| `[d`          | Предыдущая диагностика           |
| `]d`          | Следующая диагностика            |
| `<leader>vd`  | Показать детали ошибки (float)    |
| `<leader>dl`  | Список всех ошибок (loclist)      |

### Рефакторинг
| Комбинация    | Действие                          |
|---------------|-----------------------------------|
| `<leader>vrn` | Переименовать символ              |
| `<leader>vca` | Показать действия с кодом         |
| `<C-h>`       | Помощь по сигнатуре (в insert mode)|

### Документация
| Комбинация    | Действие                          |
|---------------|-----------------------------------|
| `<leader>dk`  | Расширенная документация в float  |

## Автодополнение (nvim-cmp)

| Комбинация    | Действие                          |
|---------------|-----------------------------------|
| `<CR>`        | Подтвердить выбор                 |
| `<Tab>`       | Следующий элемент + прыжок в сниппете |
| `<S-Tab>`     | Предыдущий элемент                |
| `<C-Space>`   | Вызвать автодополнение            |
| `<C-f>`       | Прыжок вперед в сниппете          |
| `<C-b>`       | Прыжок назад в сниппете           |

## Nvim-Tree (Файловый менеджер)

| Комбинация | Действие                          |
|------------|-----------------------------------|
| `<C-b>`    | Открыть/закрыть файловый менеджер |

## Системные команды

| Команда              | Действие                      |
|----------------------|-------------------------------|
| `:LspInfo`          | Информация о LSP серверах     |
| `:LspLog`           | Просмотр логов LSP            |
| `:Mason`            | Управление LSP серверами      |
| `:NvimTreeToggle`   | Переключить файловый менеджер |

## Пояснения:
1. `<leader>` - по умолчанию клавиша `\` (можно изменить через `vim.g.mapleader = " "`)
2. Все LSP-команды имеют префикс `LSP:` в описании
3. Для работы требуется:
   - Установленные LSP-серверы (через `:Mason`)
   - Плагины: lsp-zero, nvim-cmp, luasnip, nvim-tree
4. Диагностика обновляется автоматически при сохранении файла

> Совет: Для проверки всех установленных keymaps используйте `:map`

## Основные режимы
| Комбинация       | Действие                          |
|------------------|-----------------------------------|
| `i`              | Войти в режим вставки             |
| `Esc`/`Ctrl+[`   | Вернуться в нормальный режим      |
| `v`              | Визуальный режим (символы)        |
| `V`              | Визуальный режим (строки)         |
| `Ctrl+v`         | Визуальный режим (блоки)         |

## Навигация
| Комбинация       | Действие                          |
|------------------|-----------------------------------|
| `h` `j` `k` `l`  | Движение: ← ↓ ↑ →                 |
| `w`/`b`          | На начало след./пред. слова       |
| `0`/`$`          | В начало/конец строки             |
| `gg`/`G`         | В начало/конец файла              |
| `Ctrl+u`/`Ctrl+d`| Прокрутка на полэкрана            |

## Управление окнами
| Комбинация          | Действие                     |
|---------------------|------------------------------|
| `:split`/`Ctrl+w s` | Горизонтальное разделение    |
| `:vsplit`/`Ctrl+w v`| Вертикальное разделение      |
| `Ctrl+w h/j/k/l`    | Переключение между окнами    |
| `Ctrl+w =`          | Выровнять размеры окон       |
| `Ctrl+w q`          | Закрыть текущее окно         |
| `Ctrl+w o`          | Оставить только текущее окно |
| `Ctrl+w t`          | Перейти к верхнему окну      |
| `Ctrl+w b`          | Перейти к нижнему окну       |
| `Ctrl+w H`          | Перейти к левому окну        |
| `Ctrl+w L`          | Перейти к правому окну       |
| `Ctrl+w r`          | Поменять местами окна        |
| `Ctrl+w x`          | Обменять текущее окно с другим|
| `Ctrl+w _`          | Увеличить высоту текущего окна|
| `Ctrl+w |`          | Увеличить ширину текущего окна|

## Редактирование
| Комбинация | Действие                     |
|------------|------------------------------|
| `x`        | Удалить символ               |
| `dd`       | Удалить строку               |
| `yy`       | Копировать строку            |
| `p`/`P`    | Вставить после/перед         |
| `u`/`Ctrl+r` | Отменить/вернуть          |

## Работа с файлами
| Комбинация    | Действие                    |
|---------------|-----------------------------|
| `:e <file>`   | Открыть файл                |
| `:w`          | Сохранить                   |
| `:wq`/`ZZ`    | Сохранить и выйти           |
| `:q!`/`ZQ`    | Выйти без сохранения        |

## Markdown
| Комбинация               | Действие                    |
|--------------------------|-----------------------------|
| `:set syntax=markdown`   | Включить подсветку          |
| `:set wrap`              | Перенос строк               |
| `# Заголовок` + `Enter`  | Автоформатирование          |
