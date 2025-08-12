import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/core/utils/html_extensions.dart';
import 'package:tactify/data/models/items_model.dart' hide Image;

class ItemsDetailScreen extends StatelessWidget {
  final Datum item;
  const ItemsDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2B2B),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://ddragon.leagueoflegends.com/cdn/15.14.1/img/item/${item.image.full}',
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.plaintext,
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2B2B),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    children: parseHtmlToTextSpans(item.description),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
