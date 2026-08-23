return {
  "xiecheesejohn/siyuan.nvim",
  opts = {
    endpoint = "http://127.0.0.1:6806",
    token = vim.env.SIYUAN_TOKEN,
    auth_code = vim.env.SIYUAN_AUTH_CODE,

    -- ¡IMPORTANTE! Cambia esto por el nombre EXACTO de tu libreta en SiYuan.
    -- El código original tenía "生活总结" (Resumen de vida en chino).
    notebook = "NoteBook",
  },
  keys = {
    { "<leader>ys", "<cmd>Siyuan search<cr>", desc = "Buscar en SiYuan" },
    { "<leader>yq", "<cmd>Siyuan quick_switch<cr>", desc = "Cambio rápido SiYuan" },
    { "<leader>yn", "<cmd>Siyuan new<cr>", desc = "Nueva nota SiYuan" },
    { "<leader>yd", "<cmd>Siyuan today<cr>", desc = "Nota de Hoy SiYuan" },
    { "<leader>yw", "<cmd>Siyuan save<cr>", desc = "Guardar nota SiYuan" },
  },
}
