import 'dart:isolate';

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

class Todo {
  String text; // 할 일
  bool isDone; // 완료 여부

  Todo(this.text, this.isDone);
}

class _HomePageState extends State<HomePage> {
  /// Do-Do List 데이터 전체 목록. Data List
  List<Todo> toDoList = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < toDoList.length; i++) {
      print("text : ${toDoList[i].text}, isDone : ${toDoList[i].isDone}");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: Center(
        child: toDoList.isEmpty
            ? Center(child: Text("Creat Your To-Do List"))
            : ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (BuildContext context, int index) {
                  Todo todo = toDoList[index]; // index에 해당하는 todo 가져오기
                  return ListTile(
                    title: Text(
                      toDoList[index].text,
                      style: TextStyle(
                        fontSize: 20,
                        color: todo.isDone ? Colors.grey : Colors.black,
                      ),
                    ),
                    // 삭제 아이콘 버튼
                    trailing: IconButton(
                      onPressed: () {
                        // 삭제 버튼 클릭시
                      },
                      icon: Icon(CupertinoIcons.delete),
                    ),
                    onTap: () {
                      // 리스트 클릭시
                      setState(() {
                        todo.isDone = !todo.isDone;
                      });
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: () async {
          // 버튼 클릭시 투두 리스트 생성 페이지로 이동
          String? todo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePage(),
            ),
          );
          if (todo != null) {
            setState(() {
              Todo newTodo = Todo(todo, false);
              toDoList.add(newTodo);
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
