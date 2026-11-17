# The script below takes all the users from a group and resets their password to specified password.

$groupName = "GroupName"
$users = @("jsmith", "jdoe", "abrown")  # ← add any accounts that need password changed
$newPassword = "NewPassword"

# Get group members once
$groupMembers = Get-ADGroupMember -Identity $groupName | Select-Object -ExpandProperty Name

foreach ($user in $users) {
    if ($groupMembers -contains $user) {
        Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $newPassword -Force)
        Write-Host "Reset: $user"
    } else {
        Write-Warning "$user is NOT a member of $groupName"
    }
}   