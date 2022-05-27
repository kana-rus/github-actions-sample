-- create index "subtask_task_id" to table: "sub_tasks"
CREATE INDEX "subtask_task_id" ON "sub_tasks" ("task_id");
-- create index "taskmanegement_user_id" to table: "task_manegements"
CREATE INDEX "taskmanegement_user_id" ON "task_manegements" ("user_id");
-- create index "taskmanegement_task_id" to table: "task_manegements"
CREATE INDEX "taskmanegement_task_id" ON "task_manegements" ("task_id");
