class TodoItem {
  int id;
  String task = "";
  bool isCompleted = false;
  TodoItem.fromElements(this.id, String task, bool isCompleted) {
    this.task = task;
    this.isCompleted = isCompleted;
  }
  Map toJson() {
    Map jsonData = {
      "__typename": "todos",
      "id": id,
      "title": task,
      "is_completed": isCompleted,
    };
    return jsonData;
  }
}
