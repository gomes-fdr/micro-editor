local config = import("micro/config")
local shell = import("micro/shell")

function init()
    -- true means overwrite any existing binding to F5
    -- this will modify the bindings.json file
    config.TryBindKey("F5", "lua:initlua.pyrun", true)
end

function pyrun(bp)
    local buf = bp.Buf
    
    if buf:FileType() == "python" then
        -- the true means run in the foreground
        -- the false means send output to stdout (instead of returning it)
        shell.RunInteractiveShell("python " .. buf.Path, true, false)
    end
end-- Save this file to ~/.config/micro/init.lua
