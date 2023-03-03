sudo ./set_network_namespace.sh

sudo gnome-terminal -t "SRS EPC Node" -- sudo ./build/srsepc/src/srsepc
gnome-terminal -t "SRS ENB Node" -- sudo ./build/srsenb/src/srsenb
gnome-terminal -t "SRS UE Node" -- sudo ./build/srsue/src/srsue
echo
echo "SUCCESS!"
echo "    When done, type the following:"
echo "        ./clear_network_namespace.sh"
