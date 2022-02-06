class GetTaskSchemas {
  static String getTaskJson = """ 
    query {
  getTodos(status:"",search:""){
    id,
    task,
    status
  }}
  """;
}
