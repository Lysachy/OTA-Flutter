import 'package:flutter/material.dart';
import 'package:deep_north/shared/models/destination_model.dart';

class DestinationProvider extends ChangeNotifier {
  List<DestinationModel> _all = [];
  List<DestinationModel> get filtered => _activeFilter == 'Semua'
      ? _all
      : _all.where((d) => d.name.contains(_activeFilter)).toList();

  String _activeFilter = 'Semua';
  String get activeFilter => _activeFilter;
  bool isLoading = true;

  final filters = ['Semua', 'Bunaken', 'Likupang', 'Lembeh', 'Terdekat'];

  Future<void> fetchDestinations() async {
    isLoading = true;
    notifyListeners();
    await Future<void>.delayed(const Duration(milliseconds: 450));
    _all = _demoDestinations.map(DestinationModel.fromMap).toList();
    isLoading = false;
    notifyListeners();
  }

  void setFilter(String f) {
    _activeFilter = f;
    notifyListeners();
  }
}

const List<Map<String, dynamic>> _demoDestinations = [
  {
    'id': 'bunaken-marine-park',
    'name': 'Bunaken Marine Park',
    'location': 'Manado, Sulawesi Utara',
    'emoji': '\u{1F420}',
    'thumbColor': '0xFF0B3D5E',
    'tags': ['Bunaken', 'Wall Dive', 'Turtle'],
    'priceStart': 850000,
    'isLive': true,
  },
  {
    'id': 'likupang-house-reef',
    'name': 'Likupang House Reef',
    'location': 'Likupang, Sulawesi Utara',
    'emoji': '\u{1F41A}',
    'thumbColor': '0xFF155E75',
    'tags': ['Likupang', 'Macro', 'Pemula'],
    'priceStart': 540000,
    'isLive': false,
  },
  {
    'id': 'lembeh-strait',
    'name': 'Lembeh Strait',
    'location': 'Bitung, Sulawesi Utara',
    'emoji': '\u{1F419}',
    'thumbColor': '0xFF1D4ED8',
    'tags': ['Lembeh', 'Muck Dive', 'Rare Species'],
    'priceStart': 980000,
    'isLive': true,
  },
];
