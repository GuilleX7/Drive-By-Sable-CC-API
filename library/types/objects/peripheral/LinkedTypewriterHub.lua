---@meta

---A Drive-By-Sable cable-connected linked typewriter hub.
---
---This peripheral inherits the linked typewriter's key-code query and adds
---event-prefix and promiscuous-mode controls. Its peripheral type is
---`linked_typewriter_hub`.
---@class DriveBySable.peripherals.LinkedTypewriterHub
local LinkedTypewriterHub = {}

---Get the key codes that are currently pressed on the linked typewriter.
---@return integer[] keyCodes The pressed Minecraft key codes.
---## Example
---```
---local typewriter = peripheral.find("linked_typewriter_hub")
---if typewriter then
---    for _, keyCode in ipairs(typewriter.getPressedKeyCodes()) do
---        print("pressed key", keyCode)
---    end
---end
---```
function LinkedTypewriterHub.getPressedKeyCodes() end

---Get the prefix used for key events.
---
---When the prefix is non-empty, the event names are `<prefix>_key` and
---`<prefix>_key_up`. The default prefix is an empty string.
---@return string prefix The current event prefix.
function LinkedTypewriterHub.getEventPrefix() end

---Set the prefix used for key events.
---@param prefix string The prefix to prepend to `key` and `key_up`.
function LinkedTypewriterHub.setEventPrefix(prefix) end

---Check whether this hub relays key events regardless of cable-channel matches.
---@return boolean enabled Whether promiscuous mode is enabled.
function LinkedTypewriterHub.isInPromiscuousMode() end

---Enable or disable relaying key events regardless of cable-channel matches.
---@param enabled boolean Whether promiscuous mode should be enabled.
function LinkedTypewriterHub.setPromiscuousMode(enabled) end

---A key press queues a `key` event, or `<prefix>_key` when a prefix is set.
---The event arguments are the Minecraft key code and `false` for the repeated
---flag. A key release queues a `key_up` event, or `<prefix>_key_up`, with the
---key code as its only argument.
