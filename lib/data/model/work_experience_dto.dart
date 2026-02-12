class WorkExperienceDto {
  final int id;
  final String company;
  final String position;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> description;
  final List<String> techStack;

  WorkExperienceDto({
    required this.id,
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.techStack,
  });

  factory WorkExperienceDto.fromJson(Map<String, dynamic> json) {
    return WorkExperienceDto(
      id: json['id'] as int,
      company: json['company'] as String,
      position: json['position'] as String,
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      description: List<String>.from(json['description']),
      techStack: List<String>.from(json['techStack']),
    );
  }
}
