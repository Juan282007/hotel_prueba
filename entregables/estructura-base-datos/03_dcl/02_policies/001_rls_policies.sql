ALTER TABLE configuration.customer ENABLE ROW LEVEL SECURITY;
ALTER TABLE configuration.person ENABLE ROW LEVEL SECURITY;
ALTER TABLE security.app_user ENABLE ROW LEVEL SECURITY;
ALTER TABLE billing.invoice ENABLE ROW LEVEL SECURITY;
ALTER TABLE billing.partial_payment ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS pol_customer_admin_all ON configuration.customer;
CREATE POLICY pol_customer_admin_all ON configuration.customer FOR ALL TO administrator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_person_admin_all ON configuration.person;
CREATE POLICY pol_person_admin_all ON configuration.person FOR ALL TO administrator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_app_user_admin_all ON security.app_user;
CREATE POLICY pol_app_user_admin_all ON security.app_user FOR ALL TO administrator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_invoice_admin_all ON billing.invoice;
CREATE POLICY pol_invoice_admin_all ON billing.invoice FOR ALL TO administrator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_payment_admin_all ON billing.partial_payment;
CREATE POLICY pol_payment_admin_all ON billing.partial_payment FOR ALL TO administrator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_customer_developer_all ON configuration.customer;
CREATE POLICY pol_customer_developer_all ON configuration.customer FOR ALL TO developer USING (status <> 'DELETED') WITH CHECK (status <> 'DELETED');

DROP POLICY IF EXISTS pol_person_developer_all ON configuration.person;
CREATE POLICY pol_person_developer_all ON configuration.person FOR ALL TO developer USING (status <> 'DELETED') WITH CHECK (status <> 'DELETED');

DROP POLICY IF EXISTS pol_app_user_developer_read ON security.app_user;
CREATE POLICY pol_app_user_developer_read ON security.app_user FOR SELECT TO developer USING (status <> 'DELETED');

DROP POLICY IF EXISTS pol_invoice_developer_all ON billing.invoice;
CREATE POLICY pol_invoice_developer_all ON billing.invoice FOR ALL TO developer USING (status <> 'DELETED') WITH CHECK (status <> 'DELETED');

DROP POLICY IF EXISTS pol_payment_developer_all ON billing.partial_payment;
CREATE POLICY pol_payment_developer_all ON billing.partial_payment FOR ALL TO developer USING (status <> 'DELETED') WITH CHECK (status <> 'DELETED');

DROP POLICY IF EXISTS pol_customer_qa_read ON configuration.customer;
CREATE POLICY pol_customer_qa_read ON configuration.customer FOR SELECT TO qa USING (status = 'ACTIVE');

DROP POLICY IF EXISTS pol_invoice_qa_read ON billing.invoice;
CREATE POLICY pol_invoice_qa_read ON billing.invoice FOR SELECT TO qa USING (status = 'ACTIVE');

DROP POLICY IF EXISTS pol_customer_evaluator_all ON configuration.customer;
CREATE POLICY pol_customer_evaluator_all ON configuration.customer FOR ALL TO ddl_dml_evaluator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_person_evaluator_all ON configuration.person;
CREATE POLICY pol_person_evaluator_all ON configuration.person FOR ALL TO ddl_dml_evaluator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_app_user_evaluator_all ON security.app_user;
CREATE POLICY pol_app_user_evaluator_all ON security.app_user FOR ALL TO ddl_dml_evaluator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_invoice_evaluator_all ON billing.invoice;
CREATE POLICY pol_invoice_evaluator_all ON billing.invoice FOR ALL TO ddl_dml_evaluator USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS pol_payment_evaluator_all ON billing.partial_payment;
CREATE POLICY pol_payment_evaluator_all ON billing.partial_payment FOR ALL TO ddl_dml_evaluator USING (true) WITH CHECK (true);
