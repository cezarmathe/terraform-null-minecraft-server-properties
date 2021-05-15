# terraform-null-minecraft-server-properties

Create a `server.properties` configuration for your Minecraft server.

## Development

This repository includes a Python [script] used to process a default properties
file. This script then writes a [template] that can be used by Terraform to
create the actual configuration and the [variables] file that represents the
variables of the module.

The script is tested with Python 3.9.4 (64 bit).

[script]: scripts/process_server_properties.py
[template]: server.properties.tpl
[variables]: variables.tf
