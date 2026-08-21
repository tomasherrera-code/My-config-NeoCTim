return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.icons", -- Proveedor de íconos oficial recomendado
  },
  ft = { "markdown" },
  --  {
  --    "techwizrd/render-latex.nvim",
  --    ft = "markdown",
  --    opts = {},
  --  },
  -- Agregamos la inicialización del corrector ortográfico aquí
  init = function()
    vim.opt.spelllang = { "en", "es" }
    vim.opt.spell = true
  end,

  opts = {
    -- Habilita el soporte para bloques de ecuaciones LaTeX
    latex = {
      enabled = true,
      converter = "latex2text", -- Usa pylatexenc para transformar el código LaTeX en Unicode
      highlight = "RenderMarkdownMath",
      top_pad = 0,
      bottom_pad = 0,
    },
    heading = {
      enabled = true,
      sign = true,
      style = "full",
      icons = { "① ", "② ", "③ ", "④ ", "⑤ ", "⑥ " },
      left_pad = 1,
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
      right_pad = 1,
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱      " },
      checked = { icon = "󰱒      " },
    },
  },
}
