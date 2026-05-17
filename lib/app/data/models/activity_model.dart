class ActivityModel {
  final String id;
  final String title;
  final String description;
  final String category; // Motorik Kasar, Motorik Halus, Komunikasi
  final String duration;
  final String imageUrl;
  final List<String> objectives;
  final List<String> tools;
  final String safetyTips;
  final List<String> steps;

  ActivityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.duration,
    required this.imageUrl,
    required this.objectives,
    required this.tools,
    required this.safetyTips,
    required this.steps,
  });

  // Factory untuk mempermudah mapping data JSON dari REST API Flask kamu
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? 'Motorik',
      duration: json['duration'] ?? '15 Menit',
      imageUrl: json['image_url'] ?? '',
      objectives: List<String>.from(json['objectives'] ?? []),
      tools: List<String>.from(json['tools'] ?? []),
      safetyTips: json['safety_tips'] ?? '',
      steps: List<String>.from(json['steps'] ?? []),
    );
  }
}