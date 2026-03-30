class DestinationModel {
  final String id;
  final String name;
  final String location;
  final String emoji;
  final String thumbColor;
  final List<String> tags;
  final int priceStart;
  final bool isLive;

  const DestinationModel({
    required this.id,
    required this.name,
    required this.location,
    required this.emoji,
    required this.thumbColor,
    required this.tags,
    required this.priceStart,
    required this.isLive,
  });

  factory DestinationModel.fromMap(Map<String, dynamic> data) {
    return DestinationModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      emoji: data['emoji'] ?? '\u{1F30A}',
      thumbColor: data['thumbColor'] ?? '0xFF0B3D5E',
      tags: List<String>.from(data['tags'] ?? const []),
      priceStart: data['priceStart'] ?? 0,
      isLive: data['isLive'] ?? false,
    );
  }
}
