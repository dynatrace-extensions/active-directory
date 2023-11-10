Monitor the health and performance of Microsoft Active Directory services.

## Overview
This Dynatrace extension leverages the WMI protocol to gather all relevant data to constantly monitor the health and performance of Microsoft Active Directory services. While combining all relevant data into pre-configured dashboards, this extension also enables alerting and event tracking.

**This is intended for users, who:**
Want to get full monitoring for their Hyper-V clusters, detect problems ahead of serious impact, and pinpoint the root cause in their virtualization and application layer, including:
- Processor bottlenecks
- Memory bottlenecks
- Network bottlenecks
- Storage bottlenecks
- Dependent applications hosted on the Hyper-V cluster

## Get started
Please find detailed steps on how to get started in Dynatrace Documentation:
- [Extensions 2.0 overview](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20)
- [Extensions 2.0 concepts](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20/extensions-concepts)
- [Manage Extensions 2.0 lifecycle](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20/extension-lifecycle)
- [Create a WMI extension](https://www.dynatrace.com/support/help/extend-dynatrace/extensions20/data-sources/wmi-extensions)

## Details

The Active Directory services extension is built on top of the Extension Framework.

### Extension package contains:
- WMI data source configuration
- dashboard template
- unified-analysis page template
- topology definition 
- entity extraction rules

**Further information about the extension can be found in the Dynatrace Product News Blog:**
- [Extend Dynatrace automation and AI capabilities more easily than ever](https://www.dynatrace.com/news/blog/extend-dynatrace-automation-and-ai-capabilities-more-easily-than-ever/)
- [Leverage WMI to enable full observability of Windows Hosts and services to monitor health and improve performance.](https://www.dynatrace.com/news/blog/leverage-wmi-to-enable-full-observability-and-monitor-performance-of-windows-hosts-and-services/)

## Use cases
### Intended for users who want to:

- Monitor Microsoft Active Directory services
- Get a dedicated out-of-the-box dashboard
- Use Dynatrace for integrated analysis

### Enables you to:

- Monitor Active Directory services: DHCP, DNS, DFS, LDAP, ATQ, Kerberos and NTLM
- Monitors AD Network and AD/LSA Database use
- Enable alerting based on detected anomalies

**Compatibility information**  
### Supported distributions
- Only on-premises Active Directory deployments are supported. 
- Azure AD is not supported. 
- Windows Server 2016 or 2019

## Documentation link
https://www.dynatrace.com/support/help/extend-dynatrace/extensions20

## Marketing link
https://www.dynatrace.com/news/blog/leverage-wmi-to-enable-full-observability-and-monitor-performance-of-windows-hosts-and-services/