sudo ./set_network_namespace.sh

sudo gnome-terminal -t "SRS EPC Node" -- /bin/sh -c 'sudo ./build/srsepc/src/srsepc --config_file ./configs/epc.conf; printf "%s " "Press enter to continue"; read ans'
gnome-terminal -t "SRS ENB Node" -- /bin/sh -c './build/srsenb/src/srsenb --config_file ./configs/enb.conf; printf "%s " "Press enter to continue"; read ans'
gnome-terminal -t "SRS UE Node" -- /bin/sh -c './build/srsue/src/srsue --config_file ./configs/ue.conf; printf "%s " "Press enter to continue"; read ans'

echo
echo "SUCCESS!"
echo "    When done, type the following:"
echo "        ./clear_network_namespace.sh"
