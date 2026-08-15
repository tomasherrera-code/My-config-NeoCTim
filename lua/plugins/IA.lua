return {
  "nickjvandyke/opencode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    -- CONFIGURACIÓN DE OPENCODE.NVIM
    -- Nota: este plugin NO administra modelos ni API keys. Solo se conecta al CLI de opencode,
    -- que ya tienes instalado (/usr/bin/opencode).
    --
    -- Cómo elegir el modelo:
    --   1. Dentro de opencode (TUI) usa el comando  /models  para listar y elegir modelo.
    --   2. O edita ~/.config/opencode/opencode.jsonc y agrega: "model": "opencode/deepseek-v4-flash-free"
    --   3. El modelo gratis recomendado para vibe coding es: opencode/deepseek-v4-flash-free
    --      (rápido, sin API key). Otros gratis: opencode/hy3-free, opencode/nemotron-3-ultra-free.
    --
    -- Para usar modelos de pago (Claude Sonnet 4.5, GPT 5.2, etc.):
    --   corre  opencode  y usa el comando  /connect  para iniciar sesión con tu proveedor.
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        -- Conecta automáticamente a un servidor opencode corriendo; si no existe, lo inicia
        -- en una split vertical (terminal). El plugin ya lo hace por defecto.
        connect = true,
      },
    }

    -- Atajos de teclado para usar OpenCode desde Neovim
    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ")
    end, { desc = "OpenCode: preguntar sobre la selección" })

    vim.keymap.set({ "n", "x" }, "<leader>os", function()
      require("opencode").select()
    end, { desc = "OpenCode: menú de acciones (prompts, comandos, servidores)" })

    vim.keymap.set({ "n", "x" }, "<leader>oc", function()
      return require("opencode").operator("@this ")
    end, { desc = "OpenCode: enviar rango al operador", expr = true })

    vim.keymap.set({ "n", "x" }, "<leader>oe", function()
      require("opencode").ask("Edita la selección para mejorar el código: ")
    end, { desc = "OpenCode: editar selección" })

    vim.keymap.set("n", "<leader>on", function()
      require("opencode").command("session.new")
    end, { desc = "OpenCode: nueva sesión" })

    vim.keymap.set("n", "<leader>ocu", function()
      require("opencode").command("session.undo")
    end, { desc = "OpenCode: deshacer último cambio" })

    vim.keymap.set("n", "<leader>ocr", function()
      require("opencode").command("session.redo")
    end, { desc = "OpenCode: rehacer último cambio" })

    vim.keymap.set("n", "<leader>oci", function()
      require("opencode").command("session.interrupt")
    end, { desc = "OpenCode: interrumpir respuesta" })

    vim.keymap.set("n", "<leader>ocm", function()
      require("opencode").command("session.compact")
    end, { desc = "OpenCode: compactar sesión" })

    vim.keymap.set("n", "<leader>ocs", function()
      require("opencode").command("session.select")
    end, { desc = "OpenCode: elegir sesión" })
  end,
}
