# terraform-null-minecraft-server-properties - main.tf

locals {
  configuration = templatefile("${path.module}/server.properties.tpl", {
    spawn_protection                  = var.spawn_protection
    max_tick_time                     = var.max_tick_time
    query_port                        = var.query_port
    generator_settings                = var.generator_settings
    sync_chunk_writes                 = var.sync_chunk_writes
    force_gamemode                    = var.force_gamemode
    allow_nether                      = var.allow_nether
    enforce_whitelist                 = var.enforce_whitelist
    gamemode                          = var.gamemode
    broadcast_console_to_ops          = var.broadcast_console_to_ops
    enable_query                      = var.enable_query
    player_idle_timeout               = var.player_idle_timeout
    text_filtering_config             = var.text_filtering_config
    difficulty                        = var.difficulty
    broadcast_rcon_to_ops             = var.broadcast_rcon_to_ops
    spawn_monsters                    = var.spawn_monsters
    op_permission_level               = var.op_permission_level
    pvp                               = var.pvp
    entity_broadcast_range_percentage = var.entity_broadcast_range_percentage
    snooper_enabled                   = var.snooper_enabled
    level_type                        = var.level_type
    enable_status                     = var.enable_status
    hardcore                          = var.hardcore
    enable_command_block              = var.enable_command_block
    network_compression_threshold     = var.network_compression_threshold
    max_players                       = var.max_players
    max_world_size                    = var.max_world_size
    resource_pack_sha1                = var.resource_pack_sha1
    function_permission_level         = var.function_permission_level
    rcon_port                         = var.rcon_port
    server_port                       = var.server_port
    server_ip                         = var.server_ip
    spawn_npcs                        = var.spawn_npcs
    allow_flight                      = var.allow_flight
    level_name                        = var.level_name
    view_distance                     = var.view_distance
    resource_pack                     = var.resource_pack
    spawn_animals                     = var.spawn_animals
    white_list                        = var.white_list
    rcon_password                     = var.rcon_password
    generate_structures               = var.generate_structures
    online_mode                       = var.online_mode
    level_seed                        = var.level_seed
    prevent_proxy_connections         = var.prevent_proxy_connections
    use_native_transport              = var.use_native_transport
    enable_jmx_monitoring             = var.enable_jmx_monitoring
    motd                              = var.motd
    rate_limit                        = var.rate_limit
    enable_rcon                       = var.enable_rcon
  })
}
