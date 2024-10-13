# Tempfile

**Tempfile** is a simple Neovim plugin that allows you to create temporary files directly within your editor.

## Why It's Useful

- **Quick Capture**: Easily save some text aside that you might need in a moment without cluttering your file system.
- **Automatic Cleanup**: No need to manually delete the files; they disappear when you close them.
- **Flexible Configuration**: Choose different file extensions for different use cases (with separate keyboard shortcuts each!), allowing for better DX.

## Installation

### Using Lazy.nvim

```lua
return {
    'ShalevAri/tempfile.nvim',
    config = function()
      require('tempfile').setup({
        extension = '.txt', -- Default file extension
        default_command = "<leader>tt", -- Change the default keyboard shortcut here
        -- Custom keyboard shortcuts for different file extensions
        extensions = {
          ['.md'] = '<leader>tm',
          -- Add more extensions here
        },
      })
    end
  },
```

### Default Configuration for Lazy (Recommended)

```lua
return {
    'ShalevAri/tempfile.nvim',
    config = function()
      require('tempfile').setup({
        extension = '.txt', -- Default file extension
        default_command = "<leader>tt", -- Change the default keyboard shortcut here
        -- Custom keyboard shortcuts for different file extensions
        extensions = {
          ['.md'] = '<leader>tm',
          ['.lua'] = '<leader>tl',
          ['.py'] = '<leader>ty',
          ['.json'] = '<leader>tjj',
          ['.jsonc'] = '<leader>tjc',
          ['.cpp'] = '<leader>tcp',
          ['.cs'] = '<leader>tcs',
          ['.rs'] = '<leader>tr',
        },
      })
    end
  },
```
