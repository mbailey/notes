# Inventory - AWS Systems Manager

- [Configuring inventory collection - AWS Systems Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-configuring.html#sysman-inventory-datasync)
- [Configuring resource data sync for Inventory - AWS Systems Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html)

Enabling inventory in AWS Systems Manager (SSM) allows you to collect and view detailed configuration, inventory, and metadata information about your EC2 instances and other managed instances in your AWS environment. Here's what happens when you enable inventory:

1. **Data Collection**: 
   - SSM Agent, installed on your instances, collects inventory information about the instance. This can include details about installed applications, AWS components, network configuration, Windows updates, file system information, and more.

2. **Customizable Inventory**: 
   - You can customize what inventory data to collect. AWS provides a set of predefined inventory types, and you can also create your own custom inventory types if needed.

3. **Scheduled Collection**: 
   - Inventory data is collected at a scheduled interval that you can define. This schedule can be adjusted based on your needs for data freshness versus operational overhead.

4. **Data Storage and Access**: 
   - Collected inventory data is stored in an S3 bucket and an optional Amazon RDS database linked to your account. You can view and analyze this data through the Systems Manager console, or use query tools for more complex analysis.

5. **Integration with Other AWS Services**: 
   - Inventory data can be used with other AWS services. For example, it can be integrated with AWS Config for configuration tracking and auditing, or with AWS CloudWatch for monitoring and alerts based on inventory data.

6. **Resource Data Sync**: 
   - If you set up Resource Data Sync, Systems Manager can aggregate inventory data from multiple AWS accounts and AWS Regions into a single S3 bucket. This simplifies the process of aggregating inventory data across your entire organization.

7. **Compliance and Reporting**: 
   - Inventory data helps in assessing compliance with policies and regulations. You can check whether instances are running the required software versions, patches, or configurations.

8. **Security Analysis**: 
   - Detailed inventory information can aid in security analysis. It helps in identifying unauthorized or vulnerable software installations.

9. **Operational Insights**: 
   - Regular inventory collection provides insights into your environment, assisting in operational decisions like hardware and software lifecycle management, license management, and resource optimization.

By enabling inventory in AWS Systems Manager, you enhance your visibility into the software and hardware configurations of your managed instances, which can greatly assist in management, compliance, security, and operational efficiency.

