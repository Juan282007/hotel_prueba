-- Note: Liquibase already starts a BEGIN and ends with COMMIT automatically.
-- Use SAVEPOINT to demonstrate internal transactional control (TCL).

SAVEPOINT safe_point_before_changes;

-- Example of an operation that could fail:
-- UPDATE inventory.product SET stock = stock - 5 WHERE id = 1;

-- If something failed during application execution, use:
-- ROLLBACK TO SAVEPOINT safe_point_before_changes;

-- If everything succeeds, release the savepoint and let Liquibase run the final COMMIT
RELEASE SAVEPOINT safe_point_before_changes;
