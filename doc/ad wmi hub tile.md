Monitor the health and performance of Microsoft Active Directory services.

## Overview
This Dynatrace extension leverages the WMI protocol to gather all relevant data to constantly monitor the health and performance of Microsoft Active Directory services. While combining all relevant data into pre-configured dashboards, this extension also enables alerting and event tracking.

**This is intended for users, who:**
- Want to enable essential monitoring for their Active Directory services, easily
- Look for a dedicated out-of-the-box dashboard for AD monitoring
- Use Dynatrace for integrated analysis of the infrastructure services, ike AD, and apps that depend on this infrastructure

**This extension enables you to:**
- Monitor Active Directory services: DHCP, DNS, DFS, LDAP, ATQ, Kerberos and NTLM
- Monitor AD Network adapters and AD/LSA database
- Receive alerts based on anomalies detected in AD KPI values and trends 

**This extension has a companion**
This is foundational extension for AD monitoring and there is a companion [Active Directory extended monitoring](https://www.dynatrace.com/hub/detail/active-directory-extended-monitoring/) extension available, which supplements the solution with several key metrics, for a complete AD observability pack. **For best results, activate both extensions in your environment.**



## Get started
Simply activate this extension using the in-product Dynatrace Hub. 
- In the extension configuration, enable it on your Active Directory hosts
- You may choose which feature sets you want to activate.
  - Disable feature sets that are not relevant to your environment. For example, if your AD server does not serve DHCP - disable the DHCP feature set
  - This way you will avoid errors reported in the extension log, when the extension will try to retrieve metrics that are not available

Further reading: broaden your knowledge on Dynatrace extensions in the Dynatrace Documentation:
- [Extensions 2.0 overview](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20)
- [Extensions 2.0 concepts](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20/extensions-concepts)
- [Manage Extensions 2.0 lifecycle](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20/extension-lifecycle)
- [Create a WMI extension](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20/data-sources/wmi-extensions)

**Note: :red_circle: breaking change. Metric names changed, affecting timeseries continuity, alerts and custom dashboards**
Release 3 of the ActiveDirectory extension consolidates metrics from a number of previously available public and custom extensions that targeted ActiveDirectory. Because of the breadth of consolidation (four extensions), we had to unify metric naming and thus define all metrics names from the ground up. We trust you will find them more self-explanatory and easier to use now, as the names are shorter. They are also aligned with the companion extension mentioned earlier.

As a consequence:
- :warning: When updating the extension through the in-product hub, you have to *add new configuration* instead of updating the previous one. Previous 2.x AD extension configuration can't be updated. Remember to remove the previous configuration, so metrics won;t be collected twice
- :warning: Revisit any metric alerts of dashboards you've created using AD metrics. You need to replace previously used metrics with the new ones, as their names and IDs changed


## Details
The Active Directory services extension is built on top of the Extension Framework 2.0 and uses WMI to obtain metrics. Therefore, this extension data set is limited to KPIs available to the WMI queries. .

**The extension package contains:**
- WMI data source configuration
- dashboard template
- unified-analysis page template
- topology definition 
- entity extraction rules

**More information**
...TBA... blog post

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

**Note on some metrics availability:** Windows Server 2022 brought a change to the metrics set returned by the `Win32_PerfRawData_Lsa_SecuritySystemWideStatistics` class. Because of this change, the AD extension is unable to report on "NTLM Authentications" and "Kerberos Authentications" metrics and these metrics have been removed from the extension. Consequently, these metrics won't be reported also when this extension is actuated or earlier Windows servers. More information on this change and reasons behind it can be found on [Microsoft KB pages](https://support.microsoft.com/en-us/topic/kb5004442-manage-changes-for-windows-dcom-server-security-feature-bypass-cve-2021-26414-f1400b52-c141-43d2-941e-37ed901c769c). 



**Q&A**

### Q: What is the DDU Consumption of this extension?

A: The formula for DDU consumption of the extension is:

```
 ( 10
+
 )  * 525.6 DDUs/year
```

Typical consumption for a single-domain AD server, hosting one DHCP server and one LDAP instance, amounts to `47,304 DDUs/year`

DDU cost above does not include any possible Log events or Custom events triggered by the extension. For more information on this, please visit the [DDU log event cost](https://www.dynatrace.com/support/help/manage/subscriptions-and-licensing/monitoring-consumption-classic/davis-data-units/log-monitoring-consumption) and [DDU custom event cost](https://www.dynatrace.com/support/help/manage/subscriptions-and-licensing/monitoring-consumption-classic/davis-data-units/ddu-events) pages.

### Q: I see this extension failing with an Error status in my environment?

A: Verify whether you have DHCP service running on your AD server. If it is not running - disable DHCP feature set in the extension configuration.



## Documentation link
https://www.dynatrace.com/support/help/extend-dynatrace/extensions20

## Marketing link
https://www.dynatrace.com/news/blog/leverage-wmi-to-enable-full-observability-and-monitor-performance-of-windows-hosts-and-services/
