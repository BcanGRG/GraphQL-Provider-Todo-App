import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_provider_todo_app/providers/add_task_provider.dart';
import 'package:graphql_provider_todo_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddTaskProvider(),
        )
      ],
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
