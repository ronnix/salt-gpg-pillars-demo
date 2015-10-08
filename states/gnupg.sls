gpg-packages:
  pkg.installed:
    - names:
      - gnupg
      - python-gnupg

gpg-keys-directory:
  file.directory:
    - name: /etc/salt/gpgkeys
    - mode: 600

rngd:
  pkg.installed:
    - name: rng-tools

add-some-entropy:
  cmd.wait:
    - name: rngd -r /dev/urandom
    - watch:
      - pkg: rngd
