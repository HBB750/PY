# PUBG_AntiBan_Firewall.ps1
# سكربت PowerShell شامل: يمنع Telemetry ويحدث hosts

Write-Host "==============================="
Write-Host " PUBG Anti-Telemetry PowerShell"
Write-Host "==============================="

# 1️⃣ إضافة قواعد الجدار الناري (Firewall)
Write-Host "Adding Firewall Rules..."
New-NetFirewallRule -DisplayName "PUBG_Block_Tencent_150.109" -Direction Outbound -RemoteAddress "150.109.0.0/16" -Action Block -Enabled True
New-NetFirewallRule -DisplayName "PUBG_Block_Tencent_119.28" -Direction Outbound -RemoteAddress "119.28.0.0/16" -Action Block -Enabled True
New-NetFirewallRule -DisplayName "PUBG_Block_Tencent_203.205" -Direction Outbound -RemoteAddress "203.205.0.0/16" -Action Block -Enabled True

New-NetFirewallRule -DisplayName "PUBG_Block_TCP" -Direction Outbound -Protocol TCP -RemotePort 8080,18000,14000 -Action Block -Enabled True
New-NetFirewallRule -DisplayName "PUBG_Block_UDP" -Direction Outbound -Protocol UDP -RemotePort 17500,18000 -Action Block -Enabled True

# 2️⃣ تحديث ملف hosts
Write-Host "Updating hosts file..."
$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"
Add-Content $hostsPath "127.0.0.1 bugly.qq.com"
Add-Content $hostsPath "127.0.0.1 csoversea.mbgame.anticheatexpert.com"
Add-Content $hostsPath "127.0.0.1 tds.qq.com"
Add-Content $hostsPath "127.0.0.1 tencent.com"

# 3️⃣ تنظيف كاش DNS
Write-Host "Flushing DNS Cache..."
ipconfig /flushdns

Write-Host "==============================="
Write-Host " ✅ All Done. Rules & Hosts Updated!"
Write-Host "==============================="
