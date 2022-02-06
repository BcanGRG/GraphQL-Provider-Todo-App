import 'package:flutter/material.dart';
import 'package:graphql_provider_todo_app/providers/add_task_provider.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late final TextEditingController _taskController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Todo Screen"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Add your first Todo"),
                  ),
                  TextFormField(
                      controller: _taskController,
                      decoration: const InputDecoration(
                        labelText: "Todo Task",
                      )),
                  Consumer<AddTaskProvider>(
                    builder: (context, task, child) {
                      // WidgetsBinding.instance!.addPersistentFrameCallback(
                      //   (timeStamp) {
                      //     if (task.getResponse != "") {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //           SnackBar(content: Text(task.getResponse)));
                      //       task.clear();
                      //     }
                      //   },
                      // );

                      return GestureDetector(
                        onTap: task.getStatus
                            ? null
                            : () {
                                if (_taskController.text.isNotEmpty) {
                                  task.addTask(
                                      task: _taskController.text.trim(),
                                      status: "Pending");
                                }
                              },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          margin: const EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                              color: task.getStatus ? Colors.grey : Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(task.getStatus ? "Loading" : "Save Task"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
