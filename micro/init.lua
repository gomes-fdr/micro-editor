-- Save this file to ~/.config/micro/init.lua
-- Strongly based on Bruno Rocha - http://brunorocha.org/

VERSION = "0.0.3"

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")
local buffer = import("micro/buffer")

function init()
    -- this will modify the bindings.json file
    -- true means overwrite any existing binding
    config.TryBindKey("Alt-o", "lua:initlua.output", true)
end

function output(bp)

    bp:Save()
    local buf = bp.Buf

    _command = {}
    _command["go"] = "go run " .. buf.Path
    _command["python"] = "python " .. buf.Path

    run_action(bp.Buf, _command, "Output", true) -- false=no bottom panel

end

