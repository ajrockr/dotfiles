# Network Connections (with nmcli)
When needing to join a hidden WPA2 Enterprise wireless network, use nmcli

1. nmcli connect add type wifi con-name "<ConnectionName>" ifname wlan0 ssid "<SSIDName>"
2. nmcli connection modify "<ConnectionName>" wifi-sec.key-mgmt wpa-eap 802-1x.eap peap 802-1x.phase2-auth mschapv2 802-1x.identity "<adusername>" 802-1x.password "<adpassword>"
3. nmcli connection modify "<ConnectionName>" connection.autoconnect yes
4. nmcli connection up "<ConnectionName>"
