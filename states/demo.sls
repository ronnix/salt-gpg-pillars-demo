demo:
  file.managed:
    - name: /etc/demo.cfg
    - source: salt://demo.jinja
    - template: jinja
