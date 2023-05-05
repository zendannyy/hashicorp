#!/usr/bin/env bash
# Get PCAP file location from user
echo "Please enter PCAP file location:"
read pcap_file

# Check if file exists
if [ ! -f "$pcap_file" ]; then
    echo "File not found"
    exit 1
fi


function usage() {
  echo "Usage: $0 [-a arg_a] [-c arg_c]"
  echo "  -l  First argument (required)"
  echo "  -C  Second argument (optional)"
  echo "  -A  Second argument (optional)"
  echo "  -AD  Second argument (optional)"
  echo "  -I  Second argument (optional)"
  echo "  -MI  Second argument (optional)"
  echo "  -P  Second argument (optional)"
  exit 1
}


while getopts lCA:ADIMIP options ; do
    case $OPTION in 

    # Filter options

    echo "Your Filters Are: 
    l)
        # arg_l="${OPT_ARG}"
        # set to empty string so tshark will capture all packets
        filter_opton=""
        echo "for All Packets"
        ;;
    c)
        filter_option="c"
        echo "C for Packet Count"
        ;;
    A) 
        filter_option="A"
        echo "A for Packet Count"
        
    # A for Packet containing Applications, 
    # AD for Packets Containing Audio, 
    # I for Packets containing an Image, 
    # MI For Pacets containing Multiple Images or 
    # P for Ports of Packets[tshark -T fields -e tcp.srcport -e tcp.dstport -r "$pcap_file"]
    # For Destination"

    # echo "Your selection is:"
    # read filter_option

# Run tshark command
echo "Conversations:"
sudo tshark -r "$pcap_file" -qz conv,$filter_option
echo ""
echo "Two-pass analysis and heuristics filter:"
sudo tshark -r "$pcap_file" -R "http.request or http.response" -2R "http.request
 || http.response" -T fields -e frame.number -e frame.len -e ip.src -e tcp.srcport -e ip.dst



