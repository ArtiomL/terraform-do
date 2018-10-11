#cloud-config

package_upgrade: true

packages:
 - git
 - curl

users:
  - name: ${droplet_user}
    groups: sudo
    shell: /bin/bash
    ssh-authorized-keys:
      - ${public_key}

final_message: "The system is up, after $UPTIME seconds"
