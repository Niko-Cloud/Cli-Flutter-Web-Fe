import 'package:cli_web/presentation/terminal/terminal_screen.dart';
import 'package:cli_web/provider/prefetch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CliApp extends ConsumerStatefulWidget {
  const CliApp({super.key});

  @override
  ConsumerState<CliApp> createState() => _CliAppState();
}

class _CliAppState extends ConsumerState<CliApp> {
  bool _prefetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_prefetched) {
      _prefetched = true;
      prefetchStaticData(ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TerminalScreen(),
    );
  }
}
