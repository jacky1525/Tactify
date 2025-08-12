import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tactify/data/models/runes_model.dart';

class RuneDetailScreen extends StatelessWidget {
  final RunesModel rune;
  const RuneDetailScreen({super.key, required this.rune});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f0f0f), Color(0xFF1f1f1f)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://ddragon.leagueoflegends.com/cdn/img/${rune.icon}",
                          scale: 0.7,
                        ),
                        fit: BoxFit.none,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        color: const Color(0xFF2A2A40),
                        width: 4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ...List.generate(4, (slotIndex) {
                  final slot = rune.slots[slotIndex];
                  return Column(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          crossAxisCount: slot.runes.length == 3 ? 3 : 4,
                        ),
                        itemCount: slot.runes.length,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(20.0),
                        reverse: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Dialog(
                                    backgroundColor: Colors.transparent,
                                    insetPadding: EdgeInsets.all(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1f1f1f),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: Colors.white10,
                                          width: 1.5,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    "https://ddragon.leagueoflegends.com/cdn/img/${slot.runes[index].icon}",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                  color: Color(0xFF2A2A40),
                                                  width: 4,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            slot.runes[index].name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Html(
                                              data: slot.runes[index].shortDesc
                                                  .replaceAll("<br>", "<br/>")
                                                  .replaceAll("&nbsp;", " "),
                                              style: {
                                                "*": Style(
                                                  color: Colors.white70,
                                                  fontSize: FontSize(14),
                                                  fontWeight: FontWeight.normal,
                                                  textAlign: TextAlign.center,
                                                  margin: Margins.zero,
                                                  padding: HtmlPaddings.zero,
                                                ),
                                                "attention": Style(
                                                  color: Colors.orangeAccent,
                                                  fontWeight: FontWeight.bold,
                                                  textAlign: TextAlign.center,
                                                  margin: Margins.zero,
                                                  padding: HtmlPaddings.zero,
                                                ),
                                                "lol-uikit-tooltipped-keyword": Style(
                                                  color: Colors.cyanAccent,
                                                  fontWeight: FontWeight.bold,
                                                  textAlign: TextAlign.center,
                                                  margin: Margins.zero,
                                                  padding: HtmlPaddings.zero,
                                                ),
                                              },
                                              extensions: [
                                                TagExtension(
                                                  tagsToExtend: {
                                                    "attention",
                                                    "lol-uikit-tooltipped-keyword",
                                                  },
                                                  builder: (context) {
                                                    final tag =
                                                        context
                                                            .styledElement
                                                            ?.name ??
                                                        '';
                                                    final text =
                                                        context
                                                            .styledElement
                                                            ?.children
                                                            .whereType<
                                                              TextContentElement
                                                            >()
                                                            .map((e) => e.text)
                                                            .join() ??
                                                        '';
                                                    if (tag == "attention") {
                                                      return Text(
                                                        text,
                                                        style: const TextStyle(
                                                          color: Colors.orangeAccent,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      );
                                                    }
                                                    if (tag == "lol-uikit-tooltipped-keyword") {
                                                      return Text(
                                                        text,
                                                        style: const TextStyle(
                                                          color: Colors.cyanAccent,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      );
                                                    }

                                                    return Text(
                                                      text,
                                                      style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 14,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://ddragon.leagueoflegends.com/cdn/img/${slot.runes[index].icon}",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                border: Border.all(
                                  color: const Color(0xFF2A2A40),
                                  width: 4.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
