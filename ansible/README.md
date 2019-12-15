#
# https://github.com/DmytroMorhulDevPro/Ansible-education.git
#
# Ansible-education
   This repo conteain a couple roles which can show basic behavor of ansible roles

For start using this you need to create your inventory file and basic playbook

template of inventory file

```yaml
---
  all:
    children: 
      monitoring:
        hosts:
          host1:
            ansible_host: xxx.xxx.xxx.xxx
          host2:
            ansible_host: zzz.zzz.zzz.zzz
          host3:
            ansible_host: yyy.yyy.yyy.yyy
    vars:
      ansible_become: yes
      ansible_become_method: sudo 
```

template of playbook file

```yaml
---
- name: I'll do something
  hosts: some_hosts or group
  gather_facts: true or false
  tasks:
    - name: first step will be
      include_role:
        name: some role
    
    - name: second step will be
      include_tasks:
        name: some_task.yaml

    - name: third step will be
      module_name:
        do_some: action
```
