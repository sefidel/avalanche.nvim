local M = {
    name = "avalanche",
    options = {
        variant = "night",
        transparent = false,
        color_overrides = {},
    },
}

function M.setup(opts)
    if opts ~= nil then
        M.options = vim.tbl_extend("force", M.options, opts)
    end

    return A
end

-- Internal function for setting up avalanche
function M._init()
    if vim.o.termguicolors ~= true then
        error("Avalanche requires termguicolors to be set!")
    end

    vim.cmd("hi clear")

    vim.g.colors_name = M.name

    if M.options.variant == "day" and vim.o.background ~= "light" then
        vim.notify("Avalanche: variant set to day but background isn't light!", vim.log.levels.WARN)
    end

    local colors = require("avalanche.colors").get(M.options.variant, M.options.transparent)
    local hi_groups = require("avalanche.highlights").get_hi_groups(colors)

    for group, spec in pairs(hi_groups) do
        vim.api.nvim_set_hl(0, group, spec)
    end

    return colors
end

function M.apply()
    vim.api.nvim_command(("colorscheme %s"):format(M.name))
end

return M
