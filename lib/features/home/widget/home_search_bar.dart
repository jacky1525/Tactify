import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:tactify/features/home/bloc/searchBar/search_bloc.dart';
import 'package:tactify/features/home/bloc/searchBar/search_event.dart';
import 'package:tactify/features/home/bloc/searchBar/search_state.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController gameNameController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final FocusNode tagFocusNode = FocusNode();

  HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) async {
        if (state.puuid != null) {
          Future.delayed(const Duration(seconds: 1), () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.pushNamed(
                'summoner_screen',
                pathParameters: {
                  'region': state.selectedRegion,
                  'puuid': state.puuid!,
                },
                extra: {
                  'gameName': gameNameController.text.trim(),
                  'tagLine': tagController.text.trim(),
                },
              );

              // controller temizliği
              gameNameController.clear();
              tagController.clear();
              tagFocusNode.unfocus();
            });
          });
        }

        if (state.error != null) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.grey.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.redAccent),
                    const SizedBox(width: 8),
                    Text(
                      'HATA',
                      style: GoogleFonts.orbitron(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'Hesap bulunamadı.',
                  style: GoogleFonts.orbitron(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    letterSpacing: 1.1,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'TAMAM',
                      style: GoogleFonts.orbitron(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFd3de0c), // neon sarı
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            tagFocusNode.removeListener(() {});
            tagFocusNode.addListener(() {
              context.read<SearchBloc>().add(
                TagFocusChanged(tagFocusNode.hasFocus),
              );
            });
          });

          final inputTextStyle = GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          );

          final labelStyle = GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          );

          final hintStyle = GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          );

          final border = OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade800),
          );

          final isLoading = state.isLoading;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Kullanıcı Adı
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: gameNameController,
                      style: inputTextStyle,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Hesap Adı",
                        labelStyle: labelStyle,
                        filled: true,
                        fillColor: Colors.grey.shade900,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border.copyWith(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Etiket
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: tagController,
                      focusNode: tagFocusNode,
                      style: inputTextStyle,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: state.isTagFocused ? "TAG" : null,
                        labelStyle: labelStyle,
                        hintText: state.isTagFocused ? null : "TR1",
                        hintStyle: hintStyle,
                        filled: true,
                        fillColor: Colors.grey.shade900,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border.copyWith(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Region Dropdown
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down, size: 18),
                      value: state.selectedRegion,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade900,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border.copyWith(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(12, 14, 8, 14),
                        isDense: true,
                      ),
                      dropdownColor: Colors.grey.shade900,
                      style: inputTextStyle,
                      iconEnabledColor: Colors.white,
                      items: const [
                        DropdownMenuItem(
                          value: 'EUROPE',
                          child: Text('EUROPE'),
                        ),
                        DropdownMenuItem(
                          value: 'AMERICAS',
                          child: Text('AMERICAS'),
                        ),
                        DropdownMenuItem(value: 'ASIA', child: Text('ASIA')),
                      ],
                      onChanged: (value) {
                        context.read<SearchBloc>().add(RegionChanged(value!));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Arama Butonu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          final gameName = gameNameController.text.trim();
                          final tagLine = tagController.text.trim();
                          if (gameName.isNotEmpty && tagLine.isNotEmpty) {
                            context.read<SearchBloc>().add(
                              SearchSubmitted(
                                gameName: gameName,
                                tagLine: tagLine,
                              ),
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0xFFd3de0c)),
                    ),
                    elevation: 0,
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Color(0xFFd3de0c),
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "HESAP ARA",
                          style: GoogleFonts.orbitron(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFd3de0c),
                            letterSpacing: 1.2,
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
