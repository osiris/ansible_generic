# _Ansible Generic_

This repository is for generic playbooks using _Ansible_ core modules.

## Requirements

- ansible
- ansible-lint

## Dependencies

None

## Playbooks

### `raw-python.yml`

Install `python` usign `raw` _module_ to allow use _Ansible_ in remote _host_.

Default variables:

| _variable_                | _default_            |
|---------------------------|----------------------|
| `python_dnf_config      ` | `true              ` |
| `python_python2         ` | `false             ` |
| `python_python2_bin     ` | `/usr/bin/python2.7` |
| `python_python3         ` | `true              ` |
| `python_python3_bin     ` | `/usr/bin/python3.6` |
| `python_yum_config      ` | `true              ` |
| `python_yum_update      ` | `true              ` |

Optional variables:

| _variable_                | _example_                                                           |
|---------------------------|---------------------------------------------------------------------|
| `python_dns_nameserver  ` |  `1.1.1.1`                                                          |
| `python_http_proxy_host ` |  `10.1.0.1`                                                         |
| `python_http_proxy_port ` |  `3128`                                                             |
| `python_http_proxy_url  ` |  `http://{{ python_http_proxy_host }}:{{ python_http_proxy_port }}` |
| `python_http_test:      ` |  `https://mirrors.almalinux.org:443/mirrorlists/8/baseos`           |

### `service.yml`

Allow to modify state of multiple services, variable example:

```yaml

generic_service_state:
  - name: mysql
    state: stopped
  - name: mysql
    state: started
  - name: nginx
    state: reloaded
  - name: nginx
    state: restarted

```

## License

GNU General Public License, GPLv3.

## Author Information

This role was created in 2022 by
 [Osiris Alejandro Gomez](https://osiux.com/), worker cooperative of
 [gcoop Cooperativa de Software Libre](https://www.gcoop.coop/).
