local logo = string.rep("\n", 2)
  .. [[
 ██████╗██╗  ██╗██╗██╗     ██╗     ████████╗███████╗██╗   ██╗██╗███╗   ██╗
██╔════╝██║  ██║██║██║     ██║     ╚══██╔══╝██╔════╝██║   ██║██║████╗  ██║
██║     ███████║██║██║     ██║        ██║   █████╗  ██║   ██║██║██╔██╗ ██║
██║     ██╔══██║██║██║     ██║        ██║   ██╔══╝  ╚██╗ ██╔╝██║██║╚██╗██║
╚██████╗██║  ██║██║███████╗███████╗   ██║   ███████╗ ╚████╔╝ ██║██║ ╚████║
 ╚═════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝   ╚═╝   ╚══════╝  ╚═══╝  ╚═╝╚═╝  ╚═══╝
            ..
          ..  ..
                ..
                 ..
                ..
               ..
             ..
    ##       ..    ####
    ##.............##  ##
    ##.............##   ##
    ##.............## ##
    ##.............###
     ##...........##
      #############
]]

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          -- Aquí mantienes tu logo personalizado
          header = logo,
        },
        -- Debes agrupar todo dentro de 'sections' para que Snacks sepa cómo dibujar la pantalla
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          -- Aquí va tu bloque, correctamente anidado
          {
            title = "Archivos Recientes",
            icon = " ",
            section = "recent_files",
            indent = 2,
            padding = 1,
            limit = 5,
          },
          { section = "startup" },
        },
      },
    },
  },

  -- Tu configuración antigua de dashboard-nvim (opcional si Snacks ya te funciona)
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config = opts.config or {}
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
