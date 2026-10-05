-- Override with NVIM_CLIPBOARD=osc52|wsl|native; default: auto.
local clipboard = vim.env.NVIM_CLIPBOARD or "auto"
if clipboard == "auto" then
  if vim.env.SSH_CONNECTION or vim.env.SSH_TTY then
    clipboard = "osc52"
  elseif vim.fn.has("wsl") == 1 then
    clipboard = "wsl"
  else
    clipboard = "native"
  end
end

if clipboard == "osc52" then
  vim.g.clipboard = "osc52"
elseif clipboard == "wsl" then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
      ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
    },
    cache_enabled = false,
  }
elseif clipboard ~= "native" then
  error("Invalid NVIM_CLIPBOARD: " .. clipboard .. " (expected auto, osc52, wsl, or native)")
end

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.undofile = true
opt.breakindent = true
opt.clipboard = "unnamedplus"
