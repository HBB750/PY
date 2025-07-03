@echo off
title PUBG Anti-Telemetry Firewall Blocker By KING

echo ================================
echo  Adding Tencent AntiCheat Blocks
echo ================================

netsh advfirewall firewall add rule name="PUBG_Block_Tencent_150.109" dir=out action=block remoteip=150.109.0.0/16 enable=yes
netsh advfirewall firewall add rule name="PUBG_Block_Tencent_119.28" dir=out action=block remoteip=119.28.0.0/16 enable=yes
netsh advfirewall firewall add rule name="PUBG_Block_Tencent_203.205" dir=out action=block remoteip=203.205.0.0/16 enable=yes

echo ================================
echo   Blocking Known Telemetry Ports
echo ================================

netsh advfirewall firewall add rule name="PUBG_Block_TCP" dir=out action=block protocol=TCP remoteport=8080,18000,14000 enable=yes
netsh advfirewall firewall add rule name="PUBG_Block_UDP" dir=out action=block protocol=UDP remoteport=17500,18000 enable=yes

echo ================================
echo       Flushing DNS Cache
echo ================================

ipconfig /flushdns

echo =================================
echo ✅ All Done! Rules Added.
echo =================================

