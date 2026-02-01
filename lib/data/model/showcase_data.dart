class ShowcaseEntry {
  final int id;
  final String title;
  final String summary;
  final List<String> stack;
  final String repoUrl;
  final String? liveUrl;

  const ShowcaseEntry({
    required this.id,
    required this.title,
    required this.summary,
    required this.stack,
    required this.repoUrl,
    this.liveUrl,
  });
}

const showcaseData = [
  ShowcaseEntry(
    id: 1,
    title: 'Realtime Chat',
    summary: 'End-to-end encrypted chat app',
    stack: ['Flutter', 'Firebase'],
    repoUrl: 'https://github.com/you/chat',
  ),
];
