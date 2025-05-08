class RecommendedProducts {
   bool favorite;
  final String image;
  final String label;
  final String description;
  final String price;
  final List<Map<String, String>> related;
  String type;
  RecommendedProducts(
      {required this.favorite,
      required this.image,
      required this.label,
      required this.description,
      required this.price,
      required this.related,
      required this.type});
}
