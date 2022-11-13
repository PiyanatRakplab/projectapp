class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'ซักผ้า', isDone: true ),
      ToDo(id: '02', todoText: 'ล้างจาน', isDone: true ),
      ToDo(id: '03', todoText: 'ซื้ออาหาร',isDone: true ),
      ToDo(id: '04', todoText: 'อ่านหนังสือ ',isDone: false ),
      ToDo(id: '05', todoText: 'สอบ Final ',isDone: false ),

    ];
  }
}