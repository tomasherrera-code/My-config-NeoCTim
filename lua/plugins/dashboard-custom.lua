-- ╭──────────────────────────────────────────────────────────────╮
-- │  Dashboard custom — estilo pixel/retro + toque de café ☕      │
-- │  Basado en tu config original, con layout de 2 paneles al     │
-- │  estilo de la imagen de referencia (keys a la izquierda,      │
-- │  archivos/proyectos + visualizer a la derecha).                │
-- ╰──────────────────────────────────────────────────────────────╯

-- Título en pixel-font "CHILL TEVIN" + tacita de café armada con los
-- MISMOS caracteres de bloque (░ ▒ ▄ █ ▀) que usa la fuente del título,
-- para que todo el header se vea como un solo set de "pixel art".
local header = table.concat({
  "",
  " ██████╗██╗  ██╗██╗██╗     ██╗     ████████╗███████╗██╗   ██╗██╗███╗   ██║",
  "██╔════╝██║  ██║██║██║     ██║     ╚══██╔══╝██╔════╝██║   ██║██║████╗  ██║",
  "██║     ███████║██║██║     ██║        ██║   █████╗  ██║   ██║██║██╔██╗ ██║",
  "██║     ██╔══██║██║██║     ██║        ██║   ██╔══╝  ╚██╗ ██╔╝██║██║╚██╗██║",
  "╚██████╗██║  ██║██║███████╗███████╗   ██║   ███████╗ ╚████╔╝ ██║██║ ╚████║",
  " ╚═════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝   ╚═╝   ╚══════╝  ╚═══╝  ╚═╝╚═╝  ╚═══╝",

  "  ( (",
  "    ) )",
  "  ........",
  "  |      |]",
  "        /    ",
  "   `----'",
  "  This is a Coffe for you ☕",
  "",
}, "\n")

-- Frases random para el footer (le da vida cada vez que abrís nvim)
local coffee_quotes = {
  "「 código sin café es solo un borrador 」",
  "「 buffer:save() ok · humano:save() pending 」",
  "「 :wq y a rellenar la taza 」",
  "「 compilando ideas, destilando café 」",
}
math.randomseed(os.time())
local footer_quote = coffee_quotes[math.random(#coffee_quotes)]

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        width = 62,
        pane_gap = 6,

        preset = {
          header = header,
          footer = { footer_quote },

          -- KEYS: orden pensado como el de la referencia (rápido arriba,
          -- mantenimiento abajo). Ajustá los bindings si usan otro picker.
          keys = {
            { icon = "󰈞 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "󰈔 ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = "󰏗 ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
            { icon = "󰊄 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "󰋚 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = "󰒓 ",
              key = "e",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "󰦛 ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },

            -- Submenú extra para mantenimiento / cosas del sistema,
            -- incluye el lanzador de Cava que tenías comentado.
            {
              icon = "󰙵 ",
              key = "S",
              desc = "System & Extras",
              action = function()
                local options = {
                  { name = "󰎆  Open Audio Visualizer (Cava)", cmd = "lua Snacks.terminal('cava')" },
                  { name = "󰚰  Update Plugins", cmd = "Lazy update" },
                  { name = "󰉖  Sync Plugins", cmd = "Lazy sync" },
                  { name = "󰆼  Health Check", cmd = "checkhealth" },
                  { name = "󰧽 LazyExtras", cmd = "LazyExtras" },
                  { name = "󰒲 Lazy", cmd = "Lazy" },
                }
                vim.ui.select(options, {
                  prompt = "System & Extras",
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

            { icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
          },
        },

        -- LAYOUT DE 2 PANELES: izquierda = branding + navegación,
        -- derecha = info reciente + visualizer de audio en vivo.
        sections = {
          -- pane 1 (izquierda)
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },

          -- pane 2 (derecha)
          {
            pane = 2,
            icon = "󰋚 ",
            title = "Archivos Recientes",
            section = "recent_files",
            indent = 2,
            padding = 1,
            limit = 5,
          },
          {
            pane = 2,
            icon = "󰏗 ",
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = 1,
            limit = 4,
          },
          -- Visualizer de audio en vivo (requiere `cava` instalado).
          -- Si no lo tenés / no querés que ande siempre, comentá este
          -- bloque y usalo solo bajo demanda con la opción "S" de arriba.
          {
            pane = 2,
            section = "terminal",
            cmd = "cava",
            height = 22,
            padding = 1,
            indent = 2,
            ttl = 0, -- 0 = mantiene el proceso vivo (no lo mata al perder foco)
          },
        },
      },
    },
    -- Colores propios del dashboard (paleta cálida coral/dorada, tipo
    -- la de la imagen). Se reaplican en cada cambio de colorscheme
    -- para que no te lo pise el tema.
    config = function(_, opts)
      local function set_dashboard_hl()
        local hl = vim.api.nvim_set_hl
        -- Tonos Coffee Lofi Chill Morning
        hl(0, "SnacksDashboardHeader", { fg = "#B88B67", bold = true }) -- Latte Macchiato cálido
        hl(0, "SnacksDashboardFooter", { fg = "#8A7B6E", italic = true }) -- Grano de café apagado
        hl(0, "SnacksDashboardIcon", { fg = "#D4A87C" }) -- Toque de caramelo
        hl(0, "SnacksDashboardDesc", { fg = "#E6DACB" }) -- Espuma de leche de avena
        hl(0, "SnacksDashboardKey", { fg = "#C7885C", bold = true }) -- Canela tostada
        hl(0, "SnacksDashboardSpecial", { fg = "#D4A87C" }) -- Toque de caramelo
        hl(0, "SnacksDashboardTerminal", { fg = "#B88B67" }) -- Latte Macchiato cálido
      end
      set_dashboard_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = set_dashboard_hl })

      require("snacks").setup(opts)
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config = opts.config or {}
      opts.config.header = vim.split(header, "\n")
    end,
  },
}
