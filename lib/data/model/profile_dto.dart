class ProfileDto {
  final int id;
  final String name;
  final String role;
  final String description;
  final String? location;

  ProfileDto({
    required this.id,
    required this.name,
    required this.role,
    required this.description,
    this.location,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) {
    return ProfileDto(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      description: json['description'] as String,
      location: json['location'] as String?,
    );
  }
}
