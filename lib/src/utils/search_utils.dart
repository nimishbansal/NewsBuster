import 'package:flutter/material.dart';

/// Takes the query and searches in source and makes the matching part bold.
///
/// * See Also https://stackoverflow.com/a/56560757/7698247
List<TextSpan> highlightOccurrences(String source, String query) {
    if (query == null || query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
        return [ TextSpan(text: source) ];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
        final match = matches.elementAt(i);

        if (match.start != lastMatchEnd) {
            children.add(TextSpan(
                text: source.substring(lastMatchEnd, match.start),
            ));
        }

        children.add(TextSpan(
            text: source.substring(match.start, match.end),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ));

        if (i == matches.length - 1 && match.end != source.length) {
            children.add(TextSpan(
                text: source.substring(match.end, source.length),
            ));
        }

        lastMatchEnd = match.end;
    }
    return children;
}