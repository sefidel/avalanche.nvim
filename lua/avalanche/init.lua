local M = {}

function M.setup(...)
    require("avalanche.core").setup(...)
end

function M._init()
    M.palette = require("avalanche.core")._init()
end

function M.apply()
    require("avalanche.core").apply()
end

return M
