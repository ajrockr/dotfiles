# SMB Share Access via Kerberos (No Domain Join)

For accessing Windows domain SMB shares from Arch without joining the domain.
Full domain join is not worth it for a single-user workstation — Kerberos tickets
give seamless SMB auth without the overhead of SSSD/winbind or DC login dependency.

---

## Install

```bash
sudo pacman -S krb5 smbclient cifs-utils
```

---

## Configure Kerberos

Edit `/etc/krb5.conf`:

```ini
[libdefaults]
    default_realm = DOMAIN.COM
    dns_lookup_realm = false
    dns_lookup_kdc = true

[realms]
    DOMAIN.COM = {
        kdc = dc.domain.com
        admin_server = dc.domain.com
    }

[domain_realm]
    .domain.com = DOMAIN.COM
    domain.com = DOMAIN.COM
```

> Replace `DOMAIN.COM` and `dc.domain.com` with your actual domain and DC hostname.

---

## Daily usage

```bash
# Get a Kerberos ticket (valid ~8 hours)
kinit username@DOMAIN.COM

# Verify ticket
klist

# Mount an SMB share using the ticket
sudo mount -t cifs //server/share ~/mnt/share \
    -o sec=krb5,uid=$(id -u),gid=$(id -g)

# Or access without mounting
smbclient //server/share -k
```

---

## Persistent mounts (fstab)

```
//server/share  /home/tony/mnt/share  cifs  sec=krb5,uid=tony,gid=tony,noauto,user  0  0
```

`noauto,user` means it won't mount at boot and any user can mount it manually:

```bash
mount ~/mnt/share   # uses existing Kerberos ticket
```

> Ticket must be valid (`kinit` first). Add a reminder or alias to renew it.

---

## Useful aliases (add to ~/.bashrc)

```bash
alias smb-login='kinit username@DOMAIN.COM'
alias smb-status='klist'
alias smb-logout='kdestroy'
```

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `kinit: Cannot contact any KDC` | Check DC hostname in `/etc/krb5.conf`, verify network |
| `mount: permission denied` | Ticket expired — run `kinit` again |
| `NT_STATUS_ACCESS_DENIED` | Share permissions, not Kerberos — check ACLs on the Windows side |
| Clock skew error | Kerberos requires clocks within 5 min — sync with `sudo timedatectl set-ntp true` |
