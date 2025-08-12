import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;


final Map<String, TextStyle> tagStyles = {
  "maintext": GoogleFonts.shareTechMono(color: Colors.white, fontSize: 16),
  "stats": GoogleFonts.shareTechMono(color: Colors.white, fontSize: 16),
  "attention": GoogleFonts.shareTechMono(color: Colors.amber, fontSize: 16),
  "passive": GoogleFonts.shareTechMono(color: Colors.greenAccent, fontSize: 16),
  "nerfedstat": GoogleFonts.shareTechMono(color: Colors.redAccent, fontSize: 16),
  "goldgain": GoogleFonts.shareTechMono(color: Colors.yellowAccent, fontSize: 16),
  "buffedstat": GoogleFonts.shareTechMono(color: Colors.lightGreenAccent, fontSize: 16),
  "raritymythic": GoogleFonts.shareTechMono(color: Colors.orange, fontSize: 16),
  "raritylegendary": GoogleFonts.shareTechMono(color: Colors.redAccent, fontSize: 16),
  "rules": GoogleFonts.shareTechMono(color: Colors.deepOrange, fontSize: 16),
  "speed": GoogleFonts.shareTechMono(color: Colors.red, fontSize: 16),
  "status": GoogleFonts.shareTechMono(color: Colors.lightBlue, fontSize: 16),
  "ornnbonus": GoogleFonts.shareTechMono(color: Colors.tealAccent, fontSize: 16),
  "keywordstealth": GoogleFonts.shareTechMono(color: Colors.deepPurpleAccent, fontSize: 16),
  "recast": GoogleFonts.shareTechMono(color: Colors.deepOrange, fontSize: 16),
  "unique": GoogleFonts.shareTechMono(color: Colors.orangeAccent, fontSize: 16),
  "flavortext": GoogleFonts.shareTechMono(color: Colors.pinkAccent, fontSize: 16),
  "scaleap": GoogleFonts.shareTechMono(color: Colors.red, fontSize: 16),
  "onhit": GoogleFonts.shareTechMono(color: Colors.cyan, fontSize: 16),
  "physicaldamage": GoogleFonts.shareTechMono(color: Colors.blue, fontSize: 16),
  "scalemr": GoogleFonts.shareTechMono(color: Colors.indigo, fontSize: 16),
  "scalearmor": GoogleFonts.shareTechMono(color: Colors.blueGrey, fontSize: 16),
  "scalemana": GoogleFonts.shareTechMono(color: Colors.lightBlueAccent, fontSize: 16),
  "raritygeneric": GoogleFonts.shareTechMono(color: Colors.grey, fontSize: 16),
  "magicdamage": GoogleFonts.shareTechMono(color: Colors.purple, fontSize: 16),
  "active": GoogleFonts.shareTechMono(color: Colors.lime, fontSize: 16),
  "scalehealth": GoogleFonts.shareTechMono(color: Colors.red, fontSize: 16),
  "keywordmajor": GoogleFonts.shareTechMono(color: Colors.red, fontSize: 16),
  "shield": GoogleFonts.shareTechMono(color: Colors.red, fontSize: 16),
  "truedamage": GoogleFonts.shareTechMono(color: Colors.red, fontSize: 16),
};


List<InlineSpan> parseHtmlToTextSpans(String html) {
  final document = html_parser.parseFragment(html);
  return _parseNodes(document.nodes);
}

List<InlineSpan> _parseNodes(List<dom.Node> nodes) {
  List<InlineSpan> spans = [];

  for (final node in nodes) {
    if (node is dom.Text) {
      spans.add(TextSpan(text: node.text));
    } else if (node is dom.Element) {
      final tag = node.localName!.toLowerCase();

 
      if (tag == 'br') {
        spans.add(const TextSpan(text: '\n'));
        continue;
      }

      final childrenSpans = _parseNodes(node.nodes);
      final style = tagStyles[tag];

      if (style != null) {
        spans.add(
          TextSpan(
            children: childrenSpans,
            style: style,
          ),
        );
      } else {
      
        spans.addAll(childrenSpans);
      }
    }
  }

  return spans;
}

