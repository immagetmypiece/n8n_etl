-- Extensions already created in 01_init_dbs.sql for single-DB setup.
-- Keep here for idempotency (no-op if exists).
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
