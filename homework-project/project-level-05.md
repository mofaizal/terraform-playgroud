
### Level 05: Use Level 03 and 04 as Data Block (VMSS, Application Gateway, SSL, Key Vault, etc.)

#### **Requirements:**
1. **Subnet 02**: Add a new subnet. if required
2. **VMSS**: Deploy a Virtual Machine Scale Set in Subnet 02.
3. **Application Gateway**: Route traffic using Application Gateway.
4. **SSL Certificate**: Store SSL certificates in Key Vault and integrate them with the Application Gateway.
5. **Private Endpoint**: Create a private endpoint for Key Vault.
6. **Managed Identity**: Assign managed identities to the VMSS for secure access to Azure resources.


#### **Considerations:**
- Leverage managed identities to access Key Vault without secrets.
- Use private endpoints to secure communication between Application Gateway and Key Vault.

#### **Functions and Tools:**
- **Use**: `data` blocks to reference existing VNET, subnets, and NSGs.
- **Private Endpoint**: Secure resources using private endpoints.
- **Tools**: TFLint, terraform-docs, Pre-commit.
