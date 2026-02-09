import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
        ).copyWith(
          inversePrimary: const Color(0xFFBBDEFB),
        ),
        useMaterial3: true,
      ),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Map<String, dynamic>> _todoItems = [
    {'title': 'Buy groceries', 'isDone': false},
    {'title': 'Finish Flutter project', 'isDone': true},
    {'title': 'Go for a run', 'isDone': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: ListTile(
              title: Text(
                _todoItems[index]['title'],
                style: TextStyle(
                  decoration: _todoItems[index]['isDone']
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              trailing: Checkbox(
                value: _todoItems[index]['isDone'],
                onChanged: (bool? value) {
                  setState(() {
                    _todoItems[index]['isDone'] = value!;
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You could show a dialog here to add a new task!
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}