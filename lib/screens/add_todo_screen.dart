import 'package:flutter/material.dart';

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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Text("Save Task"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
