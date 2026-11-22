local root = ...
local Satellites = dofile(root .. "/kindlesky.koplugin/satellites.lua")
local function eq(a, b, msg) if a ~= b then error(msg .. ": expected " .. tostring(b) .. ", got " .. tostring(a)) end end
local H = 3600
eq(Satellites.backoff(1), 6 * H, "first failure waits 6 h")
eq(Satellites.backoff(2), 12 * H, "second failure waits 12 h")
eq(Satellites.backoff(3), 24 * H, "third failure waits 24 h")
eq(Satellites.backoff(10), 24 * H, "capped at 24 h")
eq(Satellites.backoff(0), 6 * H, "zero treated as first")
eq(Satellites.backoff(nil), 6 * H, "nil treated as first")
print("satellites_test ok")
