-- create "messages" table
CREATE TABLE "messages" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "created_at" timestamptz NOT NULL,
    "updated_at" timestamptz NOT NULL,
    "platform_message_type" character varying NOT NULL,
    "platform_message_id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "messages_users_messages" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION
);
-- create index "message_user_id" to table: "messages"
CREATE INDEX "message_user_id" ON "messages" ("user_id");
