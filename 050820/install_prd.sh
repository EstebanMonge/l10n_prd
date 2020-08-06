cd $HOME
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
rm /etc/apt/sources.list.d/odoo.list
rm /etc/apt/sources.list.d/backports.list
echo "deb http://nightly.odoo.com/12.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list
echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list.d/backports.list
apt-get update
apt-get upgrade -y
apt-get -y install odoo postgresql unzip git python3-phonenumbers python3-num2words python3-jsonschema python3-pip
if [[ ! -f wkhtmltox_0.12.5-1.stretch_amd64.deb ]]
then
wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
fi
dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb
apt-get -fy install
apt-get -y remove --purge python3-openssl python3-cryptography
apt-get -y --purge autoremove
pip3 install zeep
pip3 install xmlsig
pip3 install pyOpenSSL
pip3 install jsonschema
pip3 install phonenumbers
pip3 install xlsxwriter
pip3 install xlrd
pip3 install xlwt
rm show_open_pos.sh*
rm upgrade_odoo_dbs.sh*
rm -r l10n_cr server-tools partner-contact bank-payment community-data-files odooapps pos account-financial-reporting server-ux reporting-engine EstebanMonge web l10n_cr_priv manufacture
cd /usr/lib/python3/dist-packages/odoo/addons/
rm -r cr_customer_query cr_electronic_invoice cr_electronic_invoice_qweb_fe cr_electronic_invoice_pos l10n_cr_country_codes res_currency_cr_adapter onchange_helper base_vat_sanitized account_payment_partner uom_unece account_tax_unece base_unece account_payment_mode accounting_pdf_reports om_account_accountant om_account_asset om_account_budget l10n_cr_hacienda_info_query pos_ticket_logo account_financial_report date_range report_xlsx om_pos_service_charge parking basic_hms l10n_cr_hacienda_info_query web_responsive parking_report cr_electronic_invoice_pos_qweb_fe product_quick_bom
cd $HOME
wget https://raw.githubusercontent.com/EstebanMonge/l10n_prd/master/upgrade_odoo_dbs.sh
wget https://raw.githubusercontent.com/EstebanMonge/l10n_prd/master/show_open_pos.sh
git clone https://github.com/EstebanMonge/l10n_cr.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/server-tools.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/bank-payment.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/partner-contact.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/community-data-files.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/web.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/manufacture.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/odoomates/odooapps.git
mkdir EstebanMonge
cd EstebanMonge
git clone --branch 12.0 --depth 1 --single-branch https://github.com/EstebanMonge/odooapps.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/EstebanMonge/basic_hms.git 
git clone --branch 12.0 --depth 1 --single-branch https://github.com/EstebanMonge/l10n_cr_priv.git 
git clone https://github.com/EstebanMonge/parking.git 
git clone https://github.com/EstebanMonge/parking_report.git
cd ..
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/pos.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/account-financial-reporting.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/server-ux.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/reporting-engine.git
cd l10n_cr
mv cr_electronic_invoice cr_electronic_invoice_qweb_fe cr_electronic_invoice_pos l10n_cr_country_codes l10n_cr_hacienda_info_query res_currency_cr_adapter /usr/lib/python3/dist-packages/odoo/addons/
cd ..
mv server-tools/onchange_helper/ /usr/lib/python3/dist-packages/odoo/addons/
mv partner-contact/base_vat_sanitized/ /usr/lib/python3/dist-packages/odoo/addons/
mv bank-payment/account_payment_partner/ /usr/lib/python3/dist-packages/odoo/addons/
mv community-data-files/uom_unece/ /usr/lib/python3/dist-packages/odoo/addons/
mv community-data-files/account_tax_unece/ /usr/lib/python3/dist-packages/odoo/addons/
mv community-data-files/base_unece/ /usr/lib/python3/dist-packages/odoo/addons/
mv manufacture/product_quick_bom /usr/lib/python3/dist-packages/odoo/addons/
mv bank-payment/account_payment_mode/ /usr/lib/python3/dist-packages/odoo/addons/
mv odooapps/accounting_pdf_reports/ /usr/lib/python3/dist-packages/odoo/addons/
mv odooapps/om_account_accountant/ /usr/lib/python3/dist-packages/odoo/addons/
mv odooapps/om_account_asset/ /usr/lib/python3/dist-packages/odoo/addons/
mv odooapps/om_account_budget/ /usr/lib/python3/dist-packages/odoo/addons/
mv EstebanMonge/odooapps/om_pos_service_charge/ /usr/lib/python3/dist-packages/odoo/addons/
mv EstebanMonge/parking /usr/lib/python3/dist-packages/odoo/addons/
mv EstebanMonge/parking_report /usr/lib/python3/dist-packages/odoo/addons/
mv EstebanMonge/l10n_cr_priv/cr_electronic_invoice_pos_qweb_fe /usr/lib/python3/dist-packages/odoo/addons/
mv EstebanMonge/basic_hms /usr/lib/python3/dist-packages/odoo/addons/
mv pos/pos_ticket_logo/ /usr/lib/python3/dist-packages/odoo/addons/
mv account-financial-reporting/account_financial_report/ /usr/lib/python3/dist-packages/odoo/addons/
mv server-ux/date_range/ /usr/lib/python3/dist-packages/odoo/addons/
mv reporting-engine/report_xlsx /usr/lib/python3/dist-packages/odoo/addons/
mv web/web_responsive /usr/lib/python3/dist-packages/odoo/addons/
