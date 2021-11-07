class Task {
  final String title;
  final String subtitle;
  Task({required this.title, required this.subtitle});
  factory Task.fromJson({required Map<String, dynamic> data}) => Task(
      title: data['title'] as String,
      subtitle: (data['subtitle'] ?? "") as String);
}
