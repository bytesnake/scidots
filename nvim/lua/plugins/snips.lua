return { 
  'Sirver/ultisnips', 
  lazy = false,
  init = function()
    vim.g.UltiSnipsSnippetDirectories = {"snips"}
    vim.g.UltiSnipsExpandTrigger = "<tab>"
  end
}
