-- ~/.config/nvim/lua/asteroid/init.lua
-- Neovim Lua syntax highlighting for Asteroid language

local M = {}

-- Define all keywords
local keywords = {
  'and', 'as', 'assert', 'bind', 'break', 'catch', 'data', 'do',
  'elif', 'else', 'end', 'escape', 'eval', 'for', 'from', 'function',
  'global', 'if', 'in', 'is', 'lambda', 'let', 'load', 'loop',
  'not', 'or', 'orwith', 'pattern', 'repeat', 'return', 'step',
  'structure', 'system', 'throw', 'to', 'try', 'until', 'while', 'with'
}

local booleans = { 'true', 'false' }
local todo_keywords = { 'TODO', 'FIX', 'FIXME', 'NOTE', 'Note' }

-- Setup highlight groups
local function setup_highlights()
  local highlights = {
    AsteroidKeyword = { link = 'Statement' },
    AsteroidBoolean = { link = 'Boolean' },
    AsteroidNumber = { link = 'Number' },
    AsteroidFloat = { link = 'Float' },
    AsteroidString = { link = 'String' },
    AsteroidPattern = { link = 'Function' },
    AsteroidDelimiter = { link = 'Delimiter' },
    AsteroidComment = { link = 'Comment' },
    AsteroidTodo = { link = 'Todo' },
    AsteroidEscape = { link = 'SpecialChar' },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

-- Setup syntax regions and matches using Lua patterns and vim.fn.matchadd
local function setup_syntax()
  local buf = vim.api.nvim_get_current_buf()
  
  -- Clear existing syntax
  vim.cmd('syntax clear')
  
  -- Keywords
  for _, keyword in ipairs(keywords) do
    vim.cmd(string.format('syntax keyword AsteroidKeyword %s', keyword))
  end
  
  -- Booleans
  for _, bool in ipairs(booleans) do
    vim.cmd(string.format('syntax keyword AsteroidBoolean %s', bool))
  end
  
  -- Numbers (integers and floats)
  vim.cmd([[syntax match AsteroidNumber '\v<\d+>']])
  vim.cmd([[syntax match AsteroidFloat '\v<\d+\.\d*>']])
  vim.cmd([[syntax match AsteroidFloat '\v<\d*\.\d+>']])
  
  -- Strings with escape sequences
  vim.cmd([[syntax region AsteroidString start='"' skip='\\"' end='"' contains=AsteroidEscape]])
  vim.cmd([[syntax match AsteroidEscape '\\.' contained]])
  
  -- Patterns
  vim.cmd([[syntax match AsteroidPattern '\v\%[a-zA-Z]*']])
  vim.cmd([[syntax match AsteroidPattern '\v@[a-zA-Z_][a-zA-Z0-9_]*']])
  
  -- Delimiters
  vim.cmd([[syntax match AsteroidDelimiter '\*']])
  
  -- Comments
  vim.cmd([[syntax match AsteroidComment '\v--.*$' contains=AsteroidTodo]])
  
  -- TODO keywords in comments
  for _, todo in ipairs(todo_keywords) do
    vim.cmd(string.format('syntax keyword AsteroidTodo %s contained', todo))
  end
  
  -- Special handling for 'escape' keyword (acts as both keyword and delimiter)
  vim.cmd('syntax keyword AsteroidKeyword escape')
end

-- Main setup function
function M.setup(opts)
  opts = opts or {}
  
  -- Prevent double setup
  if vim.b.asteroid_syntax_loaded then
    return
  end
  
  setup_highlights()
  setup_syntax()
  
  -- Set buffer variables
  vim.b.current_syntax = 'asteroid'
  vim.b.asteroid_syntax_loaded = true
  
  -- Set some useful buffer options
  vim.bo.commentstring = '-- %s'
  vim.bo.comments = 'b:--'
end

-- Auto-setup for asteroid files
local function setup_autocommands()
  local augroup = vim.api.nvim_create_augroup('AsteroidSyntax', { clear = true })
  
  vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    group = augroup,
    pattern = '*.ast',
    callback = function()
      vim.bo.filetype = 'asteroid'
      M.setup()
    end,
  })
  
  -- Also handle explicit filetype setting
  vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    pattern = 'asteroid',
    callback = function()
      M.setup()
    end,
  })
end

-- Initialize the plugin
local function init()
  setup_autocommands()
  
  -- If current buffer is already an asteroid file, set it up
  if vim.fn.expand('%:e') == 'ast' then
    vim.schedule(function()
      vim.bo.filetype = 'asteroid'
      M.setup()
    end)
  end
end

-- Call init when the module is loaded
init()

return M
