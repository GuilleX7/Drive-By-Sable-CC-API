---@meta

---A Drive-By-Sable flight sensor with a 100-channel redstone output bus.
---
---Flight values are returned in world units. Angles are in degrees unless the
---method name ends in `Rad`; angular rates are in degrees per second. Flight
---reads return zero-valued data while the sensor cannot read its ship or world.
---
---The peripheral reports the ComputerCraft types `integrated_flight_sensor`,
---`altitude_sensor`, `velocity_sensor`, `navigation_table`, and
---`gimbal_sensor`. Its primary peripheral type is `integrated_flight_sensor`.
---Methods marked `Main-thread synchronized` are marshalled onto Minecraft's main
---server thread and may wait for the next 20 Hz tick before returning.
---@class DriveBySable.peripherals.IntegratedSensorBus
local IntegratedSensorBus = {}

---@alias DriveBySable.peripherals.IntegratedSensorBus.channel integer Channel number from 1 through 100.
---@alias DriveBySable.peripherals.IntegratedSensorBus.power boolean|number A boolean or redstone strength.
---@alias DriveBySable.peripherals.IntegratedSensorBus.telemetryChannel
---| '"speed_x_pos"'
---| '"speed_x_neg"'
---| '"speed_y_pos"'
---| '"speed_y_neg"'
---| '"speed_z_pos"'
---| '"speed_z_neg"'
---| '"altitude"'
---| '"angle_x_pos"'
---| '"angle_x_neg"'
---| '"angle_y_pos"'
---| '"angle_y_neg"'
---| '"angle_z_pos"'
---| '"angle_z_neg"'

---@class DriveBySable.peripherals.IntegratedSensorBus.Position
---@field x number World X coordinate.
---@field y number World Y coordinate.
---@field z number World Z coordinate.
---@field altitude number Alias for `y`.
---@field dimension string Dimension identifier.

---@class DriveBySable.peripherals.IntegratedSensorBus.Velocity
---@field x number World X velocity.
---@field y number World Y velocity.
---@field z number World Z velocity.
---@field speed number Total speed.
---@field groundSpeed number Horizontal speed.
---@field verticalSpeed number Vertical speed.
---@field forward number Ship-local forward speed.
---@field right number Ship-local right speed.
---@field up number Ship-local up speed.

---@class DriveBySable.peripherals.IntegratedSensorBus.AngularVelocity
---@field pitch number Pitch rate in degrees per second.
---@field roll number Roll rate in degrees per second.
---@field yaw number Yaw rate in degrees per second.
---@field speed number Total angular speed in degrees per second.
---@field units string Always `"degrees_per_second"`.

---@class DriveBySable.peripherals.IntegratedSensorBus.Gimbal
---@field pitch number Pitch angle in degrees.
---@field roll number Roll angle in degrees.
---@field yaw number Yaw angle in degrees.
---@field heading number Heading in degrees.
---@field pitchRate number Pitch rate in degrees per second.
---@field rollRate number Roll rate in degrees per second.
---@field yawRate number Yaw rate in degrees per second.
---@field angularSpeed number Total angular speed in degrees per second.

---@class DriveBySable.peripherals.IntegratedSensorBus.Ship
---@field onShip boolean Whether the sensor is attached to a ship.
---@field id string Ship identifier, or an empty string when unavailable.
---@field name string Ship name, or an empty string when unavailable.

---@class DriveBySable.peripherals.IntegratedSensorBus.Target
---@field active boolean Whether a navigation target is set.
---@field x? number Target X coordinate.
---@field y? number Target Y coordinate.
---@field z? number Target Z coordinate.
---@field distance? number Distance to the target.
---@field horizontalDistance? number Horizontal distance to the target.
---@field bearing? number Bearing to the target in degrees.
---@field elevation? number Elevation to the target in degrees.
---@field relativeAngle? number Relative angle to the target in degrees.

---@class DriveBySable.peripherals.IntegratedSensorBus.Navigation: DriveBySable.peripherals.IntegratedSensorBus.Position
---@field heading number Heading in degrees.
---@field onShip boolean Whether the sensor is attached to a ship.
---@field shipId string Ship identifier, or an empty string when unavailable.
---@field shipName string Ship name, or an empty string when unavailable.
---@field target DriveBySable.peripherals.IntegratedSensorBus.Target Navigation target data.

---@class DriveBySable.peripherals.IntegratedSensorBus.AllData
---@field available boolean Whether flight data was available.
---@field position DriveBySable.peripherals.IntegratedSensorBus.Position Position data.
---@field velocity DriveBySable.peripherals.IntegratedSensorBus.Velocity Velocity data.
---@field gimbal DriveBySable.peripherals.IntegratedSensorBus.Gimbal Gimbal data.
---@field angularVelocity DriveBySable.peripherals.IntegratedSensorBus.AngularVelocity Angular velocity data.
---@field navigation DriveBySable.peripherals.IntegratedSensorBus.Navigation Navigation data.
---@field ship DriveBySable.peripherals.IntegratedSensorBus.Ship Ship data.
---@field target DriveBySable.peripherals.IntegratedSensorBus.Target Navigation target data.
---@field altitude number Current altitude.
---@field airPressure number Current air pressure.
---@field speed number Current total speed.
---@field groundSpeed number Current horizontal speed.
---@field verticalSpeed number Current vertical speed.
---@field gameTime integer Current world game time.

---Get the sensor's altitude.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number altitude The current world Y coordinate.
function IntegratedSensorBus.getHeight() end

---Get the sensor's air pressure.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number pressure The current air pressure.
function IntegratedSensorBus.getAirPressure() end

---Get the sensor's local forward speed.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number velocity The current ship-local forward speed.
function IntegratedSensorBus.getVelocity() end

---Get the sensor's pitch and roll angles in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number[] angles A two-element array containing pitch and roll.
function IntegratedSensorBus.getAngles() end

---Get the relative angle in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number angle The current relative angle.
function IntegratedSensorBus.getRelativeAngle() end

---Get the sensor's altitude.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number altitude The current world Y coordinate.
function IntegratedSensorBus.getAltitude() end

---Get the sensor's position and dimension.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.Position position The current position.
function IntegratedSensorBus.getPosition() end

---Get the sensor's coordinates and dimension.
---
---This returns the same table as @{getPosition}.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.Position coordinates The current coordinates.
function IntegratedSensorBus.getCoordinates() end

---Get the sensor's linear velocity data.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.Velocity velocity The current velocity data.
function IntegratedSensorBus.getVelocityVector() end

---Get the sensor's total speed.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number speed The current total speed.
function IntegratedSensorBus.getSpeed() end

---Get the sensor's horizontal speed.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number speed The current ground speed.
function IntegratedSensorBus.getGroundSpeed() end

---Get the sensor's vertical speed.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number speed The current vertical speed.
function IntegratedSensorBus.getVerticalSpeed() end

---Get the sensor's orientation and gimbal rates.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.Gimbal gimbal The current gimbal data.
function IntegratedSensorBus.getGimbal() end

---Get the sensor's orientation and gimbal rates.
---
---This returns the same table as @{getGimbal}.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.Gimbal orientation The current orientation data.
function IntegratedSensorBus.getOrientation() end

---Get the pitch angle in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number pitch The current pitch.
function IntegratedSensorBus.getPitch() end

---Get the roll angle in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number roll The current roll.
function IntegratedSensorBus.getRoll() end

---Get the yaw angle in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number yaw The current yaw.
function IntegratedSensorBus.getYaw() end

---Get the heading in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number heading The current heading.
function IntegratedSensorBus.getHeading() end

---Get navigation data, including position, ship, and target information.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.Navigation navigation The current navigation data.
function IntegratedSensorBus.getNavigation() end

---Get information about the ship containing the sensor.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.Ship ship The current ship data.
function IntegratedSensorBus.getShip() end

---Check whether the sensor is attached to a ship.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean onShip Whether the sensor is attached to a ship.
function IntegratedSensorBus.isOnShip() end

---Get the world X coordinate.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number x The current world X coordinate.
function IntegratedSensorBus.getX() end

---Get the world Y coordinate.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number y The current world Y coordinate.
function IntegratedSensorBus.getY() end

---Get the world Z coordinate.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number z The current world Z coordinate.
function IntegratedSensorBus.getZ() end

---Set a navigation target.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param x number Target world X coordinate.
---@param y number Target world Y coordinate.
---@param z number Target world Z coordinate.
---@return boolean changed Whether the target changed.
---## Example
---```
---local sensor = peripheral.find("integrated_flight_sensor")
---if sensor then
---    sensor.setTarget(0, 120, 0)
---    print(sensor.getDistanceToTarget())
---end
---```
function IntegratedSensorBus.setTarget(x, y, z) end

---Clear the navigation target.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean cleared Whether a target was cleared.
function IntegratedSensorBus.clearTarget() end

---Check whether a navigation target is set.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean hasTarget Whether a target is active.
function IntegratedSensorBus.hasTarget() end

---Get the current navigation target.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.Target target The target data.
function IntegratedSensorBus.getTarget() end

---Get the distance to the navigation target.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number distance The distance to the target.
function IntegratedSensorBus.getDistanceToTarget() end

---Get the horizontal distance to the navigation target.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number distance The horizontal distance to the target.
function IntegratedSensorBus.getHorizontalDistanceToTarget() end

---Get the bearing to the navigation target in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number bearing The bearing to the target.
function IntegratedSensorBus.getBearingToTarget() end

---Get the elevation to the navigation target in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number elevation The elevation to the target.
function IntegratedSensorBus.getElevationToTarget() end

---Get all flight data in one table.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.AllData data The current flight data.
function IntegratedSensorBus.getAll() end

---Get pitch, roll, yaw, and angular speed data.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return DriveBySable.peripherals.IntegratedSensorBus.AngularVelocity angularVelocity The current angular velocity data.
function IntegratedSensorBus.getAngularVelocity() end

---Get the pitch rate in degrees per second.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number rate The current pitch rate.
function IntegratedSensorBus.getPitchRate() end

---Get the roll rate in degrees per second.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number rate The current roll rate.
function IntegratedSensorBus.getRollRate() end

---Get the yaw rate in degrees per second.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number rate The current yaw rate.
function IntegratedSensorBus.getYawRate() end

---Get the total angular speed in degrees per second.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number speed The current angular speed.
function IntegratedSensorBus.getAngularSpeed() end

---Get the number of redstone output channels.
---@return integer count Always 100.
function IntegratedSensorBus.getChannelCount() end

---Set a redstone output channel.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@param power DriveBySable.peripherals.IntegratedSensorBus.power Power to set. Numbers are clamped to 0 through 15.
---@return integer power The clamped power now configured on the channel.
function IntegratedSensorBus.setChannel(channel, power) end

---Get a redstone output channel.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@return integer power The configured power, from 0 through 15.
function IntegratedSensorBus.getChannel(channel) end

---Toggle a redstone output channel between off and full power.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@return integer power The new configured power, either 0 or 15.
function IntegratedSensorBus.toggleChannel(channel) end

---Set every redstone output channel to the same power.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param power DriveBySable.peripherals.IntegratedSensorBus.power Power to set. Numbers are clamped to 0 through 15.
---@return integer power The clamped power now configured on every channel.
function IntegratedSensorBus.setAllChannels(power) end

---Clear every redstone output channel.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean cleared Always `true`.
function IntegratedSensorBus.clearChannels() end

---Get the configured power of every redstone output channel.
---@return table<integer, integer> channels A map from channel number to power.
function IntegratedSensorBus.getAllChannels() end

---Set a redstone output channel.
---
---This is an alias for @{setChannel}.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@param power DriveBySable.peripherals.IntegratedSensorBus.power Power to set. Numbers are clamped to 0 through 15.
---@return integer power The clamped power now configured on the channel.
function IntegratedSensorBus.setOutput(channel, power) end

---Get a redstone output channel.
---
---This is an alias for @{getChannel}.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@return integer power The configured power, from 0 through 15.
function IntegratedSensorBus.getOutput(channel) end

---Toggle a redstone output channel between off and full power.
---
---This is an alias for @{toggleChannel}.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@return integer power The new configured power, either 0 or 15.
function IntegratedSensorBus.toggleOutput(channel) end

---Get pitch and roll angles in radians.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number[] angles A two-element array containing pitch and roll.
function IntegratedSensorBus.getAnglesRad() end

---Get the relative angle in radians.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number angle The current relative angle in radians.
function IntegratedSensorBus.getRelativeAngleRad() end

---Get the relative angle centered around zero, in degrees.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number angle The centered relative angle, from -180 through 180 degrees.
function IntegratedSensorBus.getSignedRelativeAngle() end

---Get the relative angle centered around zero, in radians.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return number angle The centered relative angle in radians.
function IntegratedSensorBus.getSignedRelativeAngleRad() end

---Get the signal arriving from the cable network on a channel.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@return integer power The bridged input power, from 0 through 15.
function IntegratedSensorBus.getInput(channel) end

---Get the signals arriving from the cable network on every channel.
---@return table<integer, integer> inputs A map from channel number to bridged input power.
function IntegratedSensorBus.getAllInputs() end

---Claim or release a channel's incoming cable signal.
---The returned value is the input that was already present on the channel.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@param intercept boolean Whether the computer should claim the incoming signal.
---@return integer power The bridged input power that was already present.
function IntegratedSensorBus.setIntercept(channel, intercept) end

---Check whether a channel's incoming signal is claimed by the computer.
---@param channel DriveBySable.peripherals.IntegratedSensorBus.channel Channel number from 1 through 100.
---@return boolean intercepted Whether the channel is intercepted.
function IntegratedSensorBus.isIntercepted(channel) end

---Claim or release every channel's incoming cable signal.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param intercept boolean Whether the computer should claim the incoming signals.
---@return boolean updated Always `true`.
function IntegratedSensorBus.setInterceptAll(intercept) end

---Get the maximum speed used by the sensor display.
---@return integer speed The configured maximum speed, from 1 through 50.
function IntegratedSensorBus.getMaxSpeed() end

---Set the maximum speed used by the sensor display.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param speed integer The requested maximum speed, clamped to 1 through 50.
---@return integer speed The clamped maximum speed.
function IntegratedSensorBus.setMaxSpeed(speed) end

---Get the maximum absolute gimbal angle.
---@return integer angle The configured maximum angle, from 0 through 90 degrees.
function IntegratedSensorBus.getMaxAngle() end

---Set the maximum absolute gimbal angle.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param angle integer The requested maximum angle, clamped to 0 through 90 degrees.
---@return integer angle The clamped maximum angle.
function IntegratedSensorBus.setMaxAngle(angle) end

---Get the lower and upper altitude display limits.
---@return integer lower The lower limit, from -64 through 320.
---@return integer upper The upper limit, from -64 through 320.
function IntegratedSensorBus.getAltitudeRange() end

---Set the lower and upper altitude display limits.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param lower integer Requested lower limit, clamped to -64 through 320.
---@param upper integer Requested upper limit, clamped to -64 through 320.
---@return integer lower The clamped lower limit.
---@return integer upper The clamped upper limit.
function IntegratedSensorBus.setAltitudeRange(lower, upper) end

---Check whether telemetry uses the sensor's local frame.
---@return boolean localFrame Whether local-frame telemetry is enabled.
function IntegratedSensorBus.isLocalFrame() end

---Set whether telemetry uses the sensor's local frame.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param localFrame boolean Whether local-frame telemetry should be enabled.
---@return boolean localFrame The value that was set.
function IntegratedSensorBus.setLocalFrame(localFrame) end

---Restore the default telemetry display settings.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@return boolean reset Always `true`.
function IntegratedSensorBus.resetTelemetrySettings() end

---Get the latest signal strength for a telemetry channel.
---@param channel string Telemetry channel name.
---@return integer signal Signal strength, from 0 through 15.
function IntegratedSensorBus.getTelemetrySignal(channel) end

---Get the latest signal strength for every telemetry channel.
---@return table<DriveBySable.peripherals.IntegratedSensorBus.telemetryChannel, integer> signals A map from telemetry channel name to signal strength.
function IntegratedSensorBus.getTelemetrySignals() end

---Get all telemetry channel names.
---@return DriveBySable.peripherals.IntegratedSensorBus.telemetryChannel[] channels The telemetry channel names.
function IntegratedSensorBus.getTelemetryChannels() end

---Check whether speed telemetry is enabled.
---@return boolean enabled Whether speed telemetry is enabled.
function IntegratedSensorBus.isSpeedEnabled() end

---Enable or disable speed telemetry.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param enabled boolean Whether speed telemetry should be enabled.
---@return boolean enabled The value that was set.
function IntegratedSensorBus.setSpeedEnabled(enabled) end

---Check whether angle telemetry is enabled.
---@return boolean enabled Whether angle telemetry is enabled.
function IntegratedSensorBus.isAngleEnabled() end

---Enable or disable angle telemetry.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param enabled boolean Whether angle telemetry should be enabled.
---@return boolean enabled The value that was set.
function IntegratedSensorBus.setAngleEnabled(enabled) end

---Check whether altitude telemetry is enabled.
---@return boolean enabled Whether altitude telemetry is enabled.
function IntegratedSensorBus.isAltitudeEnabled() end

---Enable or disable altitude telemetry.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param enabled boolean Whether altitude telemetry should be enabled.
---@return boolean enabled The value that was set.
function IntegratedSensorBus.setAltitudeEnabled(enabled) end

---Check whether the sensor settings are locked against GUI edits.
---@return boolean locked Whether the settings are locked.
function IntegratedSensorBus.isSettingsLocked() end

---Lock or unlock the sensor settings against GUI edits.
---Main-thread synchronized: may wait for the next Minecraft tick before returning.
---@param locked boolean Whether the settings should be locked.
---@return boolean locked The value that was set.
function IntegratedSensorBus.setSettingsLocked(locked) end

---An incoming cable signal queues a `sensor_bus_input` event on every attached
---computer. The event arguments are the attached peripheral name, channel
---number, signal strength, and whether that channel was intercepted.
---## Example
---```
---local sensor = peripheral.find("integrated_flight_sensor")
---if sensor then
---    while true do
---        local _, name, channel, signal, intercepted = os.pullEvent("sensor_bus_input")
---        print(name, channel, signal, intercepted)
---    end
---end
---```
