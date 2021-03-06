include:
  - pkgs.system.pip
  {%- if salt['config.get']('virtualenv_path', None)  %}
  - projects.virtualenv
  {%- endif %}
  - pkgs.python.salttesting
  - pkgs.python.requests
  - pkgs.python.jinja2
  - pkgs.python.pyyaml
  - pkgs.python.msgpack-python
  - pkgs.python.m2crypto
  - pkgs.python.libnacl
  - pkgs.python.ioflo
  - pkgs.python.raet
  - pkgs.python.apache-libcloud

install_pylint:
  pip.installed:
    - name: 'PyLint==1.2.1'
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      {%- if salt['config.get']('virtualenv_path', None)  %}
      - virtualenv: create-virtualenv
      {%- endif %}
