# Drive-By-Sable ComputerCraft API

LuaCATS type definitions for the [Drive-By-Sable](https://github.com/lakeOpossMC/Drive-By-Sable) ComputerCraft peripherals. Install this repository as a [Lua Language Server addon](https://luals.github.io/wiki/addons/) to get completions, parameter hints, return types, and diagnostics when writing ComputerCraft programs for the mod.

## Peripheral types

The definitions are namespaced under `DriveBySable.peripherals`; they do not expose global peripheral classes.

- `DriveBySable.peripherals.CableHub` — `cable_hub`
- `DriveBySable.peripherals.AdvancedCableHub` — `advanced_cable_hub`
- `DriveBySable.peripherals.IntegratedSensorBus` — `integrated_flight_sensor`
- `DriveBySable.peripherals.LinkedTypewriterHub` — `linked_typewriter_hub`
- `DriveBySable.peripherals.MultiChannelCableBus` — `multi_channel_cable_bus`

The Java implementation is the source of truth for the documented method names and signatures. Each peripheral has its own LuaCATS file under [`library/types/objects/peripheral`](library/types/objects/peripheral).

## Usage

Annotate a wrapped peripheral with its Drive-By-Sable type:

```lua
---@type DriveBySable.peripherals.IntegratedSensorBus
local sensor = assert(peripheral.find("integrated_flight_sensor"))

sensor.setTarget(0, 120, 0)
local navigation = sensor.getNavigation()
print(navigation.x, navigation.y, navigation.z)
```

Note that, if you're also using [CC-Tweaked Documentation addon](https://gitlab.com/carsakiller/cc-tweaked-documentation), the code above will result in two warnings: since `peripheral.find()` first argument and return value are already typed, it expects to be passed a CC:Tweaked peripheral name and to return a CC:Tweaked peripheral type, which is not compatible with our type assertion:

```lua
---@type DriveBySable.peripherals.IntegratedSensorBus
local sensor = assert(peripheral.find("integrated_flight_sensor"))

--- The code above results in two LuaCATS warnings:
--- Cannot assign `string` to parameter `"command"|"computer"|"drive"|"inventory"|"modem"...(+3)`.
--- Type `ccTweaked.peripherals.Command` cannot match `DriveBySable.peripherals.IntegratedSensorBus`Lua Diagnostics.(assign-type-mismatch)
```

Note that the code above is completely valid and warnings can be safely ignored. However, to get rid of the warnings, just disable diagnostics for the conflicting line:

```lua
---@type DriveBySable.peripherals.IntegratedSensorBus
---@diagnostic disable-next-line: assign-type-mismatch, param-type-mismatch
local sensor = assert(peripheral.find("integrated_flight_sensor"))
```

## Main-thread synchronization

Some peripheral methods, including methods on `MultiChannelCableBus` and `IntegratedSensorBus`, must access Minecraft's world or block state. These methods synchronize with Minecraft's main server thread before executing, so they may pause the ComputerCraft program.

Minecraft's main thread runs at 20 Hz: one tick is 0.05 seconds. Calling synchronized methods sequentially means that the next call is not queued until the previous call returns. For example:

```lua
sensorBus.setOutput(1, 15)
sensorBus.setOutput(2, 15)
```

The first invocation runs in one tick and the second invocation runs in the next tick, so there is at least 0.05 seconds between them. A `while` or `for` loop that calls synchronized methods sequentially can therefore run at most at 20 Hz.

Use ComputerCraft's `parallel.waitForAll()` to queue multiple invocations before waiting for the next tick:

```lua
parallel.waitForAll(
    function() sensorBus.setOutput(1, 15) end,
    function() sensorBus.setOutput(2, 15) end
)
```

Methods that have to synchronize with the main thread are marked `Main-thread synchronized` in the inline LuaCATS documentation.

## Installation

Add this repository as a Lua Language Server third-party addon, or install it through the VS Code Lua Language Server addon manager when it is published there. The addon is metadata only: it does not add runtime Lua files to ComputerCraft.
