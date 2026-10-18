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

---@alias DriveBySable.peripherals.AdvancedCableHub.buttonIndex
---| 1 # A
---| 2 # B
---| 3 # X
---| 4 # Y
---| 5 # Left shoulder
---| 6 # Right shoulder
---| 7 # Back
---| 8 # Start
---| 9 # Guide
---| 10 # Left stick click
---| 11 # Right stick click
---| 12 # D-pad up
---| 13 # D-pad right
---| 14 # D-pad down
---| 15 # D-pad left

---@alias DriveBySable.peripherals.AdvancedCableHub.axisIndex
---| 1 # Stick axis 1
---| 2 # Stick axis 2
---| 3 # Stick axis 3
---| 4 # Stick axis 4
---| 5 # Left trigger
---| 6 # Right trigger

---Get the value of a gamepad button.
---
---An index outside 1 through 15 raises a Lua error.
---@param index DriveBySable.peripherals.AdvancedCableHub.buttonIndex A one-based button index.
---@return boolean pressed Whether the button is currently pressed.
function AdvancedCableHub.getButton(index) end

---Get the indexes of the gamepad buttons that are currently pressed.
---
---The returned indexes are one-based, from 1 through 15.
---@return DriveBySable.peripherals.AdvancedCableHub.buttonIndex[] buttons One-based indexes of the pressed buttons.
function AdvancedCableHub.getPressedButtons() end

---Get the value of a gamepad axis.
---
---Axis indexes are one-based. Stick values are
---in the range -1 through 1. Trigger values are in the range 0 through 1.
---With full precision disabled, values are quantized to 1/15 increments.
---An index outside 1 through 6 raises a Lua error.
---@param index DriveBySable.peripherals.AdvancedCableHub.axisIndex A one-based axis index.
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
