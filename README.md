# CasinoDB
This is a school project for creating a database for a casino. 
# The Task
# Tables

- The database must contain at least five tables.
- The database must contain all three types of relationships: one-to-one, one-to-many, many-to-many, with each relationship's implementation being logical (i.e., not implemented solely because it's given in the task).
- The database must be normalized. A table may denormalize if there's a justified reason (e.g., query speed).
- Each table must contain at least 3 rows.

## Triggers

- The database must include the following triggers:
    - Insert triggers - before and after
    - Update triggers - before and after
- The implementation of each trigger must be logical (i.e., not implemented solely because it's given in the task).

## Views

- The database must contain at least three views.
- The implementation of each view must be logical (i.e., not implemented solely because it's given in the task).

## Users and Roles

- The database must contain roles.
- There must be at least one role with database-level privileges.
- There must be at least one role with table-level privileges.
- There must be at least one role with column-level privileges.
- For each role, there must be at least one user.

## Indexes

- The database must contain at least one simple index.
- The database must contain at least one composite index.
- The database must contain at least one prefix index.
- The implementation of each index must be logical (i.e., not implemented solely because it's given in the task).

## Transactions

- Provide an example of queries that should be grouped into a transaction.
- The example should be logical.

## Distribution

Work should be evenly distributed among team members. An example distribution for a team of 4 members could be:
- One member responsible for creating tables.
- One member responsible for creating triggers.
- One member responsible for views and roles.
- One member responsible for indexes and transactions.

## Format

- SQL statements for creating the database should be stored in a GitHub repository accessible to all team members.
- SQL statements for each part should be kept in separate '.sql' files. For example, statements for creating tables should be in a file named 'tables.sql', statements for triggers in 'triggers.sql', and so on.
