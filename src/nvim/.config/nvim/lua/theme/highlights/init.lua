local sections = {
  require("theme.highlights.ui"),
  require("theme.highlights.syntax"),
  require("theme.highlights.diagnostics"),
  require("theme.highlights.plugins"),
}

return function(hl)
  local function set(groups, attributes)
    for _, group in ipairs(groups) do
      -- Keep definitions independent: later theme integrations may modify them.
      hl[group] = vim.deepcopy(attributes)
    end
  end

  for _, apply in ipairs(sections) do
    apply(set)
  end
end
