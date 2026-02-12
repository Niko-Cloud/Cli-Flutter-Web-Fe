class ShowcaseDto {
  final int id;
  final String title;
  final String summary;
  final List<String> stack;
  final String repoUrl;
  final String? liveUrl;

  ShowcaseDto({
    required this.id,
    required this.title,
    required this.summary,
    required this.stack,
    required this.repoUrl,
    this.liveUrl,
  });

  factory ShowcaseDto.fromJson(Map<String, dynamic> json) {
    return ShowcaseDto(
      id: json['id'] as int,
      title: json['title'] as String,
      summary: json['summary'] as String,
      stack: List<String>.from(json['stack']),
      repoUrl: json['repoUrl'] as String,
      liveUrl: (json['liveUrl'] as String?)?.isEmpty == true
          ? null
          : json['liveUrl'],
    );
  }
}
