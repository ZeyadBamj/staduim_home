import '../../models/tab_booking_model.dart';

final List<TabBookingModel> mockBookings = [
  TabBookingModel(
    name: 'ملعب الرياض',
    date: '2025-06-21',
    day: 'الجمعة',
    time: '6:00 م - 7:00 م',
    price: '150 ريال',
    status: 'القادمة',
    image: 'assets/images/enma_staduim.jpg',
  ),
  TabBookingModel(
    name: 'ملعب جدة',
    date: '2025-06-10',
    day: 'الاثنين',
    time: '8:00 م - 9:00 م',
    price: '120 ريال',
    status: 'السابقة',
    image: 'assets/images/enma_staduim.jpg',
  ),
  TabBookingModel(
    name: 'ملعب الدمام',
    date: '2025-06-05',
    day: 'الأربعاء',
    time: '7:00 م - 8:00 م',
    price: '100 ريال',
    status: 'ملغية',
    image: 'assets/images/enma_staduim.jpg',
  ),
];

