# **⚠️ This is a mirror repository** 
Please don't make commits here, instead contribute to:

[https://github.com/dynatrace-extensions/active-directory](https://github.com/dynatrace-extensions/active-directory)

# Active Directory Extension
### **Privileges**
Extension do not require additional permissions settings, other than basic configuration for WMI Remote Extensions.

To gather metric from this extension, services such as DNS, DHCP and DFS have to be installed.
## Metrics
----
### **DNS**
 - `dns.server.caching.memory.total` - the total caching memory used by DNS server
 - `dns.server.databasenode.memory.total` - the total database node memory used by DNS server
 - `dns.server.nbstat.memory.total` - the total Nbstat memory used by DNS server
 - `dns.server.tcpmessage.memory.total` - the total TCP message memory used by DNS server
 - `dns.server.dynamicupdate.received.total` - the total number of dynamic update requests received by the DNS server
 - `dns.server.dynamicupdate.rejected.total` - the total number of dynamic updates rejected by the DNS server
 - `dns.server.dynamicupdate.timeouts.total` - the total number of dynamic update timeouts of the DNS server
 - `dns.server.dynamicupdate.writtentodatabase.total` - the total number of dynamic updates written to the database by the DNS server
 - `dns.server.dynamicupdate.nooperation.persec` - the average number of No-operation/Empty dynamic update requests received by the DNS server in each second
 - `dns.server.dynamicupdate.received.persec` - the average number of dynamic update requests received by the DNS server in each second
 - `dns.server.dynamicupdate.writtentodatabase.persec` - the average number of dynamic updates written to the database by the DNS server in each second
 - `dns.server.recursive.queries.persec` - the average number of recursive queries received by DNS server in each sencond
 - `dns.server.recursive.queryfailure.persec` - the average number of recursive query failures in each second
 - `dns.server.recursive.timeout.persec` - the average number of recursive query sending timeouts in each second
 - `dns.server.secureupdate.received.total` - the total number of secure update requests received by the DNS server
 - `dns.server.secureupdate.failure.total` - the total number of secure updates failed of the DNS server
 - `dns.server.secureupdate.received.persec` - the average number of secure update requests received by the DNS server in each second
 - `dns.server.tcpresponse.sent.persec` - the average number of TCP reponses sent by DNS server in each second
 - `dns.server.totalquery.received.persec` - the average number of queries received by DNS server in each second
 - `dns.server.udpquery.received.persec` - the average number of UDP queries received by DNS server in each second
 - `dns.server.udpresponse.sent.persec` - the average number of UDP reponses sent by DNS server in each second
 - `dns.server.unmatchedresponses.received.total` - the DNS server that do not match any outstanding remote query
 - `dns.server.zonetransfer.failure.total` - the total number of failed zone transfers of the master DNS server
 - `dns.server.zonetransfer.success.total` -  the total number of successful zone transfers of the master DNS server

### **DHCP**
**DHCP Server**
 - `dhcp.server.requests.persec` - rate of DHCP Requests received by the DHCP server
 - `dhcp.server.releases.persec` - rate of DHCP Releases received by the DHCP server
 - `dhcp.server.declines.persec` - rate of DHCP Declines received by the DHCP server
 - `dhcp.server.failover.bndack.received.persec` - number of DHCP failover Binding Ack messages received
 - `dhcp.server.failover.bndack.sent.persec` - number of DHCP failover Binding Ack messages sent
 - `dhcp.server.failover.bndupd.dropped` - number of binding updates dropped
 - `dhcp.server.failover.bndupd.pendinginoutbound.queue` - number of pending outbound DHCP failover Binding Update messages
 - `dhcp.server.failover.bndupd.received.persec` - number of DHCP failover Binding Update messages received
 - `dhcp.server.failover.bndupd.sent.persec` - number of DHCP failover Binding Update messages sent

**DHCP Server v6**
 - `dhcp.server.v6.renews.persec` - rate of DHCP Renews received by the DHCP Server v6
 - `dhcp.server.v6.releases.persec` - rate of DHCP Releases received by the DHCP Server v6
 - `dhcp.server.v6.declines.persec` - rate of DHCP Declines recevied by the DHCP Server v6
 - `dhcp.server.v6.requests.persec` - rate of DHCP Requests received by the DHCP Server v6
 - `dhcp.server.v6.solicits.persec` - rate of DHCP Solicits received by the DHCP Server v6
 - `dhcp.server.v6.rebinds.persec` - rate of DHCP Rebinds received by the DHCP Server v6

### **DFS**
**DFS Replicated Folders**
 - `dfs.server.replicatedfolders.conflictspaceinuse.bytes.total` - the total size (in bytes) of the conflict loser files and folders currently in the Conflict and Deleted folder used by the DFS Replication service
 - `dfs.server.replicatedfolders.deletedspaceinuse.bytes.total` - the total size (in bytes) of the deleted files and folders currently in the Conflict and Deleted folder used by the DFS Replication service
 - `dfs.server.replicatedfolders.stagingspaceinuse.bytes.total` - the total size (in bytes) of the files and folders currently in the staging folder used by the DFS Replication service
 - `dfs.server.replicatedfolders.updates.dropped` - the number of redundant file replication update records that were ignored by the DFS Replication service because they did not change the replicated file or folder
 - `dfs.server.replicatedfolders.fileinstalls.retried` - the number of file installs that are being retried due to sharing violations or other errors encountered when installing the files

**DFS Replication Connections**
 - `dfs.server.replicationconnections.bytesreceived.persec` - the estimate of the average number of bytes that were received each second over the past 30 seconds
 - `dfs.server.replicationconnections.bytesreceived.total` - the total number of bytes received on the connection. The bytes received value includes file data and replication metadata
 - `dfs.server.replicationconnections.filesreceived.total` - the number of files that were received on the connection

### **LDAP**
 - `ldap.server.ldapbindtime.binds.persec` - rate of LDAP binds
 - `ldap.server.ldapsuccessfulbinds.persec` - rate of LDAP successful binds
 - `ldap.server.ldapwrites.persec` - rate of LDAP writes
 - `ldap.server.ldapudpoperations.persec` - rate of LDAP UDP operations
 - `ldap.server.ldapactivethreads.total` - total number of LDAP active threads
 - `ldap.server.ldapclientsessions.total` - total number of client sessions
 - `ldap.server.ldapsearches.persec` - rate of LDAP searches

### **ATQ**
 - `atq.server.atqoutstandingqueuedrequests.total` - total number of ATQ oustanding requests
 - `atq.server.atqestimatedqueuedelay.persec` - rate of estimated ATQ queue delay
 - `atq.server.atqrequestlatency.persec` - ATQ request latency rate
 - `atq.server.atqthreadsldap.total` - total number of ATQ threads assigned to LDAP
 - `atq.server.atqthreadstotal.total` - total number of ATQ threads

### **DRA**
 - `dra.server.drasynchrequestssuccessful.total` - total number of successful synch requests by the DRA
 - `dra.server.drasynchrequestsmade.total` - total number of synch requests by the DRA

### **Network**
 - `network.login.logons` - total number of Network Profile logons
 - `network.logons.total.count` - total number of network logons
 - `network.logons.persec` - average number of network logons per second

### **LSASS**
**NTLM**
 - `lsass.ntlm.authentications.count` - number of NTLM authentications
 - `lsass.ntlm.binds.persec` - rate of NTLM binds

**Kerberos**
 - `lsass.server.kerberos.authentications.count` - number of Kerberos authentications

### **ESENT Database**
**Active Directory**
 - `esent.database.io.reads.persec` - rate of I/O reads by ESENT DB
 - `esent.database.io.writes.persec` - rate of I/O writes by ESENT DB
 - `esent.log.io.reads.persec` - rate of I/O log reads by ESENT DB
 - `esent.log.io.writes.persec` - rate of I/O log writes by ESENT DB
 - `esent.database.io.reads.latency.avg` - average latency for I/O reads by ESENT DB
 - `esent.database.io.writes.latency.avg` - average latency for I/O writes by ESENT DB
 - `esent.log.io.reads.latency.avg` - average latency for I/O log reads by ESENT DB
 - `esent.log.io.writes.latency.avg` - average latency for I/O log writes by ESENT DB

 **Local Security Authority**
 - `lsass.esent.database.io.reads.persec` - rate of I/O reads by ESENT DB
 - `lsass.esent.database.io.writes.persec` - rate of I/O writes by ESENT DB
 - `lsass.esent.log.io.reads.persec` - rate of I/O log reads by ESENT DB
 - `lsass.esent.log.io.writes.persec` - rate of I/O log writes by ESENT DB
 - `lsass.esent.database.io.reads.latency.avg` - average latency for I/O reads by ESENT DB
 - `lsass.esent.database.io.writes.latency.avg` - average latency for I/O writes by ESENT DB
 - `lsass.esent.log.io.reads.latency.avg` - average latency for I/O log reads by ESENT DB
 - `lsass.esent.log.io.writes.latency.avg` - average latency for I/O log writes by ESENT DB

## Project structure
```
example-extension           // root folder
├─── .ci                    // executor definition
|     └─── docker.yaml
├─── gradle                 // Gradle files
├─── src                    
|    └─── extension         // extension source code
|    |    ├─── alerts
|    |    └─── dashboards
|    └─── test              // extension tests
├───.gitignore              // GIT file
├─── build.gradle           // Gradle main build file  
├─── gradle.properties      // Gradle properties file
├─── gradlew                // Gradle wrapper script for Linux
├─── gradlew.bat            // Gradle wrapper script for WinOS
├─── Jenkinsfile            // Jenkins job definition
├─── OWNERS                 // source code owners
├─── README.md
├─── settings.gradle        // Gradle settings
└─── version.propeties      // extension version

```

## Run local build
Add the following line: 
```bash
signingHostname=security-service-dev.lab.dynatrace.org
```
to the file: `%userprofile%/.gradle/gradle.properties`

The local build is executed with the command:
```bash
gradlew build -i -s
```
and the results are stored in `./build/tmp/zipArtifact` <br>
or
```bash
gradlew publishToMavenLocal -i -s
```
and the results can be found also in the local repository: `%userprofile%/.m2/repository`

NOTE: If you want to omit the signing please add `skipSigning` property to the command:
```bash
gradlew build -PskipSigning -i -s
```

## Template changes integration
This enables you to update the template files in your project when the template has been changed. <br>
NOTE: Remember to update the extension version in `version.properties` file. <br>

Connect local repo to the template repo (if needed):
```bash
git remote add template https://bitbucket.lab.dynatrace.org/scm/dext2/example-extension.git
``` 
Update with the newest template:
```bash
git fetch template
git merge template/master
```

