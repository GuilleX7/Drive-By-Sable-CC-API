---@meta

---A 100-channel Drive-By-Sable cable bus.
---
---Channels are numbered from 1 through 100 and carry redstone strength values
---from 0 through 15. A power argument may be a boolean (`true` is 15 and
---`false` is 0) or a number, which is clamped to the range 0 through 15.
---
---The peripheral type is `multi_channel_cable_bus`.
---Methods marked `Main-thread synchronized` are marshalled onto Minecraft's main
---server thread and may wait for the next 20 Hz tick before returning.
---@class DriveBySable.peripherals.MultiChannelCableBus
local MultiChannelCableBus = {}

---@alias DriveBySable.peripherals.MultiChannelCableBus.channel integer Channel number from 1 through 100.
---@alias DriveBySable.peripherals.MultiChannelCableBus.power boolean|number A boolean or redstone strength.

---@class DriveBySable.peripherals.MultiChannelCableBus.Connection
---@field x integer X coordinate of the connected sink.
---@field y integer Y coordinate of the connected sink.
---@field z integer Z coordinate of the connected sink.
---@field face string Direction of the connected block face.
---@field liveSinkSignal integer Signal currently present at the sink.
---@field sinkChannel string Module channel at the sink, or an empty string for a plain block face.

---@class DriveBySable.peripherals.MultiChannelCableBus.ChannelStatus
---@field channel integer The channel queried.
---@field configuredOutput integer The value configured by the computer, from 0 through 15.
---@field bridgedInput integer The value arriving from the cable network, from 0 through 15.
---@field intercepted boolean Whether the computer has claimed the incoming signal.
---@field effectiveOutput integer The value currently emitted by this channel.
---@field publishedOutput integer The value published to the cable network.
---@field connectionCount integer Number of cable sinks connected to this channel.
---@field connections DriveBySable.peripherals.MultiChannelCableBus.Connection[] Connected cable sinks.
---@field sourceX? integer X coordinate of this bus. Absent when the bus is not in a level.
---@field sourceY? integer Y coordinate of this bus. Absent when the bus is not in a level.
---@field sourceZ? integer Z coordinate of this bus. Absent when the bus is not in a level.
---@field error? string Present when the bus is not attached to a level.

---Get the number of channels on the bus.
---@return integer count Always 100.
function MultiChannelCableBus.getChannelCount() end

---Set a channel's output power.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@param power DriveBySable.peripherals.MultiChannelCableBus.power Power to set. Numbers are clamped to 0 through 15.
---@return integer power The clamped power now configured on the channel.
function MultiChannelCableBus.setChannel(channel, power) end

---Get a channel's configured output power.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@return integer power The configured power, from 0 through 15.
function MultiChannelCableBus.getChannel(channel) end

---Toggle a channel between off and full power.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@return integer power The new configured power, either 0 or 15.
function MultiChannelCableBus.toggleChannel(channel) end

---Set every channel to the same output power.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param power DriveBySable.peripherals.MultiChannelCableBus.power Power to set. Numbers are clamped to 0 through 15.
---@return integer power The clamped power now configured on every channel.
function MultiChannelCableBus.setAll(power) end

---Clear every channel's configured output.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean cleared Always `true`.
function MultiChannelCableBus.clear() end

---Get the configured output of every channel.
---@return table<integer, integer> channels A map from channel number to power.
function MultiChannelCableBus.getAll() end

---Set a channel's output power.
---
---This is an alias for @{setChannel}.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@param power DriveBySable.peripherals.MultiChannelCableBus.power Power to set. Numbers are clamped to 0 through 15.
---@return integer power The clamped power now configured on the channel.
function MultiChannelCableBus.setOutput(channel, power) end

---Get a channel's configured output power.
---
---This is an alias for @{getChannel}.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@return integer power The configured power, from 0 through 15.
function MultiChannelCableBus.getOutput(channel) end

---Toggle a channel between off and full power.
---
---This is an alias for @{toggleChannel}.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@return integer power The new configured power, either 0 or 15.
function MultiChannelCableBus.toggleOutput(channel) end

---Get the number of cable sinks connected to a channel.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@return integer count The number of connected sinks.
function MultiChannelCableBus.getConnectionCount(channel) end

---Get the configured, bridged, and published state of a channel.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@return DriveBySable.peripherals.MultiChannelCableBus.ChannelStatus status The channel status.
function MultiChannelCableBus.getChannelStatus(channel) end

---Get the signal arriving from the cable network on a channel.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@return integer power The bridged input power, from 0 through 15.
function MultiChannelCableBus.getInput(channel) end

---Get the signals arriving from the cable network on every channel.
---@return table<integer, integer> inputs A map from channel number to bridged input power.
function MultiChannelCableBus.getAllInputs() end

---Claim or release a channel's incoming cable signal.
---
---The returned value is the input that was already present on the channel.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@param intercept boolean Whether the computer should claim the incoming signal.
---@return integer power The bridged input power that was already present.
function MultiChannelCableBus.setIntercept(channel, intercept) end

---Check whether a channel's incoming signal is claimed by the computer.
---@param channel DriveBySable.peripherals.MultiChannelCableBus.channel Channel number from 1 through 100.
---@return boolean intercepted Whether the channel is intercepted.
function MultiChannelCableBus.isIntercepted(channel) end

---Claim or release every channel's incoming cable signal.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param intercept boolean Whether the computer should claim the incoming signals.
---@return boolean updated Always `true`.
function MultiChannelCableBus.setInterceptAll(intercept) end

---An incoming cable signal queues a `cable_bus_input` event on every attached
---computer. The event arguments are the attached peripheral name, channel
---number, signal strength, and whether that channel was intercepted.
---## Example
---```
---local bus = peripheral.find("multi_channel_cable_bus")
---if bus then
---    while true do
---        local _, name, channel, signal, intercepted = os.pullEvent("cable_bus_input")
---        print(name, channel, signal, intercepted)
---    end
---end
---```
