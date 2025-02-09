#!/bin/sh

wifi_cfg=/flash/wifi-config.txt
config_path=/storage/.config
auto_script=${config_path}/autostart.sh

# prepare empty autostart.sh
[ ! -d ${config_path} ] && mkdir ${config_path}
touch ${auto_script}
chmod +x ${auto_script}
tee -a ${auto_script} << END
#!/bin/sh

END

# setup network
SSID=""
PSK=""
COUNTRY=""

[ -f ${wifi_cfg} ] && . ${wifi_cfg}

if [ -n "${SSID}" -a -n ${PSK} ]; then
  tee -a ${auto_script} << END
(
  echo "enable wifi"
  echo "scan wifi"
) | connmanctl

sleep 5
ID=\$(connmanctl services | grep -e "\s${SSID}\s" | awk '{print \$(NF)}')

(
echo "agent on"
echo "connect \$ID"
sleep 5
echo "${PSK}"
) | connmanctl
END
fi

if [ -n "${COUNTRY}" ]; then
  iw reg set ${COUNTRY}
fi

# If you want to put anything else to be executed on the first boot
# (and only on the first boot), put it here.

touch /storage/.cache/services/samba.disabled
touch /storage/.cache/services/bluez.disabled
systemctl restart smbd

# Do not put anything below here. But you can above here.

# close autostart.sh - remove self after finished
echo "rm ${auto_script}" >> ${auto_script}
