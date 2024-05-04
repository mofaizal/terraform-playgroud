

# Terraform Environment setup 

Step # 1
Install Linux on Windows with WSL
Install [WSL on Windows 11](https://learn.microsoft.com/en-us/windows/wsl/install)

Step # 2
Get started using [Visual Studio Code with Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-vscode)


Step # 3 
Install [Terraform on WSL](https://developer.hashicorp.com/terraform/install)
follow the steps for Ubuntu/Debian

```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

```

Step # 4
Install VS Code extensions
- HashiCorp Terraform
- Azure Terraform
- Terraform AzAPI Provider
- ANSI Colors
- Azure App Service
- Azure Functions
- Azure Static WebApps
- Azure Resource
- Azure Account
- GitLens 
- Better Comments
- Prettier
- Code Spell Checker
- Error Lens
- YAML
- TODO Highlight 
- Bracket Pair Colorization Toggler
- CodeSanp
- Peacock
- GitHistory
- Git Graph
- Deepdrak Material Theme

// TODO: Update content here
// FIXME: Update contnet here


Optional extension
- Draw.io
- C#
- Code Tour
- Color Highlight
- Dev Containers
- Docker
- GitHub Actions
- GitHub Copilot
- GitHub Pull Request
- Gitpod
- indent-rainbow
- markdownlint
- Material Icon Theme
- Postman
- preview 
- Remote -SSH
- WSL
- Live Server 
- Auto Rename Tag
- Markdown All in One
- GitHistory
- Git Graph
- Polacode-2022


Step #5
- terraform-docs [Auto Documentation](https://terraform-docs.io/)
  