# Packages
nano_pkg:
  pkg.installed:
    - name: nano

wget_pkg:
  pkg.installed:
    - name: wget

## SSH settings
# SSH keys
myssh_key:
  ssh_auth.present:
    - user: root
    - source: salt://ssh_keys/id_rsa.pub

# Known_hosts
/root/.ssh/known_hosts:
  file.managed:
    - source: salt://ssh_keys/known_hosts
    - user: root
    - group: root
    - mode: 600
    - template: jinja
