---@meta

---A Drive-By-Sable hub for Get Creative linked controllers.
---
---The hub exposes channels from bound Get Creative macro controllers, keypads,
---and remotes. Its peripheral type is `intermediate_cable_hub`.
---@class DriveBySable.peripherals.IntermediateCableHub
local IntermediateCableHub = {}

---@alias DriveBySable.peripherals.IntermediateCableHub.channel
---| '"macroUp"'
---| '"macroLeft"'
---| '"macroDown"'
---| '"macroRight"'
---| '"macroArrowUp"'
---| '"macroArrowLeft"'
---| '"macroArrowDown"'
---| '"macroArrowRight"'
---| '"macroL1"'
---| '"macroL2"'
---| '"macroR1"'
---| '"macroR2"'
---| '"macroJump"'
---| '"macroShift"'
---| '"keypad1"'
---| '"keypad2"'
---| '"keypad3"'
---| '"keypad4"'
---| '"keypad5"'
---| '"keypad6"'
---| '"keypad7"'
---| '"keypad8"'
---| '"keypad9"'
---| '"keypadJump"'
---| '"keypadShift"'
---| '"remoteButton"'

--- Check whether a controller channel is currently pressed.
---@param channel DriveBySable.peripherals.IntermediateCableHub.channel A controller channel name.
---@return boolean pressed Whether the channel is currently pressed.
function IntermediateCableHub.getButton(channel) end

---Get the names of the controller channels that are currently pressed.
---@return DriveBySable.peripherals.IntermediateCableHub.channel[] channels The pressed channel names.
function IntermediateCableHub.getPressedButtons() end

---Get the controller channels opened by binding devices to the hub.
---
---The returned channels depend on which controller groups have been opened.
---@return DriveBySable.peripherals.IntermediateCableHub.channel[] channels The currently available channel names.
function IntermediateCableHub.getChannels() end

---Get the prefix used for controller events.
---
---When the prefix is non-empty, the event names are `<prefix>_button` and
---`<prefix>_button_up`. The default prefix is an empty string.
---@return string prefix The current event prefix.
function IntermediateCableHub.getEventPrefix() end

---Set the prefix used for controller events.
---@param prefix string The prefix to prepend to `button` and `button_up`.
function IntermediateCableHub.setEventPrefix(prefix) end

