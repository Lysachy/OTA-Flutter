class BookingModel {
  final String id;
  final String userId;
  final String destinationId;
  final String destinationName;
  final DateTime bookingDate;
  final int totalPrice;
  final int participants;
  final String status;

  const BookingModel({
    required this.id,
    required this.userId,
    required this.destinationId,
    required this.destinationName,
    required this.bookingDate,
    required this.totalPrice,
    required this.participants,
    required this.status,
  });

  factory BookingModel.fromMap(Map<String, dynamic> data) {
    return BookingModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      destinationId: data['destinationId'] ?? '',
      destinationName: data['destinationName'] ?? '',
      bookingDate: data['bookingDate'] as DateTime? ?? DateTime.now(),
      totalPrice: data['totalPrice'] ?? 0,
      participants: data['participants'] ?? 1,
      status: data['status'] ?? 'pending',
    );
  }
}
