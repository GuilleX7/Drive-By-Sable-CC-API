---@meta

---A Drive-By-Sable cable hub connected to a linked controller.
---
---The hub exposes the controller's six buttons as button events and as a list
---of currently pressed button indexes. Button indexes are zero-based:
---`0 = up`, `1 = down`, `2 = left`, `3 = right`, `4 = jump`, and `5 = shift`.
---
---The peripheral type is `cable_hub`.
---@class DriveBySable.peripherals.CableHub
local CableHub = {}

---Get the indexes of the controller buttons that are currently pressed.
---@return integer[] buttons Zero-based button indexes from 0 through 5.
---## Example
---```
---local hub = peripheral.find("cable_hub")
---if hub then
---    for _, button in ipairs(hub.getPressedButtons()) do
---        print("pressed button", button)
---    end
---end
---```
function CableHub.getPressedButtons() end

---Check whether a controller button is currently pressed.
---
---@param button integer A button index from 0 through 5.
---@return boolean pressed Whether the button is currently pressed.
function CableHub.getButton(button) end

---Get the prefix used for controller events.
---
---When the prefix is non-empty, the event names are `<prefix>_button` and
---`<prefix>_button_up`. The default prefix is an empty string.
---@return string prefix The current event prefix.
function CableHub.getEventPrefix() end

---Set the prefix used for controller events.
---@param prefix string The prefix to prepend to `button` and `button_up`.
function CableHub.setEventPrefix(prefix) end

---Controller button press events use the name `button`, or
---`<prefix>_button` when an event prefix is configured. Their arguments are
---the zero-based button index and a boolean indicating whether the button was
---already pressed.
---
---Controller button release events use the name `button_up`, or
---`<prefix>_button_up` when an event prefix is configured. Their only argument
---is the zero-based button index.
