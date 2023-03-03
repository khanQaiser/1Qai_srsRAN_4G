sudo gnome-terminal -t "SRS EPC Node" -- /bin/sh -c 'sudo ./build/srsepc/src/srsepc --config_file ./configs/epc.conf; printf "%s " "Press enter to continue"; read ans'
#gnome-terminal -t "SRS ENB Node" -- /bin/sh -c './build/srsenb/src/srsenb --rf.device_name=zmq --rf.device_args="fail_on_disconnect=true,tx_port=tcp://*:2000,rx_port=tcp://localhost:2001,id=enb,base_srate=23.04e6"; printf "%s " "Press enter to continue"; read ans'
#gnome-terminal -t "SRS UE Node" -- /bin/sh -c './build/srsue/src/srsue --rf.device_name=zmq --rf.device_args="tx_port=tcp://*:2001,rx_port=tcp://localhost:2000,id=ue,base_srate=23.04e6" --gw.netns=ue1; printf "%s " "Press enter to continue"; read ans'

gnome-terminal -t "SRS ENB Node" -- /bin/sh -c './build/srsenb/src/srsenb --config_file ./configs/enb_uhd.conf; printf "%s " "Press enter to continue"; read ans'
#gnome-terminal -t "SRS UE Node" -- /bin/sh -c './build/srsue/src/srsue --config_file ./configs/ue.conf; printf "%s " "Press enter to continue"; read ans'

echo
echo "SUCCESS!"
echo "    When done, type the following:"
echo "        ./clear_network_namespace.sh"
