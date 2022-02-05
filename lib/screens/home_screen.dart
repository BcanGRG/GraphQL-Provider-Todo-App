import 'package:flutter/material.dart';
import 'package:graphql_provider_todo_app/screens/add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Home Screen"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: const Text("Available todo"),
                ),
                Expanded(
                    child: ListView(
                  children: List.generate(5, (index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: const Text("Todo Title"),
                      subtitle: const Text("Todo time"),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete)),
                    );
                  }),
                )),
              ]),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddTodoScreen()));
          },
          label: Text("Add Todo")),
    );
  }
}
