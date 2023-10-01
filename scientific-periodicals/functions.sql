
-- Написать функцию добавления издательства,
-- чтобы в ней создавался новый сиквенс под это издательство?


-- CREATE SEQUENCE publisher_issue_sequence;
--
--
--
-- CREATE OR REPLACE FUNCTION insert_publisher_publication(
--     publisher_id bigint,
--     publication_id bigint,
--     publication_date date
-- )
--     RETURNS VOID AS
-- $$
-- BEGIN
--     INSERT INTO Publishers_Publications (publisher_id, publication_id, issue, publication_date)
--     VALUES (publisher_id,
--             publication_id,
--             nextval('publisher_issue_sequence'),
--             publication_date);
-- END;
-- $$ LANGUAGE plpgsql;