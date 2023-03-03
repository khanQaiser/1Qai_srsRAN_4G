gnome-terminal -t "SRS UE Node" -- /bin/sh -c './build/srsue/src/srsue --config_file ./configs/ue_uhd.conf; printf "%s " "Press enter to continue"; read ans'

echo
echo "SUCCESS!"
echo "    When done, type the following:"
echo "        ./clear_network_namespace.sh"
