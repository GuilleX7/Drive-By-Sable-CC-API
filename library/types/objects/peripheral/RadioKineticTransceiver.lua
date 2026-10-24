---@meta

---A Drive-By-Sable radio kinetic transceiver linked to a Create kinetic network.
---
---It can inspect and control the transceiver and its network. Methods marked
---`Main-thread synchronized` may wait for the next Minecraft tick before
---returning. Its peripheral type is `radio_kinetic_transceiver`.
---@class DriveBySable.peripherals.RadioKineticTransceiver
local RadioKineticTransceiver = {}

---@alias DriveBySable.peripherals.RadioKineticTransceiver.role
---| '"driver"' # This transceiver supplies rotation to the network.
---| '"receiver"' # This transceiver draws rotation from the network.
---| '"opposed"' # This transceiver turns against the network.
---| '"idle"' # This transceiver is not currently turning.

---@class DriveBySable.peripherals.RadioKineticTransceiver.NetworkMember
---@field x integer World X coordinate.
---@field y integer World Y coordinate.
---@field z integer World Z coordinate.
---@field role DriveBySable.peripherals.RadioKineticTransceiver.role The member's network role.
---@field speed number The member's current speed in RPM.
---@field powered boolean Whether the member is disconnected by redstone or its power frequency.
---@field isSelf boolean Whether this entry represents this transceiver.

---@class DriveBySable.peripherals.RadioKineticTransceiver.NetworkStats
---@field transceivers integer Number of loaded transceivers in the network.
---@field drivers integer Number of drivers.
---@field receivers integer Number of receivers.
---@field opposed integer Number of opposed transceivers.
---@field idle integer Number of idle transceivers.
---@field speed number The lead driver's speed in RPM, or zero when there is no lead driver.
---@field capacity number Total stress capacity supplied by drivers, in SU.
---@field cost number Total stress used by the network, in SU.

---Get this transceiver's role in its kinetic network.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.RadioKineticTransceiver.role role The current role.
function RadioKineticTransceiver.getRole() end

---Check whether this transceiver is linked by cable or radio frequency.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean linked Whether the transceiver has a link.
function RadioKineticTransceiver.isLinked() end

---Check whether redstone or the configured power frequency disconnects this transceiver.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean powered Whether the transceiver is disconnected.
function RadioKineticTransceiver.isPowered() end

---Check whether this transceiver or its network is overstressed.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean overstressed Whether the transceiver is overstressed.
function RadioKineticTransceiver.isOverstressed() end

---Get this transceiver's speed in RPM. The value is negative when it turns in reverse.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number speed The current speed, or zero while overstressed.
function RadioKineticTransceiver.getSpeed() end

---Get the stress impact of this transceiver at its current speed.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number stress The stress impact in SU.
function RadioKineticTransceiver.getStressImpact() end

---Get the stress capacity this transceiver contributes at its current speed.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number stress The contributed stress capacity in SU.
function RadioKineticTransceiver.getStressCapacity() end

---Get the stress used by this transceiver's receiver side.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number stress The stress used in SU, or zero when not receiving.
function RadioKineticTransceiver.getStressUsed() end

---Get the output speed multiple and whether the output is reversed.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return integer multiple The speed multiple, either 1 or 2.
---@return boolean reversed Whether the output is reversed.
function RadioKineticTransceiver.getMode() end

---Set the output speed multiple and direction.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---A negative multiple also requests reverse rotation. An invalid multiple raises
---a Lua error.
---@param multiple integer The speed multiple: 1 or 2, negative for reverse.
---@param reversed? boolean Whether to reverse the output; overrides the sign of `multiple` when provided.
---@return boolean changed Whether the mode was set.
function RadioKineticTransceiver.setMode(multiple, reversed) end

---Enable or disable this transceiver for ComputerCraft control.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---Disabling it takes it out of its network. It is re-enabled when the last
---attached computer detaches.
---@param enabled boolean Whether the transceiver should be enabled.
---@return boolean changed Always `true` when the setting is applied.
function RadioKineticTransceiver.setEnabled(enabled) end

---Check whether the transceiver is enabled for ComputerCraft control.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean enabled Whether the transceiver is enabled.
function RadioKineticTransceiver.isEnabled() end

---Get the loaded members of this transceiver's network.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.RadioKineticTransceiver.NetworkMember[] members The network members, including this transceiver.
function RadioKineticTransceiver.getNetwork() end

---Get aggregate counts and stress values for this transceiver's network.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.RadioKineticTransceiver.NetworkStats stats The network statistics.
function RadioKineticTransceiver.getNetworkStats() end

