-- create "sub_tasks" table
CREATE TABLE "sub_tasks" (
    "id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "created_at" timestamptz NOT NULL,
    "updated_at" timestamptz NOT NULL,
    "description" character varying NOT NULL,
    "completed_at" timestamptz NULL,
    "task_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "sub_tasks_tasks_subTasks" FOREIGN KEY ("task_id") REFERENCES "tasks" ("id") ON DELETE NO ACTION
);