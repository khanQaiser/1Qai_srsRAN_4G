#!/bin/sh

sudo ./build/srsepc/src/srsepc ~/.config/srsran/epc.conf

printf "%s " "Press enter to continue"
read ans