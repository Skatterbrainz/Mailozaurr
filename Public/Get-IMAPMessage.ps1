﻿function Get-IMAPMessage {
    [cmdletBinding()]
    param(
        [Parameter()][System.Collections.IDictionary] $Client,
        [MailKit.FolderAccess] $FolderAccess = [MailKit.FolderAccess]::ReadOnly
    )
    if ($Client) {
        $Folder = $Client.Data.Inbox
        $null = $Folder.Open($FolderAccess)

        Write-Verbose "Get-IMAPMessage - Total messages $($Folder.Count), Recent messages $($Folder.Recent)"
        $Client.Folder = $Folder
    } else {
        Write-Verbose 'Get-IMAPMessage - Client not connected?'
    }
}