class BookInfo {
  final double price;
  final double rate;
  final int count;

  BookInfo({required this.price, required this.rate, required this.count});

  static List<BookInfo> bookInfoList = [
    BookInfo(price: 25.36, rate: 5.0, count: 2398),
    BookInfo(price: 19.88, rate: 3.9, count: 3289),
    BookInfo(price: 30.99, rate: 4.5, count: 8392),
    BookInfo(price: 53.12, rate: 5.0, count: 5269),
    BookInfo(price: 81.41, rate: 4.9, count: 4571),
    BookInfo(price: 45.98, rate: 4.7, count: 1568),
    BookInfo(price: 29.00, rate: 3.8, count: 7564),
  ];
}
