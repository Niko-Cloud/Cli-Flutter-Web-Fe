class SkillDto {
  final int id;
  final String name;
  final String level;
  final List<String> category;

  SkillDto({
    required this.id,
    required this.name,
    required this.level,
    required this.category,
  });

  factory SkillDto.fromJson(Map<String, dynamic> json) {
    return SkillDto(
      id: json['id'] as int,
      name: json['name'] as String,
      level: json['level'] as String,
      category: List<String>.from(json['category']),
    );
  }
}
