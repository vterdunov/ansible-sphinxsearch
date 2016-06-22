Sphinxsearch
============
[![Build Status](https://travis-ci.org/vterdunov/ansible-sphinxsearch.svg?branch=master)](https://travis-ci.org/vterdunov/ansible-sphinxsearch)

This role installs and configures the Sphinx search engine.

Requirements
------------
None

Role Variables
--------------

```
# sphinxsearch PPA (https://launchpad.net/~builds)
sphinx_ppa: 'ppa:builds/sphinxsearch-rel22'

# searchd settings
sphinx_searchd:
  listen: ['0.0.0.0:9312', '9306:mysql41']
  log: '/var/log/sphinxsearch/searchd.log'
  query_log: '/var/log/sphinxsearch/query.log'
  read_timeout: 5
  max_children: 30
  pid_file: '/var/run/sphinxsearch/searchd.pid'
  seamless_rotate: 1
  preopen_indexes: 1
  unlink_old: 1
  workers: 'threads'
  binlog_path: '/var/lib/sphinxsearch/data'

sphinx_indexer:
  mem_limit: '64M'

# sources settings
sphinx_sources:
  - 'source test_source':
    - 'type = xmlpipe2'
    - 'xmlpipe_command = cat /tmp/test.xml'

# indexes settings
sphinx_indexes:
  - index test_index:
    - 'source = test_source'
    - 'path = /var/lib/sphinxsearch/data/test_index'
    - 'charset_type = utf-8'
```

Dependencies
------------
None

Example Playbook
----------------
```
- hosts: all
  become: yes

  roles:
     - role: ansible-sphinxseacrh
```

Author Information
------------------
Разработано и протестировано для Ubuntu 14.04 (trusty)

