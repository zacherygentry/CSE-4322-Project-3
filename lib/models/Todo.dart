class Todo {
  final String title;
  final String description;
  final DateTime dateCreated;
  bool isCompleted;

  Todo({
    this.title,
    this.description,
    this.dateCreated,
    this.isCompleted = false
  });

  Todo.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      description = json['description'],
      dateCreated = DateTime.parse(json['dateCreated']),
      isCompleted = json['isCompleted'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'dateCreated': dateCreated.toIso8601String(),
    'isCompleted': isCompleted
  };

  
}
