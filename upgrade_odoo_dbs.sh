#!/bin/bash
systemctl stop odoo
for i in $(sudo -u postgres psql -c '\l' | grep odoo | awk '{print $1}')
do
        echo "Upgrading database $i"
        sudo -u odoo /usr/bin/odoo --stop-after-init -c /etc/odoo/odoo.conf -d $i -u all --logfile=/tmp/odoo_$i
done
systemctl start odoo
