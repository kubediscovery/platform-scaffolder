key    = "platform/terraform/labs/${{ values.provider | replace(" ", "-") | lower}}-${{ values.projectName | replace(" ", "-") | lower}}.tfstate"
bucket = "kubediscovery"
region = "us-east-1"
