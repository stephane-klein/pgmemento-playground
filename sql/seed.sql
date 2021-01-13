SET client_min_messages = error;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
CREATE EXTENSION IF NOT EXISTS pgmemento;

DROP TABLE IF EXISTS public.contacts CASCADE;

CREATE TABLE public.contacts (
    id             UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
    email          VARCHAR(255) NOT NULL,
    firstname      VARCHAR(255),
    lastname       VARCHAR(255)
);

CREATE INDEX contacts_email_index ON public.contacts (email);

SET client_min_messages = INFO;

SELECT pgmemento.create_table_audit(
  tablename := 'contacts',
  schemaname := 'public',
  audit_id_column_name := 'audit_trail_id',
  log_old_data := TRUE,
  log_new_data := TRUE,
  log_state := TRUE
);