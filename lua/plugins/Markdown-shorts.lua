return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>m", group = "Markdown Tools" },
        { "<leader>mL", group = "LaTeX Math" }, -- Nuestro nuevo submenú
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local map = vim.keymap.set

      -- === MODO NORMAL: ESTRUCTURAS MARKDOWN ===
      map("n", "<leader>m1", "I# <Esc>", { desc = "Título H1 (#)" })
      map("n", "<leader>m2", "I## <Esc>", { desc = "Título H2 (##)" })
      map("n", "<leader>m3", "I### <Esc>", { desc = "Título H3 (###)" })
      map("n", "<leader>ml", "I- <Esc>", { desc = "Viñeta (-)" })
      map("n", "<leader>mq", "I> <Esc>", { desc = "Cita (>)" })
      map("n", "<leader>mc", "I- [ ] <Esc>", { desc = "Checkbox Vacía [ ]" })
      map("n", "<leader>mx", "<cmd>s/\\[ \\]/[x]/<cr><cmd>nohlsearch<cr>", { desc = "Marcar Checkbox [x]" })
      map("n", "<leader>mt", "i| Título 1 | Título 2 |\n|---|---|\n|  |  |<Esc>", { desc = "Insertar Tabla Base" })
      map("n", "<leader>mb", "i```bash\n\n```<Esc>kI", { desc = "Bloque Bash" })
      map("n", "<leader>mh", "o---<Esc>", { desc = "Línea Horizontal (---)" })

      -- === MODO NORMAL: SUBMENÚ LATEX (<leader>mL) ===

      -- Fórmulas compuestas (el cursor queda dentro de la primera llave)
      map("n", "<leader>mLf", "i\\frac{}{}<Esc>F{F{a", { desc = "Fracción" })
      map("n", "<leader>mLr", "i\\sqrt{}<Esc>F{a", { desc = "Raíz Cuadrada" })
      map("n", "<leader>mLi", "i\\int_{}^{}<Esc>F{F{a", { desc = "Integral" })
      map("n", "<leader>mLs", "i\\sum_{}^{}<Esc>F{F{a", { desc = "Sumatoria" })
      map("n", "<leader>mLl", "i\\lim_{x \\to \\infty}<Esc>F{a", { desc = "Límite" })

      -- Símbolos y Constantes comunes
      map("n", "<leader>mLp", "a\\pi ", { desc = "Pi (π)" })
      map("n", "<leader>mLe", "a e^{}<Esc>F{a", { desc = "Euler (e^x)" })
      map("n", "<leader>mL8", "a\\infty ", { desc = "Infinito (∞)" })
      map("n", "<leader>mL=", "a\\approx ", { desc = "Aproximado (≈)" })
      map("n", "<leader>mL!", "a\\neq ", { desc = "Distinto (≠)" })
      map("n", "<leader>mL+", "a\\pm ", { desc = "Más/Menos (±)" })

      -- === MODO VISUAL: MODIFICAR SELECCIONES ===
      map("v", "<leader>mb", 'c**<C-r>"**<Esc>', { desc = "Negrita (**texto**)" })
      map("v", "<leader>mi", 'c*<C-r>"*<Esc>', { desc = "Cursiva (*texto*)" })
      map("v", "<leader>ms", 'c~~<C-r>"~~<Esc>', { desc = "Tachado (~~texto~~)" })
      map("v", "<leader>mc", 'c`<C-r>"`<Esc>', { desc = "Código Inline (`texto`)" })
      map("v", "<leader>mk", 'c[<C-r>"](url)<Esc>F[a', { desc = "Enlace [texto](url)" })

      -- LaTeX (Aplicado a la selección)
      map("v", "<leader>ml", 'c$<C-r>"$<Esc>', { desc = "LaTeX Inline ($...$)" })
      -- Cambié el atajo de LaTeX en bloque a 'me' (math equation) para no chocar con el prefijo 'mL'
      map("v", "<leader>me", 'c$$\n<C-r>"\n$$<Esc>', { desc = "LaTeX Bloque ($$...$$)" })

      -- Alinear Tablas
      map("v", "<leader>ma", ":!column -t -s '|' -o ' | '<CR>", { desc = "Alinear Cuadro/Tabla" })
    end,
  },
}
