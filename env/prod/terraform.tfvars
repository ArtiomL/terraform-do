# Production

do_regions      = ["fra1", "nyc1"]
key_path        = "/home/user/.ssh/id_rsa.pub"
key_name        = "Seashell"
droplet_names   = ["Droplet", "Sandbox"]
droplet_image   = "coreos-stable"
droplet_size    = "s-1vcpu-1gb"
droplet_backups = true
floating_ip     = false
droplet_user    = "nemo"
ssh_port        = 22
user_data_path  = "init.tpl"
firewall_name   = "Dam"
mgmt_asrc       = []
tags_shared     = ["env:prod", "owner:artioml", "project:nautilus"]
