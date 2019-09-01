$MicropostName = Get-Date -Format "yyyyMMdd-HHmmss"
hugo new micropost/${micropostName}.md

Add-Content "content/micropost/${micropostName}.md" $args[0]