#!/bin/bash
set -e

echo "=== Cassandra SSO Ansible Setup ==="

# Check Python
echo "Checking Python 3 installation..."
python3 --version || (echo "Python 3 is required" && exit 1)

# Install pip requirements
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Create required directories
echo "Creating directories..."
mkdir -p logs
mkdir -p inventory/host_vars
mkdir -p roles/{cassandra-base,sso-ldap,sso-oauth,security-auth}/{tasks,templates,handlers,vars}
mkdir -p playbooks
mkdir -p scripts
mkdir -p docs

echo ""
echo "Setup complete!"
echo ""
echo "Next steps:"
echo "1. Configure your inventory: vim inventory/hosts.yml"
echo "2. Run setup: chmod +x setup.sh && ./setup.sh"
echo "3. Deploy: ansible-playbook playbooks/cassandra-sso-integrated.yml"
echo ""
echo "For help, see README.md"
echo ""
