# The script below takes all the users from a group and resets their password to specified password.

$accounts = Get-ADGroupMember -Identity "GroupName" | Select-Object Name | Sort-Object Name

foreach($account IN $accounts)
    {
        Set-ADAccountPassword -Identity $account.Name -OldPassword (ConvertTo-SecureString -AsPlainText "OldPassword" -Force) -NewPassword (ConvertTo-SecureString -AsPlainText "NewPassword" -Force)
    }
