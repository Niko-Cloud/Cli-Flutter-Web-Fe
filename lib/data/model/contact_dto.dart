class ContactDto {
  final int id;
  final String type;
  final String value;

  ContactDto({
    required this.id,
    required this.type,
    required this.value,
  });

  factory ContactDto.fromJson(Map<String, dynamic> json) {
    return ContactDto(
      id: json['id'] as int,
      type: json['type'] as String,
      value: json['value'] as String,
    );
  }
}
