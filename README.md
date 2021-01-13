# pgMemento playground

[pgMemento](https://github.com/pgMemento/pgMemento) playground.

```sh
docker-compose build
docker-compose up -d
```

```sh
$ cat sql/seed.sql | docker-compose exec -T postgres psql -U postgres
SET
CREATE EXTENSION
DROP TABLE
CREATE TABLE
CREATE INDEX
SET
```

```sh
$ cat sql/demo.sql | docker-compose exec -T postgres psql -U postgres
INSERT 0 1
                       set_config
--------------------------------------------------------
 {"client_user":"superadm", "message":"Update contact"}
(1 row)

UPDATE 1
 id | audit_id |                         event_key                         |       old_data        |                                                                   new_data
----+----------+-----------------------------------------------------------+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------
  1 |        1 | 1610576502.58733;1610576502.58733;492;3;contacts;public   |                       | {"id": "d5043999-2661-4bf6-9497-c89631f0c5ac", "email": "john.doe@example.com", "lastname": "Doe", "firstname": "John", "audit_trail_id": 1}
  2 |        1 | 1610576502.618826;1610576502.618826;493;4;contacts;public | {"firstname": "John"} | {"firstname": "Stéphane"}
(2 rows)

 id | txid |           txid_time           | process_id | user_name | client_name | client_port | application_name |                                                                                                                           session_info
----+------+-------------------------------+------------+-----------+-------------+-------------+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1 |  490 | 2021-01-13 22:21:35.596734+00 |         72 | postgres  |             |             | psql             | "{\"pgmemento_init\": {\"schema_name\": '\"public\"', \"default_audit_id_column\": '\"audit_trail_id\"', \"default_log_old_data\": 'true', \"default_log_new_data\": 'true', \"log_state\": 'true', \"trigger_create_table\": 'false', \"except_tables\": NULL}}"
  3 |  492 | 2021-01-13 22:21:42.58733+00  |         79 | postgres  |             |             | psql             |
  4 |  493 | 2021-01-13 22:21:42.618826+00 |         79 | postgres  |             |             | psql             | {"message": "Update contact", "client_user": "superadm"}
(3 rows)
```
