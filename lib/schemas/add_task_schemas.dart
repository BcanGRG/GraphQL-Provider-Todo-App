class AddTaskSchemas {
  static String addTaskJson = """
mutation(\$task: String!, \$status: String!) {
  createTodo(input: { task: \$task, status: \$status }) {
    id
    task
    status
    timeAdded
  }
}
""";
}
