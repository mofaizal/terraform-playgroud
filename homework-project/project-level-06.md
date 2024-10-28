
### Level 06: Use Level 03, 04, and 05 as Data Block (Azure Firewall, Route Outbound Traffic)

## Hub and Spoke Architecture

#### **Requirements:**
1. **Azure Firewall**: Set up an Azure Firewall for network security.
2. **Route Outbound Traffic**: Route all outbound traffic through the Azure Firewall.

#### **Considerations:**
- Ensure that NSGs and route tables are configured to forward traffic through the firewall.
- Define rules for inbound and outbound traffic in the firewall.

#### **Functions and Tools:**
- **Use**: `data` blocks for existing resources (like VNET, subnets, NSGs).
- **Routing**: Ensure outbound traffic is routed to the firewall.
- **Tools**: TFLint, terraform-docs, Checkov for security compliance.
