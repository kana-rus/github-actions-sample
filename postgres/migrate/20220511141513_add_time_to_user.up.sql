-- modify "users" table
ALTER TABLE "users"
    ADD COLUMN "created_at" timestamptz NOT NULL,
    ADD COLUMN "updated_at" timestamptz NOT NULL;
