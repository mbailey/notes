# Ansible

| Task              | Command                                                            | Comments |
| ----------------- | ------------------------------------------------------------------ | -------- |
| Show vars         | `ansible -m debug -a "var=hostvars[inventory_hostname]" localhost` |          |
| Show all settings | `ansible-config dump`                                              |          |
| Show inventory    | `ansible-inventory --list`                                         |          |
| Ping              | `ansible all -m ping`                                              |          |

```shell
ansible-playbook --inventory inventories/failmode/ --limit proxy-fm playbooks/monitoring_stack.yml
```