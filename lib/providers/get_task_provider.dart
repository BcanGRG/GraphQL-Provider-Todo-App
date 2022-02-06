import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_provider_todo_app/schemas/add_task_schemas.dart';
import 'package:graphql_provider_todo_app/schemas/endpoint_client.dart';

class GetTaskProvider extends ChangeNotifier {
  bool _status = false;
  String _response = "";

  bool get getStatus => _status;
  String get getResponse => _response;

  EndpointClient _point = EndpointClient();

  void getTask({String? task, String? status}) async {
    _status = true;
    _response = "Please wait....";
    notifyListeners();

    ValueNotifier<GraphQLClient> _client = _point.getClient();

    QueryResult result = await _client.value
        .mutate(MutationOptions(document: gql(AddTaskSchemas.addTaskJson)));

    if (result.hasException) {
      print(result.exception);
      _status = false;
      if (result.exception!.graphqlErrors.isEmpty) {
        _response = "Internet is not found";
      } else {
        _response = result.exception!.graphqlErrors[0].message.toString();
      }
      notifyListeners();
    } else {
      print(result.data);
      _status = false;
      _response = "Task was succesfully added";
      notifyListeners();
    }
  }

  void clear() {
    _response = "";
    notifyListeners();
  }
}
