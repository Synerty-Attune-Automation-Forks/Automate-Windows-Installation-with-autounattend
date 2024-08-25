
# For some reason on Win10 BIOS ESXi kickstarts the restart from the above line
# Doesn't restart. So we have another line below to restart the node
# and start WinRM afterwards.
Restart-Computer -Force