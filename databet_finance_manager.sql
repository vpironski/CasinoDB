DROP ROLE IF EXISTS financeManager;
CREATE ROLE financeManager;
GRANT SELECT (size, date), INSERT (size, date) ON databet.transaction TO financeManager;
GRANT SELECT (account_number), INSERT(account_number) ON databet.bank_accounts TO financeManager;

drop user if exists databet_finance_manager;
create user databet_finance_manager;
grant financeManager to databet_finance_manager;

-- set default role financeManager to databet_finance_manager; --

