# _Ansible Generic_

This repository is for generic playbooks using _Ansible_ core modules.

## Requirements

- ansible
- ansible-lint

## Dependencies

None

## Playbooks

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
