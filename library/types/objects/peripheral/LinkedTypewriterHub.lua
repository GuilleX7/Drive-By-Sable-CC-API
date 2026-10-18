---@meta

---A Drive-By-Sable cable-connected linked typewriter hub.
---
---This peripheral inherits the linked typewriter's key-code query and adds
---event-prefix and promiscuous-mode controls, including a key-code filter.
---Its peripheral type is
---`linked_typewriter_hub`.
---@class DriveBySable.peripherals.LinkedTypewriterHub
local LinkedTypewriterHub = {}

---@alias DriveBySable.peripherals.LinkedTypewriterHub.PromiscuousFilterMode
---| '"blacklist"' Exclude the listed key codes from promiscuous mode.
---| '"whitelist"' Relay only the listed key codes in promiscuous mode.

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

---Get whether promiscuous key filtering uses a blacklist or whitelist.
---
---In `blacklist` mode, the configured keys are excluded. In `whitelist` mode,
---only the configured keys are relayed while promiscuous mode is enabled.
---@return DriveBySable.peripherals.LinkedTypewriterHub.PromiscuousFilterMode mode The filter mode.
function LinkedTypewriterHub.getPromiscuousFilterMode() end

---Set whether promiscuous key filtering uses a blacklist or whitelist.
---@param mode DriveBySable.peripherals.LinkedTypewriterHub.PromiscuousFilterMode The filter mode to use. Allowed values are `"blacklist"` and `"whitelist"`.
function LinkedTypewriterHub.setPromiscuousFilterMode(mode) end

---Get the key codes used by the promiscuous filter.
---@return integer[] keyCodes The configured Minecraft key codes.
function LinkedTypewriterHub.getPromiscuousFilterKeys() end

---Set the key codes used by the promiscuous filter.
---
---Pass an array of key codes. You can rely on the key mapping provided by the `keys` table,
---such as `{ keys["a"], keys["b"], keys["c"] }`, or directly using the integer key codes,
---such as `{ 30, 31, 32 }`.
---@param keyCodes integer[] The key codes to include in or exclude from promiscuous events.
function LinkedTypewriterHub.setPromiscuousFilterKeys(keyCodes) end

---A key press queues a `key` event, or `<prefix>_key` when a prefix is set.
---The event arguments are the Minecraft key code and `false` for the repeated
---flag. A key release queues a `key_up` event, or `<prefix>_key_up`, with the
---key code as its only argument.
---When promiscuous mode is enabled, the configured filter determines which
---key codes are relayed, regardless of cable-channel matches.
