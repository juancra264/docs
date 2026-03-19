## Migration Steps from SSL VPN Tunnel Mode to IPsec Dialup

Migrating from SSL VPN tunnel mode to IPsec Dialup in FortiOS involves reconfiguring remote access using standards-based IPsec, as SSL VPN tunnel mode is deprecated in FortiOS 7.6.3+. 

### 1. **Assess Current SSL VPN Configuration**
Review existing settings including:
- User authentication methods (local, LDAP, RADIUS, SAML)
- IP address pools for clients
- Split tunneling rules and firewall policies
- DNS settings and portal configurations

### 2. **Configure IPsec Dialup via GUI or CLI**
Use the **VPN Wizard** for simplified setup:
- **Phase 1 (IKE)**:
  - Set `Type` to *Dialup User*
  - Use **IKEv2** (IKEv1 not supported on FortiClient 7.4.4+)
  - Enable `Mode Config` for IP assignment
  - Set `Authentication Method` (PSK or Certificate)
  - Enable `NAT Traversal` and `EAP`
  - Optionally set `Transport` to **TCP** (port 443) for firewall traversal
- **Phase 2**:
  - Define security proposals (e.g., `aes128-sha256`)
  - Set `IPv4 Remotensubnet` to match client IP range

### 3. **Replicate Firewall Policies**
Replace SSL VPN policies (`srcintf: ssl.root`) with IPsec equivalents:
- Set `Incoming Interface` to the new IPsec tunnel interface
- Apply same source/destination, service, and user group rules
- Enable NAT if clients need internet access 

### 4. **Configure Client Settings**
On FortiClient or EMS:
- Set **Connection Type** to IPsec
- Enter FortiGate’s public IP and pre-shared key
- Match **Network ID** if configured on FortiGate
- Enable **Save Password** and **Keep Alive** as needed

### 5. **Test and Validate**
- Connect using FortiClient and verify IP assignment
- Confirm access to internal resources
- Check logs under **VPN > IPsec Tunnels** for errors 

### 6. **Decommission SSL VPN**
After successful migration:
- Disable SSL VPN service
- Remove obsolete firewall policies and portals
- Update documentation and user guides
