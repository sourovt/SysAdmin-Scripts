# This snippet will take file/folder permissions from an existing folder and apply them to all childs of another folder.
$newacl = get-acl "D:\Shares\SourceFolder"
get-childitem "D:\Shares\DestinationFolder\" -Recurse | set-acl -aclobject $newacl
