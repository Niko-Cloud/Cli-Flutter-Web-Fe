class CommandDto {
  final int id;
  final String name;
  final String description;
  final String usage;
  final String helpText;

  CommandDto({
    required this.id,
    required this.name,
    required this.description,
    required this.usage,
    required this.helpText,
  });

  factory CommandDto.fromJson(Map<String, dynamic> json) {
    return CommandDto(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      usage: json['usage'] as String,
      helpText: json['helpText'] as String,
    );
  }
}
