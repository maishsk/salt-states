ntp:
  pkg.installed

/etc/ntp.conf:
  file.managed:
    - source:
      - salt://ntp/etc/ntp.conf
      - salt://ntp/etc/ntp.skel
    - user: root
    - group: root
    - mode: 600
    - template: jinja

ntpd:
  service:
    - require:
      - pkg: ntp
    - running
    - enable: True
    - watch:
      - file: /etc/ntp.conf
