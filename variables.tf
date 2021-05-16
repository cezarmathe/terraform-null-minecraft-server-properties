# terraform-null-minecraft-server-properties - variables.tf

variable "spawn_protection" {
  type        = number
  description = <<DESCRIPTION
Determines the side length of the square spawn protection area as 2x+1. Setting this to 0 disables the spawn protection. A value of 1 protects a 3×3 square centered on the spawn point. 2 protects 5×5, 3 protects 7×7, etc. This option is not generated on the first server start and appears when the first player joins. If there are no ops set on the server, the spawn protection is disabled automatically as well.

    DESCRIPTION
  default     = 16
}

variable "max_tick_time" {
  type        = number
  description = <<DESCRIPTION
The maximum number of milliseconds a single tick may take before the server watchdog stops the server with the message, A single server tick took 60.00 seconds (should be max 0.05); Considering it to be crashed, server will forcibly shutdown. Once this criterion is met, it calls System.exit(1).
-1 - disable watchdog entirely (this disable option was added in 14w32a)

    DESCRIPTION
  default     = 60000
}

variable "query_port" {
  type        = number
  description = <<DESCRIPTION
Sets the port for the query server (see enable-query).

    DESCRIPTION
  default     = 25565
}

variable "generator_settings" {
  type        = string
  description = <<DESCRIPTION
The settings used to customize world generation. Follow its format and write the corresponding JSON string. Remember to escape all : with \:.

    DESCRIPTION
  default     = ""
}

variable "sync_chunk_writes" {
  type        = bool
  description = <<DESCRIPTION
Enables synchronous chunk writes.

    DESCRIPTION
  default     = true
}

variable "force_gamemode" {
  type        = bool
  description = <<DESCRIPTION
Force players to join in the default game mode.
false - Players join in the gamemode they left in.
true - Players always join in the default gamemode.

    DESCRIPTION
  default     = false
}

variable "allow_nether" {
  type        = bool
  description = <<DESCRIPTION
Allows players to travel to the Nether.
false - Nether portals do not work.
true - The server allows portals to send players to the Nether.

    DESCRIPTION
  default     = true
}

variable "enforce_whitelist" {
  type        = bool
  description = <<DESCRIPTION
Enforces the whitelist on the server.
When this option is enabled, users who are not present on the whitelist (if it's enabled) get kicked from the server after the server reloads the whitelist file.

false - No user gets kicked if not on the whitelist.
true - Online users not on the whitelist get kicked.

    DESCRIPTION
  default     = false
}

variable "gamemode" {
  type        = string
  description = <<DESCRIPTION
Defines the mode of gameplay.
If a legacy gamemode number is specified, it is silently converted to a gamemode name.

survival (0)
creative (1)
adventure (2)
spectator (3)

    DESCRIPTION
  default     = "survival"
}

variable "broadcast_console_to_ops" {
  type        = bool
  description = <<DESCRIPTION
Send console command outputs to all online operators.

    DESCRIPTION
  default     = true
}

variable "enable_query" {
  type        = bool
  description = <<DESCRIPTION
Enables GameSpy4 protocol server listener. Used to get information about server.

    DESCRIPTION
  default     = false
}

variable "player_idle_timeout" {
  type        = number
  description = <<DESCRIPTION
If non-zero, players are kicked from the server if they are idle for more than that many minutes.
Note: Idle time is reset when the server receives one of the following packets:
Click Window
Enchant Item
Update Sign
Player Digging
Player Block Placement
Held Item Change
Animation (swing arm)
Entity Action
Client Status
Chat Message
Use Entity

    DESCRIPTION
  default     = 0
}

variable "text_filtering_config" {
  type        = string
  description = <<DESCRIPTION
[more information needed]

    DESCRIPTION
  default     = ""
}

variable "difficulty" {
  type        = string
  description = <<DESCRIPTION
Defines the difficulty (such as damage dealt by mobs and the way hunger and poison affects players) of the server.
If a legacy difficulty number is specified, it is silently converted to a difficulty name.

peaceful (0)
easy (1)
normal (2)
hard (3)

    DESCRIPTION
  default     = "easy"
}

variable "broadcast_rcon_to_ops" {
  type        = bool
  description = <<DESCRIPTION
Send rcon console command outputs to all online operators.

    DESCRIPTION
  default     = true
}

variable "spawn_monsters" {
  type        = bool
  description = <<DESCRIPTION
Determines if monsters can spawn.
true - Enabled. Monsters appear at night and in the dark.
false - Disabled. No monsters.
This setting has no effect if difficulty = 0 (peaceful). If difficulty is not = 0, a monster can still spawn from a spawner.
If the player has major lag, it is recommended to turn this off/set to false.


    DESCRIPTION
  default     = true
}

variable "op_permission_level" {
  type        = number
  description = <<DESCRIPTION
Sets the default permission level for ops when using /op. All levels inherit abilities and commands from levels before them.
1 - Ops can bypass spawn protection.
2 - Ops can use all singleplayer cheats commands (except /publish, as it is not on servers; along with /debug) and use command blocks. Command blocks, along with Realms owners/operators, have the same permissions as this level.
3 - Ops can use most multiplayer-exclusive commands, including /debug, and commands that manage players (/ban, /op, etc).
4 - Ops can use all commands including /stop, /save-all, /save-on, and /save-off.

    DESCRIPTION
  default     = 4
}

variable "pvp" {
  type        = bool
  description = <<DESCRIPTION
Enable PvP on the server. Players shooting themselves with arrows receive damage only if PvP is enabled.
true - Players can kill each other.
false - Players cannot kill other players (also known as Player versus Environment (PvE)).
Note: Indirect damage sources spawned by players (such as lava, fire, TNT and to some extent water, sand and gravel) still deal damage to other players.


    DESCRIPTION
  default     = true
}

variable "entity_broadcast_range_percentage" {
  type        = number
  description = <<DESCRIPTION
Controls how close entities need to be before being sent to clients. Higher values means they'll be rendered from farther away, potentially causing more lag. This is expressed the percentage of the default value. For example, setting to 50 will make it half as usual. This mimics the function on the client video settings (not unlike Render Distance, which the client can customize so long as it's under the server's setting).

    DESCRIPTION
  default     = 100
}

variable "snooper_enabled" {
  type        = bool
  description = <<DESCRIPTION
Sets whether the server sends snoop data regularly to http://snoop.minecraft.net.
false - disable snooping.
true - enable snooping.

    DESCRIPTION
  default     = true
}

variable "level_type" {
  type        = string
  description = <<DESCRIPTION
Determines the type of map that is generated.
default - Standard world with hills, valleys, water, etc.
flat - A flat world with no features, can be modified with generator-settings.
largeBiomes - Same as default but all biomes are larger.
amplified - Same as default but world-generation height limit is increased.
buffet - Only for 1.15 or before. Same as default unless generator-settings is set.
default_1_1 - Only for 1.15 or before. Same as default, but counted as a different world type.
customized - Only for 1.15 or before. After 1.13, this value is no different than default, but in 1.12 and before, it could be used to create a completely custom world.

    DESCRIPTION
  default     = "default"
}

variable "enable_status" {
  type        = bool
  description = <<DESCRIPTION
Makes the server appear as "online" on the server list.
If set to false, it will suppress replies from clients. This means it will appear as offline, but will still accept connections.


    DESCRIPTION
  default     = true
}

variable "hardcore" {
  type        = bool
  description = <<DESCRIPTION
If set to true, server difficulty is ignored and set to hard and players are set to spectator mode if they die.

    DESCRIPTION
  default     = false
}

variable "enable_command_block" {
  type        = bool
  description = <<DESCRIPTION
Enables command blocks

    DESCRIPTION
  default     = false
}

variable "network_compression_threshold" {
  type        = number
  description = <<DESCRIPTION
By default it allows packets that are n-1 bytes big to go normally, but a packet of n bytes or more gets compressed down. So, a lower number means more compression but compressing small amounts of bytes might actually end up with a larger result than what went in.
-1 - disable compression entirely
0 - compress everything
Note: The Ethernet spec requires that packets less than 64 bytes become padded to 64 bytes. Thus, setting a value lower than 64 may not be beneficial. It is also not recommended to exceed the MTU, typically 1500 bytes.


    DESCRIPTION
  default     = 256
}

variable "max_players" {
  type        = number
  description = <<DESCRIPTION
The maximum number of players that can play on the server at the same time. Note that more players on the server consume more resources. Note also, op player connections are not supposed to count against the max players, but ops currently cannot join a full server. However, this can be changed by going to the file called ops.json in the player's server directory, opening it, finding the op that the player wants to change, and changing the setting called bypassesPlayerLimit to true (the default is false). This means that that op does not have to wait for a player to leave in order to join. Extremely large values for this field result in the client-side user list being broken.

    DESCRIPTION
  default     = 20
}

variable "max_world_size" {
  type        = number
  description = <<DESCRIPTION
This sets the maximum possible size in blocks, expressed as a radius, that the world border can obtain. Setting the world border bigger causes the commands to complete successfully but the actual border does not move past this block limit. Setting the max-world-size higher than the default doesn't appear to do anything.
Examples: 

Setting max-world-size to 1000 allows the player to have a 2000×2000 world border.
Setting max-world-size to 4000 gives the player an 8000×8000 world border.

    DESCRIPTION
  default     = 29999984
}

variable "resource_pack_sha1" {
  type        = string
  description = <<DESCRIPTION
 Optional SHA-1 digest of the resource pack, in lowercase hexadecimal. It is recommended to specify this, because it is used to verify the integrity of the resource pack.
Note: If the resource pack is any different, a yellow message "Invalid sha1 for resource-pack-sha1" appears in the console when the server starts. Due to the nature of hash functions, errors have a tiny probability of occurring, so this consequence has no effect.


    DESCRIPTION
  default     = ""
}

variable "function_permission_level" {
  type        = number
  description = <<DESCRIPTION
Sets the default permission level for functions.
See #op-permission-level for the details on the 4 levels.


    DESCRIPTION
  default     = 2
}

variable "rcon_port" {
  type        = number
  description = <<DESCRIPTION
Sets the RCON network port.

    DESCRIPTION
  default     = 25575
}

variable "server_port" {
  type        = number
  description = <<DESCRIPTION
Changes the port the server is hosting (listening) on. This port must be forwarded if the server is hosted in a network using NAT (if the player has a home router/firewall).

    DESCRIPTION
  default     = 25565
}

variable "server_ip" {
  type        = string
  description = <<DESCRIPTION
The player should set this if they want the server to bind to a particular IP. It is strongly recommended that the player leaves server-ip blank.
Set to blank, or the IP the player want their server to run (listen) on.

    DESCRIPTION
  default     = ""
}

variable "spawn_npcs" {
  type        = bool
  description = <<DESCRIPTION
Determines whether villagers can spawn.
true - Enabled. Villagers spawn.
false - Disabled. No villagers.

    DESCRIPTION
  default     = true
}

variable "allow_flight" {
  type        = bool
  description = <<DESCRIPTION
Allows users to use flight on the server while in Survival mode, if they have a mod that provides flight installed.
With allow-flight enabled, griefers may become more common, because it makes their work easier. In Creative mode, this has no effect.

false - Flight is not allowed (players in air for at least 5 seconds get kicked).
true - Flight is allowed, and used if the player has a fly mod installed.

    DESCRIPTION
  default     = false
}

variable "level_name" {
  type        = string
  description = <<DESCRIPTION
The "level-name" value is used as the world name and its folder name. The player may also copy their saved game folder here, and change the name to the same as that folder's to load it instead.
Characters such as ' (apostrophe) may need to be escaped by adding a backslash before them.

    DESCRIPTION
  default     = "world"
}

variable "view_distance" {
  type        = number
  description = <<DESCRIPTION
Sets the amount of world data the server sends the client, measured in chunks in each direction of the player (radius, not diameter). It determines the server-side viewing distance.
10 is the default/recommended. If the player has major lag, this value is recommended to be reduced.


    DESCRIPTION
  default     = 10
}

variable "resource_pack" {
  type        = string
  description = <<DESCRIPTION
Optional URI to a resource pack. The player may choose to use it.
Note that (in some versions before 1.15.2), the ":" and "=" characters need to be escaped with a backslash (\), e.g. http\://somedomain.com/somepack.zip?someparam\=somevalue
The resource pack may not have a larger file size than 100 MiB (Before 1.15: 50 MiB (≈ 50.4 MB)). Note that download success or failure is logged by the client, and not by the server.


    DESCRIPTION
  default     = ""
}

variable "spawn_animals" {
  type        = bool
  description = <<DESCRIPTION
Determines if animals can spawn.
true - Animals spawn as normal.
false - Animals immediately vanish.
If the player has major lag, it is recommended to turn this off/set to false.


    DESCRIPTION
  default     = true
}

variable "white_list" {
  type        = bool
  description = <<DESCRIPTION
Enables a whitelist on the server.
With a whitelist enabled, users not on the whitelist cannot connect. Intended for private servers, such as those for real-life friends or strangers carefully selected via an application process, for example.

false - No white list is used.
true - The file whitelist.json is used to generate the white list.
Note: Ops are automatically whitelisted, and there is no need to add them to the whitelist.


    DESCRIPTION
  default     = false
}

variable "rcon_password" {
  type        = string
  description = <<DESCRIPTION
Sets the password for RCON: a remote console protocol that can allow other applications to connect and interact with a Minecraft server over the internet.

    DESCRIPTION
  default     = ""
}

variable "generate_structures" {
  type        = bool
  description = <<DESCRIPTION
Defines whether structures (such as villages) can be generated.
false - Structures are not generated in new chunks.
true - Structures are generated in new chunks.
Note: Dungeons still generate if this is set to false.


    DESCRIPTION
  default     = true
}

variable "online_mode" {
  type        = bool
  description = <<DESCRIPTION
Server checks connecting players against Minecraft account database. Set this to false only if the player's server is not connected to the Internet. Hackers with fake accounts can connect if this is set to false! If minecraft.net is down or inaccessible, no players can connect if this is set to true. Setting this variable to off purposely is called "cracking" a server, and servers that are present with online mode off are called "cracked" servers, allowing players with unlicensed copies of Minecraft to join.
true - Enabled. The server assumes it has an Internet connection and checks every connecting player.
false - Disabled. The server does not attempt to check connecting players.

    DESCRIPTION
  default     = true
}

variable "level_seed" {
  type        = string
  description = <<DESCRIPTION
Sets a world seed for the player's world, as in Singleplayer. The world generates with a random seed if left blank.
Some examples are: minecraft, 404, 1a2b3c.

    DESCRIPTION
  default     = ""
}

variable "prevent_proxy_connections" {
  type        = bool
  description = <<DESCRIPTION
If the ISP/AS sent from the server is different from the one from Mojang Studios' authentication server, the player is kicked
true - Enabled. Server prevents users from using vpns or proxies.
false - Disabled. The server doesn't prevent users from using vpns or proxies.

    DESCRIPTION
  default     = false
}

variable "use_native_transport" {
  type        = bool
  description = <<DESCRIPTION
Linux server performance improvements: optimized packet sending/receiving on Linux
true - Enabled. Enable Linux packet sending/receiving optimization
false - Disabled. Disable Linux packet sending/receiving optimization

    DESCRIPTION
  default     = true
}

variable "enable_jmx_monitoring" {
  type        = bool
  description = <<DESCRIPTION
Exposes an MBean with the Object name net.minecraft.server:type=Server and two attributes averageTickTime and tickTimes exposing the tick times in milliseconds.
In order for enabling JMX on the Java runtime you also need to add a couple of JVM flags to the startup as documented here.


    DESCRIPTION
  default     = false
}

variable "motd" {
  type        = string
  description = <<DESCRIPTION
This is the message that is displayed in the server list of the client, below the name.
The MOTD supports color and formatting codes.
The MOTD supports special characters, such as "♥". However, such characters must be converted to escaped Unicode form. An online converter can be found here.
If the MOTD is over 59 characters, the server list may report a communication error.

    DESCRIPTION
  default     = "A Minecraft Server"
}

variable "rate_limit" {
  type        = number
  description = <<DESCRIPTION
Sets the maximum amount of packets a user can send before getting kicked. Setting to 0 disables this feature.

    DESCRIPTION
  default     = 0
}

variable "enable_rcon" {
  type        = bool
  description = <<DESCRIPTION
Enables remote access to the server console.
It's not recommended to expose RCON to the Internet, because RCON protocol transfers everything without encryption. Everything (including RCON password) communicated between the RCON server and client can be leaked to someone listening in on your connection.

    DESCRIPTION
  default     = false
}
