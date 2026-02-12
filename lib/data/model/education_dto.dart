class EducationDto {
  final int id;
  final String institution;
  final String degree;
  final String? major;
  final DateTime startDate;
  final DateTime endDate;

  EducationDto({
    required this.id,
    required this.institution,
    required this.degree,
    this.major,
    required this.startDate,
    required this.endDate,
  });

  factory EducationDto.fromJson(Map<String, dynamic> json) {
    return EducationDto(
      id: json['id'] as int,
      institution: json['institution'] as String,
      degree: json['degree'] as String,
      major: json['major'] as String?,
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
