return {
    'Equilibris/nx.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require("nx").setup {}
    end,
    keys = {
      { 'fn', function() require('nx.actions').actions_finder() end, desc = 'NX finder'},
    },
}
