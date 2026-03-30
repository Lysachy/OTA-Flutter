import 'package:intl/intl.dart';

String formatRupiah(int price) {
  if (price >= 1000000) {
    return 'Rp ${(price / 1000000).toStringAsFixed(1)}jt';
  }
  return 'Rp ${(price / 1000).toStringAsFixed(0)}k';
}

String formatDate(DateTime dt) =>
    DateFormat('d MMM yyyy', 'id_ID').format(dt);
