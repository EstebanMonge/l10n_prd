cd $HOME
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
rm /etc/apt/sources.list.d/odoo.list
rm /etc/apt/sources.list.d/backports.list
echo "deb http://nightly.odoo.com/12.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list
echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list.d/backports.list
apt-get update && apt-get -y install odoo postgresql unzip git python3-phonenumbers python3-num2words python3-jsonschema python3-pip
if [[ ! -f wkhtmltox_0.12.5-1.stretch_amd64.deb ]]
then
wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
fi
dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb
apt-get -fy install
apt-get -y remove --purge python3-openssl python3-cryptography
apt-get -y --purge autoremove
pip3 install xmlsig
pip3 install pyOpenSSL
pip3 install xlsxwriter
pip3 install xlrd
pip3 install xlwt
rm -r l10n_cr server-tools partner-contact bank-payment community-data-files odooapps
cd /usr/lib/python3/dist-packages/odoo/addons/
rm -r cr_customer_query cr_electronic_invoice cr_electronic_invoice_qweb_fe cr_electronic_invoice_pos l10n_cr_country_codes res_currency_cr_adapter onchange_helper base_vat_sanitized account_payment_partner uom_unece account_tax_unece base_unece account_payment_mode accounting_pdf_reports om_account_accountant om_account_asset om_account_budget l10n_cr_hacienda_info_query
cd $HOME 
wget https://raw.githubusercontent.com/EstebanMonge/l10n_prd/master/upgrade_odoo_dbs.sh
wget https://raw.githubusercontent.com/EstebanMonge/l10n_prd/master/show_open_pos.sh
git clone https://github.com/EstebanMonge/l10n_prd.git 
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/server-tools.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/bank-payment.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/partner-contact.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/community-data-files.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/odoomates/odooapps.git
cd l10n_prd
mv cr_electronic_invoice cr_electronic_invoice_qweb_fe cr_electronic_invoice_pos l10n_cr_country_codes l10n_cr_hacienda_info_query res_currency_cr_adapter /usr/lib/python3/dist-packages/odoo/addons/
cd ..
mv server-tools/onchange_helper/ /usr/lib/python3/dist-packages/odoo/addons/
mv partner-contact/base_vat_sanitized/ /usr/lib/python3/dist-packages/odoo/addons/
mv bank-payment/account_payment_partner/ /usr/lib/python3/dist-packages/odoo/addons/
mv community-data-files/uom_unece/ /usr/lib/python3/dist-packages/odoo/addons/
mv community-data-files/account_tax_unece/ /usr/lib/python3/dist-packages/odoo/addons/
mv community-data-files/base_unece/ /usr/lib/python3/dist-packages/odoo/addons/
mv bank-payment/account_payment_mode/ /usr/lib/python3/dist-packages/odoo/addons/
mv odooapps/accounting_pdf_reports/ /usr/lib/python3/dist-packages/odoo/addons/
mv odooapps/om_account_accountant/ /usr/lib/python3/dist-packages/odoo/addons/
mv odooapps/om_account_asset/ /usr/lib/python3/dist-packages/odoo/addons/
mv odooapps/om_account_budget/ /usr/lib/python3/dist-packages/odoo/addons/

systemctl restart odoo
