INSERT INTO public.contacts
    (id, email, firstname, lastname)
    VALUES('d5043999-2661-4bf6-9497-c89631f0c5ac', 'john.doe@example.com', 'John', 'Doe');

SELECT set_config('pgmemento.session_info', '{"client_user":"superadm", "message":"Update contact"}'::text, FALSE);
UPDATE contacts SET firstname='Stéphane' WHERE id='d5043999-2661-4bf6-9497-c89631f0c5ac';

SELECT * FROM pgmemento.row_log;
select * from pgmemento.transaction_log;
