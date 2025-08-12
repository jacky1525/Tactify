import 'package:intl/intl.dart';
import 'package:tactify/data/models/champions_model.dart';

String formatLastActiveFromMs(int revisionMs) {
  final last = DateTime.fromMillisecondsSinceEpoch(revisionMs).toLocal();
  final now = DateTime.now();
  final diff = now.difference(last);

  if (diff.isNegative) {
    // Sunucudan gelecek ileri tarih için önlem
    return DateFormat('dd-MM-yyyy').format(last);
  }

  if (diff.inDays == 0) {
    if (diff.inHours >= 1) return '${diff.inHours} saat önce';
    final mins = diff.inMinutes;
    if (mins >= 1) return '$mins dk önce';
    return 'az önce';
  }

  if (diff.inDays <= 7) {
    return '${diff.inDays} gün önce';
  }

  return DateFormat('dd-MM-yyyy').format(last);
}
// Şampiyon id -> Şampiyon ismi helper
// ChampionsModel -> Map<int, String> (champId -> champName)
Map<int, String> buildChampIdToName(ChampionsModel m) {
  final out = <int, String>{};
  // 
  m.data.forEach((_, d) {
    final id = int.tryParse(d.key.toString()); // "103" -> 103
    if (id != null) out[id] = d.id;            // 103 -> "Ahri"
  });
  return out;
}