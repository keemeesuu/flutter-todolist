# flutter-todolist

Simple To-Do List.  
No SQLite, No Provider.  
just used StatefulWidget

---


<p float="left">
    <img src="https://github.com/keemeesuu/flutter-todolist/blob/main/images/1.png"  width="28%" />
    <img src="https://github.com/keemeesuu/flutter-todolist/blob/main/images/2.png"  width="28%" />
    <img src="https://github.com/keemeesuu/flutter-todolist/blob/main/images/3.png"  width="28%" />
    <img src="https://github.com/keemeesuu/flutter-todolist/blob/main/images/4.png"  width="28%" />
    <img src="https://github.com/keemeesuu/flutter-todolist/blob/main/images/5.png"  width="28%" />
</p>


<br>

## ✨ Introduce

단순한 CRUD(Creat, Read, Update, Delete)기능이며 단순 메모리에 한다.  
List<Class> 리스트 타입을 사용해 instance로 데이터를 추가한다.  


<br>

## ✨ Point

- 페이지간 데이터 전달방법
- 글 작성시 유효성 검사
- 텍스트 필드 컨트롤링
    TextEditingController

<br>

## ✨ Note

### Refactoring

특징 : 코드가 깔끔해진다. 재활용 가능하다.  
함수 오른쪽 클릭 > Refactor > Extract Method  
반환할 값이 없으면 `Futer<dynamic>` 타입 삭제후 `void` 를 넣고 `return`도 없애면 된다.
