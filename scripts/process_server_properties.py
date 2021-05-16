#!/usr/bin/env python3

import requests
from bs4 import BeautifulSoup
import subprocess

SERVER_PROPERTIES_URL = 'https://minecraft.fandom.com/wiki/Server.properties'

tf_main_file_header = "# terraform-null-minecraft-server-properties - main.tf\n"

tf_var_file_header = "# terraform-null-minecraft-server-properties - variables.tf\n"

tf_var_template: str = """
variable \"{tf_var_name}\" {{
    type    = {var_type}
    description = <<DESCRIPTION
{description}
    DESCRIPTION
    default = {default_value}
}}
"""

class MinecraftServerProperty:
    def __init__(self,
        property_name: str,
        description: str,
        default_value: str):

        self.property_name: str = property_name
        self.tf_var_name: str = property_name.replace("-", "_").replace(".", "_")
        self.description: str = description
        self.var_type: str = "string"
        self.default_value: str
        if default_value != "" :
            if default_value.isnumeric():
                self.default_value = default_value
                self.var_type = "number"
            elif (default_value == "true") or (default_value == "false"):
                self.default_value = default_value
                self.var_type = "bool"
            else:
                self.default_value = "\"{}\"".format(default_value)
                self.var_type = "string"
        else:
            self.default_value = "\"\""


    def to_property(self) -> str:
        return "{property_name}=${{{tf_var_name}}}".format(
            property_name = self.property_name,
            tf_var_name = self.tf_var_name,
        )

    def to_tf_var(self) -> str:
        return tf_var_template.format(
            tf_var_name = self.tf_var_name,
            var_type = self.var_type,
            description = self.description,
            default_value = self.default_value,
        )

def main():
    lines: list[str] = []
    with open("assets/server.properties") as file:
        lines = [line.rstrip('\n') for line in file]

    page = requests.get(SERVER_PROPERTIES_URL)
    soup = BeautifulSoup(page.content, 'html.parser')

    properties: list[MinecraftServerProperty] = []

    for line in lines:
        if line.startswith('#'):
            continue
        split = line.split("=")
        property_name = split[0]
        default_value = split[1]
        # fint the property row in the table that explains each property
        scraped_property = soup.find_all("tr", id=property_name)[0].find_all("td")
        # [0]: property name
        # [1]: property type
        # [2]: default value
        # [3]: description
        description = scraped_property[3].text
        property = MinecraftServerProperty(property_name, description, default_value)
        properties.append(property)

    with open("server.properties.tpl", "w") as file:
        file.write("#Minecraft server properties\n")
        file.write("#Thu Jan 01 00:00:00 UTC 1970\n")
        for property in properties:
            file.write("{}\n".format(property.to_property()))

    with open("variables.tf", "w") as file:
        file.write(tf_var_file_header)
        for property in properties:
            file.write(property.to_tf_var())

    with open("main.tf", "w") as file:
        file.write(tf_main_file_header)
        file.write("""
locals {
  configuration = templatefile("server.properties.tpl", {
""")
        for property in properties:
            file.write("    ")
            file.write("{tf_var_name} = var.{tf_var_name}".format(
                tf_var_name = property.tf_var_name)
            )
            file.write('\n')
        file.write("""  })
}
""")
    subprocess.run(["terraform", "fmt"])

if __name__ == "__main__":
    main()
