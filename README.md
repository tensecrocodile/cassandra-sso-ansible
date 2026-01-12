# Cassandra SSO Ansible Automation

Enterprise-grade Ansible playbooks for deploying Apache Cassandra cluster with SSO (Single Sign-On) integration using LDAP/OAuth.

## Features

- Automated Cassandra cluster setup (3+ nodes)
- LDAP/OAuth SSO integration for authentication
- SSL/TLS encryption for secure communications
- High availability and replication configuration
- Audit logging and monitoring
- Security hardening and firewall rules
- Automated backup and snapshot scheduling
- Production-ready Ansible roles

## Project Structure

```
cassandra-sso-ansible/
├── README.md                          # Project documentation
├── requirements.txt                   # Python dependencies
├── setup.sh                           # Quick setup script
├── install.sh                         # Installation script
├── ansible.cfg                        # Ansible configuration
│
├── inventory/
│   ├── hosts.yml                      # Inventory hosts
│   ├── group_vars/
│   │   ├── cassandranodes.yml        # Cassandra node vars
│   │   ├── sso_servers.yml           # SSO server vars
│   │   └── all.yml                   # Global vars
│   └── host_vars/
│       └── example_host.yml          # Host-specific vars
│
├── roles/
│   ├── cassandra-base/               # Base Cassandra setup
│   ├── sso-ldap/                     # LDAP integration
│   ├── sso-oauth/                    # OAuth integration
│   └── security-auth/                # Security & TLS
│
├── playbooks/
│   ├── cassandra-deploy.yml          # Deploy Cassandra
│   ├── sso-setup.yml                 # Setup SSO
│   ├── cassandra-sso-integrated.yml  # Complete integration
│   └── security-hardening.yml        # Security setup
│
├── scripts/
│   ├── setup.sh                      # Environment setup
│   ├── verify-installation.sh        # Verification
│   ├── configure-ldap-server.sh      # LDAP config
│   └── test-sso-connection.sh        # Connection test
│
└── docs/
    ├── INSTALLATION.md               # Install guide
    ├── SSO-LDAP-SETUP.md            # LDAP setup
    ├── SSO-OAUTH-SETUP.md           # OAuth setup
    ├── ARCHITECTURE.md               # Architecture doc
    └── TROUBLESHOOTING.md            # Troubleshooting
```

## Requirements

- Ansible 2.9 or higher
- Python 3.8+
- 3+ nodes for Cassandra cluster
- Ubuntu 18.04+ or CentOS 7+ (each node)
- SSH access with sudo privileges
- 2GB+ RAM per node (minimum)
- 10GB+ disk space per node

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/tensecrocodile/cassandra-sso-ansible.git
cd cassandra-sso-ansible
```

### 2. Run Setup

```bash
chmod +x setup.sh scripts/*.sh
./setup.sh
```

### 3. Configure Inventory

Edit `inventory/hosts.yml` to match your environment:

```yaml
all:
  vars:
    ansible_user: ubuntu
    cassandra_version: "3.11.11"
    sso_type: "ldap"  # or "oauth"
  children:
    cassandranodes:
      hosts:
        cassandra-node1:
          ansible_host: 192.168.1.10
        cassandra-node2:
          ansible_host: 192.168.1.11
        cassandra-node3:
          ansible_host: 192.168.1.12
```

### 4. Deploy

```bash
# Full deployment with SSO
ansible-playbook playbooks/cassandra-sso-integrated.yml -i inventory/hosts.yml

# Or individual playbooks
ansible-playbook playbooks/cassandra-deploy.yml -i inventory/hosts.yml
ansible-playbook playbooks/sso-setup.yml -i inventory/hosts.yml
ansible-playbook playbooks/security-hardening.yml -i inventory/hosts.yml
```

## Configuration

### Cassandra Configuration

Edit `inventory/group_vars/cassandranodes.yml`:

```yaml
cassandra_cluster_name: "Production Cluster"
cassandra_version: "3.11.11"
replication_factor: 3
cassandra_seeds: "192.168.1.10,192.168.1.11,192.168.1.12"
```

### SSO Configuration

Edit `inventory/group_vars/sso_servers.yml`:

```yaml
ldap_base_dn: "dc=example,dc=com"
ldap_admin_dn: "cn=admin,dc=example,dc=com"
ldap_admin_password: "your_password"
```

## Usage

### Verify Installation

```bash
./scripts/verify-installation.sh
```

### Test SSO Connection

```bash
./scripts/test-sso-connection.sh
```

### Monitor Cluster

```bash
cqlsh cassandra-node1
DESCRIBE CLUSTER;
```

## Documentation

- [Installation Guide](docs/INSTALLATION.md)
- [LDAP Setup Guide](docs/SSO-LDAP-SETUP.md)
- [OAuth Setup Guide](docs/SSO-OAUTH-SETUP.md)
- [Architecture Overview](docs/ARCHITECTURE.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)

## Security Features

- ✅ SSL/TLS encryption for inter-node and client communication
- ✅ LDAP/OAuth authentication
- ✅ Firewall configuration per node
- ✅ Audit logging for all database operations
- ✅ Data encryption at rest
- ✅ SSH key-based authentication
- ✅ Role-based access control (RBAC)

## Troubleshooting

### Common Issues

1. **SSH Connection Fails**
   - Verify SSH keys are copied to nodes
   - Check ansible_user and ansible_ssh_private_key_file

2. **Cassandra Cluster Won't Start**
   - Check seed nodes are reachable
   - Verify port 7000 and 7001 are open
   - Review logs: `tail -f /var/log/cassandra/system.log`

3. **SSO Authentication Fails**
   - Verify LDAP/OAuth server is running
   - Check network connectivity between nodes
   - Review authentication logs

See [Troubleshooting Guide](docs/TROUBLESHOOTING.md) for detailed solutions.

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - See LICENSE file for details

## Author

Tensecrocodile - Data Security & Infrastructure Automation

## Support

For issues, questions, or suggestions, please open an issue on GitHub.

## References

- [Apache Cassandra Documentation](https://cassandra.apache.org/doc/latest/)
- [Ansible Documentation](https://docs.ansible.com/)
- [LDAP Authentication](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)
- [OAuth 2.0](https://oauth.net/2/)

---

**Last Updated:** January 2026
**Tested On:** Ubuntu 20.04 LTS, CentOS 7
**Cassandra Versions:** 3.11.x - 4.x
