return {
  {
    "julienvincent/nvim-paredit",
    config = function()
      local paredit = require("nvim-paredit")
      paredit.setup({
        keys = {
          ["<localleader>w"] = {
            function()
              -- place cursor and set mode to `insert`
              paredit.cursor.place_cursor(
              -- wrap element under cursor with `( ` and `)`
                paredit.wrap.wrap_element_under_cursor("( ", ")"),
                -- cursor placement opts
                { placement = "inner_start", mode = "insert" }
              )
            end,
            "Wrap element insert head",
          },
          ["<localleader>W"] = {
            function()
              paredit.cursor.place_cursor(
                paredit.wrap.wrap_element_under_cursor("(", ")"),
                { placement = "inner_end", mode = "insert" }
              )
            end,
            "Wrap element insert tail",
          },

          -- same as above but for enclosing form
          ["<localleader>i"] = {
            function()
              paredit.cursor.place_cursor(
                paredit.wrap.wrap_enclosing_form_under_cursor("( ", ")"),
                { placement = "inner_start", mode = "insert" }
              )
            end,
            "Wrap form insert head",
          },

          ["<localleader>I"] = {
            function()
              paredit.cursor.place_cursor(
                paredit.wrap.wrap_enclosing_form_under_cursor("(", ")"),
                { placement = "inner_end", mode = "insert" }
              )
            end,
            "Wrap form insert tail",
          }
        }
      })
    end
  }
}
