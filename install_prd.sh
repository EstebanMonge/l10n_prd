sudo apt-get -y install vim git certbot python3-pip python-certbot-nginx postgresql-client 
sudo useradd -md /home/odoo odoo
sudo apt -y install python3-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev git python3-dev libpq-de
sudo rm wkhtmltox_0.12.5-1.buster_amd64.deb
sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb
sudo dpkg -i wkhtmltox_0.12.5-1.buster_amd64.deb
sudo apt-get -f install -y
sudo -u odoo pip3 install xmlsig
sudo -u odoo pip3 install pyOpenSSL
sudo -u odoo pip3 install jsonschema
sudo -u odoo pip3 install phonenumbers
sudo -u odoo pip3 install xlsxwriter
sudo -u odoo pip3 install xlrd
sudo -u odoo pip3 install xlwt
rm show_open_pos.sh*
rm upgrade_odoo_dbs.sh*
rm -r l10n_cr server-tools partner-contact bank-payment community-data-files odooapps pos account-financial-reporting server-ux reporting-engine EstebanMonge web l10n_cr_priv manufacture
sudo git clone --depth 1 --branch 12.0 https://www.github.com/odoo/odoo.git /opt/odoo
sudo chown -R odoo.odoo /opt/odoo/
cd /opt/odoo/addons/
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
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/edi.git
mkdir EstebanMonge
cd EstebanMonge
git clone --branch 12.0 --depth 1 --single-branch https://github.com/EstebanMonge/odooapps.git
git clone --branch 12.0 --depth 1 --single-branch https://EstebanMonge@github.com/EstebanMonge/basic_hms.git 
git clone --branch 12.0 --depth 1 --single-branch https://EstebanMonge@github.com/EstebanMonge/l10n_cr_priv.git 
git clone https://EstebanMonge@github.com/EstebanMonge/parking.git 
git clone https://EstebanMonge@github.com/EstebanMonge/parking_report.git
git clone https://github.com/EstebanMonge/prt_report_attachment_preview.git
git clone https://github.com/EstebanMonge/custom_pos_keyboard_shortcut
git clone https://github.com/EstebanMonge/custom_pos_size
cd ..
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/pos.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/account-financial-reporting.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/server-ux.git
git clone --branch 12.0 --depth 1 --single-branch https://github.com/OCA/reporting-engine.git
cd l10n_cr
mv cr_electronic_invoice cr_electronic_invoice_qweb_fe cr_electronic_invoice_pos l10n_cr_country_codes l10n_cr_hacienda_info_query res_currency_cr_adapter /opt/odoo/addons/
cd ..
mv edi/base_business_document_import/ /opt/odoo/addons/
mv server-tools/onchange_helper/ /opt/odoo/addons/
mv partner-contact/base_vat_sanitized/ /opt/odoo/addons/
mv bank-payment/account_payment_partner/ /opt/odoo/addons/
mv community-data-files/uom_unece/ /opt/odoo/addons/
mv community-data-files/account_tax_unece/ /opt/odoo/addons/
mv community-data-files/base_unece/ /opt/odoo/addons/
mv manufacture/product_quick_bom /opt/odoo/addons/
mv bank-payment/account_payment_mode/ /opt/odoo/addons/
mv odooapps/accounting_pdf_reports/ /opt/odoo/addons/
mv odooapps/om_account_accountant/ /opt/odoo/addons/
mv odooapps/om_account_asset/ /opt/odoo/addons/
mv odooapps/om_account_budget/ /opt/odoo/addons/
mv EstebanMonge/odooapps/om_pos_service_charge/ /opt/odoo/addons/
mv EstebanMonge/parking /opt/odoo/addons/
mv EstebanMonge/parking_report /opt/odoo/addons/
mv EstebanMonge/prt_report_attachment_preview /opt/odoo/addons/
mv EstebanMonge/l10n_cr_priv/cr_electronic_invoice_pos_qweb_fe /opt/odoo/addons/
mv EstebanMonge/basic_hms /opt/odoo/addons/
mv EstebanMonge/custom_pos_size /opt/odoo/addons/
mv EstebanMonge/custom_pos_keyboard_shortcut /opt/odoo/addons/
mv pos/pos_ticket_logo/ /opt/odoo/addons/
mv account-financial-reporting/account_financial_report/ /opt/odoo/addons/
mv server-ux/date_range/ /opt/odoo/addons/
mv reporting-engine/report_xlsx /opt/odoo/addons/
mv web/web_responsive /opt/odoo/addons/
chown -R odoo.odoo /opt/odoo/addons
