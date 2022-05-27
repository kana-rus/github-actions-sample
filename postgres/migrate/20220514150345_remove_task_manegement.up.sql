-- modify "tasks" table
ALTER TABLE "tasks"
    ADD COLUMN "user_id" bigint NOT NULL,
    ADD CONSTRAINT "tasks_users_tasks" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION;

-- reverse: create "task_manegements" table
DROP TABLE "task_manegements";
