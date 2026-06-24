{ lib, ... }:
let
  mkKeymap =
    {
      desc,
      mode ? "n",
      key,
      action ? null,
      rawAction ? null,
    }:
    assert lib.asserts.assertMsg (
      action != null || rawAction != null
    ) "`action` or `rawAction` must be set";
    {
      inherit mode key;
      options = { inherit desc; };
      action = if rawAction == null then action else { __raw = rawAction; };
    };

  mkCmdKeymap =
    {
      desc,
      mode ? "n",
      key,
      cmd,
    }:
    {
      inherit desc mode key;
      action = "<cmd>${cmd}<cr>";
    };

  mkLspBufKeymap =
    {
      desc,
      mode ? "n",
      key,
      lspAction,
    }:
    {
      inherit desc mode key;
      rawAction = "function() vim.lsp.buf.${lspAction}() end";
    };

  mkRustKeymap =
    {
      desc,
      mode ? "n",
      key,
      rustCmd,
    }:
    mkCmdKeymap {
      inherit desc mode key;
      cmd = "RustLsp ${rustCmd}";
    };

in
{
  keymaps = map mkKeymap [
    {
      desc = "'jk' to exit insert mode";
      key = "jk";
      mode = "i";
      action = "<ESC>";
    }
    (mkCmdKeymap {
      desc = "Clear search highlights in normal mode";
      key = "<ESC>";
      cmd = "nohlsearch";
    })
    {
      desc = "Open diagnostic quickfix list";
      key = "<leader>q";
      rawAction = "vim.diagnostic.setloclist";
    }
    {
      desc = "Exit terminal mode";
      key = "<ESC><ESC>";
      mode = "t";
      action = "<C-\\><C-n>";
    }

    # Ease split navigation
    {
      desc = "Move focus to the left window";
      key = "<C-h>";
      action = "<C-w><C-h>";
    }
    {
      desc = "Move focus to the right window";
      key = "<C-l>";
      action = "<C-w><C-l>";
    }
    {
      desc = "Move focus to the lower window";
      key = "<C-j>";
      action = "<C-w><C-j>";
    }
    {
      desc = "Move focus to the upper window";
      key = "<C-k>";
      action = "<C-w><C-k>";
    }

    # Buffer management
    (mkCmdKeymap {
      desc = "Move to the previous buffer";
      key = "<F2>";
      cmd = ":bp";
    })
    (mkCmdKeymap {
      desc = "Move to the next buffer";
      key = "<F4>";
      cmd = ":bn";
    })
    (mkCmdKeymap {
      desc = "Close the current buffer";
      key = "<F3>";
      cmd = ":lua MiniBufremove.delete()";
    })

    # LSP stuff
    (mkLspBufKeymap {
      desc = "Open code actions";
      key = "<leader>a";
      lspAction = "code_action";
    })
    (mkLspBufKeymap {
      desc = "Go to definition";
      key = "gd";
      lspAction = "definition";
    })
    (mkLspBufKeymap {
      desc = "Go to references";
      key = "gD";
      lspAction = "definition";
    })
    (mkLspBufKeymap {
      desc = "Go to implementation";
      key = "gi";
      lspAction = "implementation";
    })
    (mkLspBufKeymap {
      desc = "Go to type";
      key = "gt";
      lspAction = "type_definition";
    })

    # Diagnostics
    (mkCmdKeymap {
      desc = "Diagnostics (Trouble)";
      key = "<leader>xx";
      cmd = "Trouble diagnostics toggle";
    })
    (mkCmdKeymap {
      desc = "Buffer diagnostics (Trouble)";
      key = "<leader>xX";
      cmd = "Trouble diagnostics toggle filter.buf=0";
    })

    # Rust
    (mkRustKeymap {
      desc = "Open Rust code actions";
      key = "<leader>ra";
      rustCmd = "codeAction";
    })
    (mkRustKeymap {
      desc = "Open Rust code actions";
      mode = "v";
      key = "<leader>ra";
      rustCmd = "codeAction";
    })
    (mkRustKeymap {
      desc = "Next Rust Diagnostic";
      key = "<leader>rd";
      rustCmd = "renderDiagnostic";
    })
    (mkRustKeymap {
      desc = "Prev Rust Diagnostic";
      key = "<leader>rD";
      rustCmd = "renderDiagnostic";
    })
    (mkRustKeymap {
      desc = "Open Cargo.toml";
      key = "<leader>rC";
      rustCmd = "openCargo";
    })
  ];
}
