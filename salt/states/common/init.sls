# Packages
nano_pkg:
  pkg.installed:
    - name: nano

wget_pkg:
  pkg.installed:
    - name: wget

## SSH settings
# SSH keys
.ssh:
  ssh_auth.present:
    - user: root
    - source: salt://.ssh/id_rsa.pub

# Known_hosts
/root/.ssh/known_hosts:
  file.managed:
    - source: salt://.ssh/known_hosts
    - user: root
    - group: root
    - mode: 600
    - template: jinja
