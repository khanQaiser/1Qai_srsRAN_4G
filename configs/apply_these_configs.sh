echo "Copying all the configuration files to the correct location..."
rm -rf ~/.config/srsran/
mkdir ~/.config/srsran/
# Copy the configuration files
cp user_db.csv ~/.config/srsran
cp epc.conf ~/.config/srsran

cp sib.conf ~/.config/srsran
cp rr.conf ~/.config/srsran
cp rb.conf ~/.config/srsran
cp enb.conf ~/.config/srsran

cp ue.conf ~/.config/srsran

echo "Done."