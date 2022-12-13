import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// To-Do List Page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Do-Do List 데이터 목록. Data List
  List<String> toDoList = ['study', 'study1', 'study2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-Do List",
        ),
      ),
      body: Center(
        child: toDoList.isEmpty
            ? Center(child: Text("Creat Your To-Do List"))
            : ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(toDoList[index]),
                    trailing: Icon(CupertinoIcons.delete),
                    onTap: () {
                      return print("Click");
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: () async {
          String? todo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePage(),
            ),
          );
          if (todo != null) {
            setState(() {
              toDoList.add(todo);
            });
          }
          // print("return value : $todo");
        },
      ),
    );
  }
}

/// To-Do Create Page
class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController textControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your new todo"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CupertinoTextField(
              placeholder: "Add a todo",
              autofocus: true,
              controller: textControll,
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton.filled(
                child: Text("Submit"),
                onPressed: textControll.text.isEmpty
                    ? null
                    : () {
                        // print(textControll.text);
                        Navigator.pop(context, textControll.text);
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
