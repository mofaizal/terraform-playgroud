### Level 03: Consume Modules to Create (VNET, Subnet, Resource Group, NSG, Route Table)

#### **Requirements:**
1. **VNET and Subnet**: Consume the VNET module to create a virtual network with specified address space and subnets.
2. **NSG**: Use the NSG module to create security groups and associate them with subnets. 
3. **Route Table**: Leverage the route table module to create and attach custom route tables to subnets.
4. **Resource Group**: Create and assign all resources to a specific resource group using the resource group module.

#### **Considerations:**
- Handle dependencies between resources, especially subnets and VNET.
- Use `depends_on` to manage resource creation order.
- Ensure module inputs are properly passed, including CIDR blocks, NSG rules, and route configurations.
- Plan resource dependencies properly so that resources like subnets are created only after the VNET is created.
- Use appropriate tags and naming conventions for easy resource management.


#### **Functions and Tools:**
- **Use**: `depends_on` for proper resource dependency.
- **Remote State**: If using multi-environment, consider remote state data to share resources.
- **Tools**: TFLint, terraform-docs.

#### **Mermaid Diagram**:
```mermaid
graph TD
    I[Module example]
    A[Resource Group Module]
    B[VNET Module]
    B1[Subnet 1]
    B2[Subnet 2]
    B3[Subnet 3]
    B4[Subnet 4]
    C[NSG Module]
    B0[VNET]
    D[Route Table Module]
    I --> A
    I --> B
    B --> B0
    B0 --> B1
    B0 --> B2
    B0 --> B3
    B0 --> B4
    I --> C
    A --> A1[Resource Group]
    A1 --> C
    A1 --> B0
    A1 --> C
    A1 --> D 
    C --> C1[NSG]
    C --> C2[NSG]
    C --> C3[NSG]
    C --> C4[NSG]
    B1 --> C1
    B2 --> C2
    B3 --> C3
    B4 --> C4

    I --> D
    D --> D1[Route Table]
    D --> D2[Route Table]
    D --> D3[Route Table]
    D --> D4[Route Table]
    B1 --> D1
    B2 --> D2
    B3 --> D3
    B4 --> D4

```
---