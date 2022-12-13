# flutter-todolist

Simple To-Do List.  
No SQLite, No Provider.  

<br>

## ✨ Introduce

기본적인 CRUD의 기능이다.
List<Class> 리스트 타입을 사용해 instance로 데이터를 추가한다.

<br>

## ✨ 기능 소개

단순한 CRUD(Creat, Read, Update, Delete)기능이며 저장은 메모리에 한다.
다이어로그

<br>

## ✨ Point

- 페이지간 데이터 전달방법
- 글 작성시 유효성 검사
- 텍스트 필드 컨트롤링
    TextEditingController


## 기록

### Refactoring

특징 : 코드가 깔끔해진다. 재활용 가능하다.  
함수 오른쪽 클릭 > Refactor > Extract Method  
반환할 값이 없으면 `Futer<dynamic>` 타입 삭제후 `void` 를 넣고 `return`도 없애면 된다.