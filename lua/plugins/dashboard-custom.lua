local logo = string.rep("\n", 2)
  .. [[
██████╗██╗  ██╗██╗██╗     ██╗     ████████╗███████╗██╗   ██╗██╗███╗   ██║
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
    ##        ..    ####
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

          keys = {
            -- DAILY WORKFLOW
            { icon = "󰈞 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "󰈔 ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = "󰊄 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "󰏗 ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
            { icon = "󰦛 ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },

            -- MAINTENANCE SUB-MENU
            {
              icon = "󰒓 ",
              key = "c",
              desc = "System & Config",
              action = function()
                local options = {
                  {
                    name = "󰣆  Open Neovim Config",
                    cmd = "lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                  },
                  { name = "󰒲  Plugin Manager (Lazy)", cmd = "Lazy" },
                  { name = "󰧽  Lazy Extras", cmd = "LazyExtras" },
                  { name = "󰚰  Update Plugins", cmd = "Lazy update" },
                }

                vim.ui.select(options, {
                  prompt = "System Configuration",
                  format_item = function(item)
                    return item.name
                  end,
                }, function(selection)
                  if selection then
                    vim.cmd(selection.cmd)
                  end
                end)
              end,
            },

            -- QUIT
            { icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
          },
        }, -- ¡ESTA LLAVE FALTABA PARA CERRAR 'preset'!

        -- Las secciones ordenadas de tu pantalla
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          {
            title = "Recent Files", -- Cambiado a inglés
            icon = "󰋚 ", -- Usando el mismo ícono moderno de tu menú
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

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },

  -- Tu configuración antigua de dashboard-nvim
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config = opts.config or {}
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
