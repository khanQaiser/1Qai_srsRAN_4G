if ! sudo ip netns list | grep ue1 ; then
	sudo ip netns add ue1
	echo "Namespace successfully set!"
else
	echo "Namespace already set."
fi