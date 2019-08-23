#!/bin/bash
for i in $(sudo -u postgres psql -c '\l' | grep odoo | awk '{print $1}')
do
        echo "Show open POS for $i"
        sudo -u postgres psql -d $i -c "select name,start_at,create_date,state from pos_session where state !='closed' and start_at < now() - interval '24 hour';"|grep open
done
