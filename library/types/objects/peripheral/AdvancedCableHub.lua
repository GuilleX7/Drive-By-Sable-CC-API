---@meta

---A Drive-By-Sable advanced cable hub connected to a Tweaked Controller.
---
---The hub exposes the controller's fifteen buttons and six axes. Button and
---axis indexes are one-based and follow the order used by Create: Tweaked
---Controllers.
---
---The peripheral type is `advanced_cable_hub`.
---@class DriveBySable.peripherals.AdvancedCableHub
local AdvancedCableHub = {}

---Get the value of a gamepad button.
---
---Button indexes are one-based:
---`1 = A`, `2 = B`, `3 = X`, `4 = Y`, `5 = left shoulder`,
---`6 = right shoulder`, `7 = back`, `8 = start`, `9 = guide`,
---`10 = left stick click`, `11 = right stick click`, `12 = d-pad up`,
---`13 = d-pad right`, `14 = d-pad down`, and `15 = d-pad left`.
---An index outside 1 through 15 raises a Lua error.
---@param index integer A button index from 1 through 15.
---@return boolean pressed Whether the button is currently pressed.
function AdvancedCableHub.getButton(index) end

---Get the indexes of the gamepad buttons that are currently pressed.
---
---The returned indexes are one-based, from 1 through 15.
---@return integer[] buttons One-based indexes of the pressed buttons.
function AdvancedCableHub.getPressedButtons() end

---Get the value of a gamepad axis.
---
---Axis indexes are one-based: `1` through `4` are the left and right stick
---axes, while `5` and `6` are the left and right triggers. Stick values are
---in the range -1 through 1. Trigger values are in the range 0 through 1.
---With full precision disabled, values are quantized to 1/15 increments.
---An index outside 1 through 6 raises a Lua error.
---@param index integer An axis index from 1 through 6.
---@return number value The current axis value.
function AdvancedCableHub.getAxis(index) end

---Change the axis precision mode.
---
---When disabled, axis values use the same 15-step precision as redstone
---output. When enabled, the controller's full-precision values are returned.
---Full precision uses more network bandwidth.
---@param precision boolean Whether to use full-precision axis values.
function AdvancedCableHub.setFullPrecision(precision) end

---Check whether full-precision axis values are enabled.
---@return boolean enabled Whether full precision is enabled.
function AdvancedCableHub.isFullPrecision() end
