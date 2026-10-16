-- NVChadSettings/init.lua — safer bootstrap + QoL guards

local data_path = vim.fn.stdpath "data"
vim.g.base46_cache = data_path .. "/base46/"
vim.g.mapleader = " "

-- make resize autocmd safer and grouped
local resize_grp = vim.api.nvim_create_augroup("UserVimResized", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
  group = resize_grp,
  pattern = "*",
  callback = function()
    vim.cmd "wincmd ="
  end,
})

-- bootstrap lazy.nvim (with failure notification)
local lazypath = data_path .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  local clone_cmd = { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
  local result = vim.fn.system(clone_cmd)
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to clone lazy.nvim: " .. (result or "unknown error"), vim.log.levels.ERROR)
  else
    vim.notify("Installed lazy.nvim, please restart Neovim", vim.log.levels.INFO)
  end
end

vim.opt.rtp:prepend(lazypath)

-- load lazy config safely
local ok_lazy_conf, lazy_config = pcall(require, "configs.lazy")
if not ok_lazy_conf then
  vim.notify("configs.lazy not found, falling back to default lazy config", vim.log.levels.WARN)
  lazy_config = {}
end

-- load plugins via lazy safely
local ok_lazy, lazy = pcall(require, "lazy")
if not ok_lazy then
  vim.notify("lazy.nvim failed to load — plugin setup skipped", vim.log.levels.ERROR)
else
  pcall(lazy.setup, {
    {
      "NvChad/NvChad",
      lazy = false,
      branch = "v2.5",
      import = "nvchad.plugins",
    },
    { import = "plugins" },
  }, lazy_config)
end

-- load theme files if they exist (avoid error if cache missing)
local function safe_dofile(path)
  if vim.loop.fs_stat(path .. ".lua") then
    local ok, _ = pcall(dofile, path)
    if not ok then
      vim.notify("Error running " .. path, vim.log.levels.WARN)
    end
  end
end

safe_dofile(vim.g.base46_cache .. "defaults")
safe_dofile(vim.g.base46_cache .. "statusline")

-- protected requires so a missing file doesn't break startup
pcall(require, "options")
pcall(require, "autocmds")

vim.schedule(function()
  pcall(require, "mappings")
end)
