import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactify/features/items/bloc/items_bloc.dart';
import 'package:tactify/features/items/bloc/items_event.dart';
import 'package:tactify/features/items/bloc/items_state.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
      child: BlocBuilder<ItemsBloc, ItemsState>(
        builder: (context, state) {
          if (state is ItemsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemsLoaded) {
            final items = state.items;
            return Column(
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Eşya ara...',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                      onChanged: (value) {
                        context.read<ItemsBloc>().add(SearchItems(value));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    itemCount: items.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return InkWell(
                        onTap: () {
                          context.pushNamed('item_detail', extra: item);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2C2C2C), Color(0xFF1A1A1A)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF5D5D5D),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                blurRadius: 8,
                                offset: const Offset(2, 4),
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.05),
                                blurRadius: 2,
                                offset: const Offset(-2, -2),
                              ),
                            ],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://ddragon.leagueoflegends.com/cdn/15.14.1/img/item/${item.image.full}",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: Text(
                                  item.name,
                                  style: GoogleFonts.orbitron(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is ItemsError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
