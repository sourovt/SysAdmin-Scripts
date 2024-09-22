:: This Batch script helps map drives and prompts for credentials
:: Using new server requires entering credentials again
Echo off

set /p username="Please Enter the Username:"

echo Mapping \\Server1\Share1$
net use Z: "\\Server1\Share1$" /USER:myDomain\%username% * /PERSISTENT:NO

echo Mapping \\Server1\Share2
net use Y: "\\Server2\Share2" /PERSISTENT:NO

echo Mapping \\myDomain.xyz\All Shares\ShareX
net use V: "\\myDomain.xyz\All Shares\ShareX" /PERSISTENT:NO

echo Done mapping all specified network locations!
pause