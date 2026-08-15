return {
  -- 1. Le decimos a Lazy que descargue el plugin desde GitHub
  name = "Coffe",
  {
    "savq/melange-nvim",
  },

  -- 2. Configuramos LazyVim para que lo aplique como tema principal
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "melange",
    },
  },
}
