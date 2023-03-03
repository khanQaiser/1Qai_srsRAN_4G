if sudo ip netns list | grep ue1 ; then
	sudo ip netns delete ue1
	echo "Namespace successfully cleared!"
else
	echo "No namespace to delete."
fi