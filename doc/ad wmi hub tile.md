Monitor the health and performance of Microsoft Active Directory services.

## Overview
This Dynatrace extension monitors foundations of the Microsoft Active Directory services health and performance. Relevant metrics are obtained from the local WMI metrics store on the AD server where the extension runs. While combining all relevant data into pre-configured dashboards, this extension also enables alerting and event tracking.

**This is intended for users, who:**
- Want to enable essential monitoring for their Active Directory services, easily
- Look for a dedicated out-of-the-box dashboard for AD monitoring
- Use Dynatrace for integrated analysis of the infrastructure services, ike AD, and apps that depend on this infrastructure

**This extension enables you to:**
- Monitor Active Directory services: DHCP, DNS, DFS, LDAP, ATQ, Kerberos and NTLM
- Monitor AD Network adapters and AD/LSA database
- Receive alerts based on anomalies detected in AD KPI values and trends 

**This extension has a companion:**
This is foundational extension for AD monitoring and there is a companion [Active Directory extended monitoring](https://www.dynatrace.com/hub/detail/active-directory-extended-monitoring/) extension available, which supplements the solution with several key metrics, for a complete AD observability pack. **For best results, activate both extensions in your environment.**



## Get started
Simply activate this extension using the in-product Dynatrace Hub. 
- Activate it locally on your AD hosts
  - Install OneAgent on your AD servers before activating this extension - OneAgent is required to run and control the extension.
  - We don't recommend Remote activation of this extension, i.e. running it on the ActiveGate and connecting to your AD hosts over the network. See Q&A below for more details.
- In the extension configuration, enable it on your Active Directory hosts
- You may choose which feature sets you want to activate.
  - Disable feature sets that are not relevant to your environment.
  - This way you will avoid errors reported in the extension log, when the extension will try to retrieve metrics that are not available.
  - See Q&A section for more details.

Further reading: broaden your knowledge on Dynatrace extensions in the Dynatrace Documentation: [Extensions 2.0 overview](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20)

**Note: `breaking change`. Metric names changed, affecting timeseries continuity, alerts and custom dashboards**

Release 3 of the ActiveDirectory extension consolidates metrics from a number of previously available public and custom extensions that targeted ActiveDirectory. Because of the breadth of consolidation (Active Directory services, AD Replication, versions for Extension Framework 1 and 2), we had to unify metric naming and thus define all metrics names from the ground up. We trust you will find them more self-explanatory and easier to use now, as the names are shorter. They are also aligned with the companion extension mentioned earlier.

As a consequence:
- When updating the [Active Directory services](https://www.dynatrace.com/hub/detail/active-directory-services/?query=actie+directory&filter=all) extension through the in-product hub, you have to `add new configuration` instead of updating the previous one. Previous 2.x AD extension configuration can't be updated. Remember to remove the previous configuration, so metrics won't be collected twice
- `Revisit any metric alerts` and dashboards you've created using AD metrics. You need to replace previously used metrics with the new ones, as their names and IDs changed
- If looking to update [Microsoft Active Directory replication](https://www.dynatrace.com/hub/detail/microsoft-active-directory-replication/?query=actie+directory&filter=all#overview) extension - the update comes as an integral part of the companion [Active Directory extended monitoring](https://www.dynatrace.com/hub/detail/active-directory-extended-monitoring/) extension. In the other words - `remove` [Microsoft Active Directory replication](https://www.dynatrace.com/hub/detail/microsoft-active-directory-replication/?query=actie+directory&filter=all#overview) and `start using` [Active Directory extended monitoring](https://www.dynatrace.com/hub/detail/active-directory-extended-monitoring/) instead.

## Details
The Active Directory services extension is built on top of the Extension Framework 2.0 and uses WMI to obtain metrics. Therefore, this extension data set is limited to KPIs available to the WMI queries.

**The extension package contains:**
- dashboard template
- unified-analysis page template
- topology definition 
- entity and metric extraction rules

**Further information about the extension can be found in the Dynatrace Product News Blog:**
- [Extend Dynatrace automation and AI capabilities more easily than ever](https://www.dynatrace.com/news/blog/extend-dynatrace-automation-and-ai-capabilities-more-easily-than-ever/)
- [Leverage WMI to enable full observability of Windows Hosts and services to monitor health and improve performance.](https://www.dynatrace.com/news/blog/leverage-wmi-to-enable-full-observability-and-monitor-performance-of-windows-hosts-and-services/)



## Use cases
- Operational monitoring of your Active Directory services, tenant, for usage, performance and availability 
- Analyze trends and baselines of the Active Directory services usage, raise alerts on anomalies detected



**Compatibility information**  
- Only on-premises Active Directory deployments are supported
- Azure AD is not supported
- Windows Server 2016, 2019 and 2022 are supported
- Activate this extension locally on your AD hosts. We don't recommend Remote activation of this extension.

**Note on some metrics availability:** 

Windows Server 2022 brought a change to the metrics set returned by the `Win32_PerfRawData_Lsa_SecuritySystemWideStatistics` class. Because of this change, the AD extension is unable to report on "NTLM Authentications" and "Kerberos Authentications" metrics and these metrics have been removed from the extension. Consequently, these metrics won't be reported also when this extension is activated on earlier Windows servers. More information on this change and reasons behind it can be found on [Microsoft KB pages](https://support.microsoft.com/en-us/topic/kb5004442-manage-changes-for-windows-dcom-server-security-feature-bypass-cve-2021-26414-f1400b52-c141-43d2-941e-37ed901c769c). 



**Q&A**

### Q: What is the DDU Consumption of this extension?

A: An estimated formula for DDU consumption of the extension is:

```
92 * number of Domain Controllers * 525.6 DDUs/year
```

Typical consumption for a single-domain AD server, hosting one DHCP server and one LDAP instance, amounts to `48,355 DDUs/year`. It may be slightly lower if you disable some feature sets in the extension configuration. Compare number of metrics provided in specific feature sets.

DDU cost above does not include any possible Log events or Custom events triggered by the extension. For more information on this, please visit the [DDU log event cost](https://www.dynatrace.com/support/help/manage/subscriptions-and-licensing/monitoring-consumption-classic/davis-data-units/log-monitoring-consumption) and [DDU custom event cost](https://www.dynatrace.com/support/help/manage/subscriptions-and-licensing/monitoring-consumption-classic/davis-data-units/ddu-events) pages.

### Q: I see this extension failing with an Error status in my environment?

A: Verify whether you have specific services running on your AD server. If a service is not running - disable feature set describing that service in the extension configuration. Example error text you may encounter: 
```
**Cannot execute query: DHCPServerv6 on device ******** err:Exception occurred. (Invalid class )**
```
means you should disable the DHCPv6 feature set because your AD server does not run DHCPv6 service, so extension won't be able to obtain metrics for this service.

### Q: You advice to activate the extension locally, but I see that remote activation is still possible?

A: Currently all WMI-based extensions can be activated either locally or remotely. Although Remote activation is technically supported, it may be challenging to arrive at the proper set of the remote user privileges required to access AD host WMI store over the network. 

Note: in the future releases we plan to remove the possibility of remote activation of this extension.

### Q: What limitations would I face with remote activation of this extension?

A: Remote activation means that AD metrics won't be enriched with the AD host dimensions that would have been known if OneAgent were running on the AD host, which may affect reporting screens and drilldowns. Therefore, stick to the Local activation on the AD hosts, making sure that OneAgent is also installed on your AD hosts.

Note: in the future releases we plan to remove the possibility of remote activation of this extension.

## Documentation link
https://www.dynatrace.com/support/help/extend-dynatrace/extensions20

## Marketing link
https://www.dynatrace.com/news/blog/leverage-wmi-to-enable-full-observability-and-monitor-performance-of-windows-hosts-and-services/
