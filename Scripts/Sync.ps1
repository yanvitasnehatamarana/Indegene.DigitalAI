$ErrorActionPreference = 'Stop'

$ScriptPath = Split-Path $MyInvocation.MyCommand.Path

# This is an example PowerShell script that will remotely execute a Unicorn sync using the new CHAP authentication system.

Import-Module $ScriptPath\Unicorn.psm1

# SYNC ALL CONFIGURATIONS
#Sync-Unicorn -ControlPanelUrl 'https://sc101sc.dev.local/unicorn.aspx' -SharedSecret 'your-sharedsecret-here' -StreamLogs

# SYNC SPECIFIC CONFIGURATIONS
Sync-Unicorn -ControlPanelUrl 'https://sc101sc.dev.local/unicorn.aspx' -SharedSecret 'x5EhnFgnx45CtYnVS7fzwBCV6Bypj7yNQRWm3xfHhKkx285cyegxmnZDRb3gXM8gG6SXmr8Puuw3g8MFJ5J45bHdDCsqQf9ZrYcUB4EBLvAhvqJf5y3Q6P8T' -Configurations @('Serialization.Contents') -StreamLogs

# SYNC ALL CONFIGURATIONS, SKIPPING ANY WITH TRANSPARENT SYNC ON
#Sync-Unicorn -ControlPanelUrl 'https://localhost/unicorn.aspx' -SharedSecret 'your-sharedsecret-here' -SkipTransparentConfigs -StreamLogs

# SYNC ALL CONFIGURATIONS WITHOUT KEEPING CONNECTION OPEN ALL THE TIME (specify configurations if you need only some of them). This is introduced to fix edge case, described https://github.com/SitecoreUnicorn/Unicorn/issues/387 
#Sync-Unicorn -ControlPanelUrl 'https://localhost/unicorn.aspx' -SharedSecret 'your-sharedsecret-here' -Verb 'SyncSilent'

# Note: you may pass -Verb 'Reserialize' for remote reserialize. Usually not needed though.

# Note: If you are having authorization issues, add -DebugSecurity to your cmdlet invocation; this will display the raw signatures being used to compare to the server.