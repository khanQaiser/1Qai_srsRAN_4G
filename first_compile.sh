# Arguments:
#     skiplibzmq
#     skipsrsran
#     dontremovesrsranbuild

# Example:
#     ./compile.sh skiplibzmq skipsrsran dontremovesrsranbuild


baseDirectory=$(pwd)

arguments=""
for var in "$@"; do
	arguments="$arguments $var"
done
echo "Arguments: $arguments"

echo
echo
echo

cd $baseDirectory
if [[ " ${arguments[*]} " =~ " skiplibzmq " ]]; then
	echo "Skipping libzmq."
else
	sudo apt-get install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev -y
	sudo apt-get install libzmq3 libzmq3-dev -y
	sudo apt-get install libfftw3-dev libsctp-dev libmbedtls-dev -y
	echo
	echo
	echo
	echo "Building ZeroMQ libzmq..."
	rm -rf libzmq
	git clone https://github.com/zeromq/libzmq.git
	cd libzmq
	./autogen.sh
	./configure
	make -j$(nproc)
	sudo make install
	sudo ldconfig
	cd ..
fi

cd $baseDirectory
# (Second part of czmq)
if [[ " ${arguments[*]} " =~ " skiplibzmq " ]]; then
	echo "Skipping czmq."
else
	echo
	echo
	echo
	echo "Building ZeroMQ czmq..."
	rm -rf czmq
	git clone https://github.com/zeromq/czmq.git
	cd czmq
	./autogen.sh
	./configure
	make -j$(nproc)
	sudo make install
	sudo ldconfig
	cd ..
fi

cd $baseDirectory
if [[ " ${arguments[*]} " =~ " skipsrsran " ]]; then
	echo "Skipping srsRAN."
else
	echo
	echo
	echo
	echo "Building srsRAN..."
	if [[ " ${arguments[*]} " =~ " dontremovesrsranbuild " ]]; then
		echo "Skipping srsRAN build removal."
	else
		rm -rf build
		mkdir build
	fi
	cd build
	cmake ../
	make clean
	make -j$(nproc)
	sudo make install
	cd ..
fi


cd $baseDirectory

echo
echo
echo

# # EPC Requirements:
# # Download user_db.csv
# wget https://raw.githubusercontent.com/srsran/srsRAN/master/srsepc/user_db.csv.example
# mv user_db.csv.example configs/user_db.csv
# # Download epc.conf
# wget https://raw.githubusercontent.com/srsran/srsRAN/master/srsepc/epc.conf.example
# mv epc.conf.example configs/epc.conf
# # ENB Requirements:
# # Download enb.conf
# wget https://raw.githubusercontent.com/srsran/srsRAN/master/srsenb/enb.conf.example
# mv enb.conf.example configs/enb.conf
# # Download sib.conf
# wget https://raw.githubusercontent.com/srsran/srsRAN/master/srsenb/sib.conf.example
# mv sib.conf.example configs/sib.conf
# # Download rr.conf
# wget https://raw.githubusercontent.com/srsran/srsRAN/master/srsenb/rr.conf.example
# mv rr.conf.example configs/rr.conf
# # Download rb.conf
# wget https://raw.githubusercontent.com/srsran/srsRAN/master/srsenb/rb.conf.example
# mv rb.conf.example configs/rb.conf
# # # UE Requirements:
# wget https://raw.githubusercontent.com/srsran/srsRAN/master/srsue/ue.conf.example
# mv ue.conf.example configs/ue.conf

echo "Copying all the configuration files to the correct location..."
rm -rf ~/.config/srsran/
mkdir ~/.config/srsran/
# Copy the configuration files
cp configs/user_db.csv ~/.config/srsran
cp configs/epc.conf ~/.config/srsran

cp configs/sib.conf ~/.config/srsran
cp configs/rr.conf ~/.config/srsran
cp configs/rb.conf ~/.config/srsran
cp configs/enb.conf ~/.config/srsran

cp configs/ue.conf ~/.config/srsran

echo
echo
echo

echo "Done!"
exit 0
