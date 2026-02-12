import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

TextSpan buildLinkSpan(String text, TextStyle style) {
  final regex = RegExp(r'(https?:\/\/[^\s]+)');
  final matches = regex.allMatches(text).toList();

  if (matches.isEmpty) {
    return TextSpan(text: text, style: style);
  }

  final spans = <InlineSpan>[];
  var lastIndex = 0;

  for (final match in matches) {
    if (match.start > lastIndex) {
      spans.add(
        TextSpan(text: text.substring(lastIndex, match.start), style: style),
      );
    }

    final url = match.group(0)!;

    spans.add(
      WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: MouseRegion(
          child: Link(
            uri: Uri.parse(url),
            target: LinkTarget.blank,
            builder: (context, followLink) {
              return GestureDetector(
                onTap: followLink,
                child: Text(
                  url,
                  style: style.copyWith(
                    color: Colors.lightBlueAccent,
                    decoration: TextDecoration.underline,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    lastIndex = match.end;
  }

  if (lastIndex < text.length) {
    spans.add(TextSpan(text: text.substring(lastIndex), style: style));
  }

  return TextSpan(children: spans);
}
