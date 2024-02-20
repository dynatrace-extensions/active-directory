$ErrorActionPreference = "Stop"
$featuresets = @{
      dhcp = ("SELECT Name, RequestsPersec, ReleasesPersec, DeclinesPersec, FailoverBndAckreceivedPersec, FailoverBndAcksentPersec, FailoverBndUpdDropped, FailoverBndUpdpendinginoutboundqueue, FailoverBndUpdreceivedPersec, FailoverBndUpdsentPersec FROM Win32_PerfFormattedData_dhcpserver_DHCPServer");
      host = @("SELECT Name, PercentProcessorTime, PercentIdleTime, PercentUserTime FROM Win32_PerfFormattedData_PerfOS_Processor WHERE Name LIKE '_Total'", "SELECT Name, NumberOfLogicalProcessors FROM Win32_Processor");
      service_performance = "SELECT Name, PercentProcessorTime FROM Win32_PerfFormattedData_PerfProc_Process Where Name='dns' OR Name='lsass'"
      network = @("SELECT Name, NumberOfLogons FROM Win32_NetworkLoginProfile", "SELECT Name, LogonPerSec, LogonTotal  FROM Win32_PerfRawData_PerfNet_Server");
      ntlm = @("SELECT Name, NTLMBindsPersec from Win32_PerfRawData_DirectoryServices_DirectoryServices");
      ldap = @("SELECT Name, LDAPBindTime, LDAPSuccessfulBindsPersec, LDAPWritesPersec, LDAPUDPoperationsPersec, LDAPActiveThreads, LDAPClientSessions, LDAPSearchesPersec FROM Win32_PerfRawData_DirectoryServices_DirectoryServices");
      esent_database_lsa = @("SELECT Name, IODatabaseReadsPerSec, IODatabaseReadsAverageLatency, IODatabaseWritesPersec, IODatabaseWritesAverageLatency, IOLogReadsPersec, IOLogReadsAverageLatency, IOLogWritesPersec, IOLogWritesAverageLatency from Win32_PerfRawData_ESENT_Database where Name like 'lsass%'");
      dra = @("SELECT Name, DRASyncRequestsSuccessful, DRASyncRequestsMade FROM Win32_PerfRawData_DirectoryServices_DirectoryServices");
      dhcpv6 = @("SELECT Name, DeclinesPersec, ReleasesPersec, RenewsPersec, RequestsPersec, SolicitsPersec, RebindsPersec FROM Win32_PerfFormattedData_dhcpserver_DHCPServerv6");
      database_ad = @("SELECT Name, DatabaseaddsPersec, DatabasedeletesPersec, DatabasemodifysPersec, DatabaserecyclesPersec from Win32_PerfFormattedData_NTDS_NTDS");
      dfsfolders = @("SELECT Name, ConflictSpaceInUse, DeletedSpaceInUse, StagingSpaceInUse, UpdatesDropped, FileInstallsRetried FROM Win32_PerfFormattedData_dfsr_DFSReplicatedFolders");
      dns = @("SELECT Name, CachingMemory, DatabaseNodeMemory, NbstatMemory, TCPMessageMemory, DynamicUpdateReceived, DynamicUpdateRejected, DynamicUpdateTimeOuts, DynamicUpdateWrittentoDatabase, DynamicUpdateNoOperationPersec, DynamicUpdateReceivedPersec, DynamicUpdateWrittentoDatabasePersec, RecursiveQueriesPersec, RecursiveQueryFailurePersec, RecursiveTimeOutPersec, SecureUpdateReceived, SecureUpdateFailure, SecureUpdateReceivedPersec, TCPResponseSentPersec, TotalQueryReceivedPersec, TotalResponseSentPersec, UDPQueryReceivedPersec, UDPResponseSentPersec, UnmatchedResponsesReceived, ZoneTransferFailure, ZoneTransferSuccess, RecursiveQueries, DynamicUpdateQueued, TotalQueryReceived, TotalResponseSent FROM Win32_PerfFormattedData_DNS_DNS");
      dfsconnectons = @("SELECT Name, BytesReceivedPerSecond, TotalBytesReceived, TotalFilesReceived FROM Win32_PerfFormattedData_dfsr_DFSReplicationConnections");
      atq = @("SELECT Name, ATQOutstandingQueuedRequests, ATQEstimatedQueueDelay, ATQRequestLatency, ATQThreadsLDAP, ATQThreadsOther, ATQThreadsTotal FROM Win32_PerfRawData_DirectoryServices_DirectoryServices");
}

Get-WMIObject -Query "SELECT Domain from Win32_ComputerSystem" | out-null

foreach ($fs in $featuresets.GetEnumerator()) {
    try {
        foreach ($query in $fs.Value) {
            Get-WMIObject -Query $query | out-null
        }
        Write-Output "Successfully validated all queries in the $($fs.Name) feature set."
    } catch {
        Write-Error "Errors quering WMI class: $($_)"
    }
}
