# If there is an error, then sleep for a long time to see the error
function Chk($val) { if (-not $val) { sleep (86400 * 2) } }