FILE=pcaps/ue_mac.pcap
if [ -f "$FILE" ]; then
    wireshark $FILE
else
    echo "$FILE does not exist."
fi

FILE=pcaps/enb_mac.pcap
if [ -f "$FILE" ]; then
    wireshark $FILE
else
    echo "$FILE does not exist."
fi