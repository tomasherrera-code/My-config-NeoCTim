return {
  "pxwg/math-conceal.nvim",
  event = "VeryLazy",
  main = "math-conceal",
  build = "cargo build --release --manifest-path service/Cargo.toml", -- required for graphical equation conceal
  --- @type LaTeXConcealOptions
  opts = {
    conceal = {
      "greek",
      "script",
      "math",
      "font",
      "delim",
      "phy",
    },
    ft = { "plaintex", "tex", "context", "bibtex", "markdown", "typst" },
    opt = {
      conceallevel = 2,
      concealcursor = "n",
    },
    image = {
      enabled = true, -- set true to enable graphical equation conceal
    },
  },
}
