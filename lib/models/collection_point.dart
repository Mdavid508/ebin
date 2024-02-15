class CollectionPoint {
  final String collectionPointName;
  final double lat, lang;
  final List<String>? imageUrls;

  CollectionPoint({
    required this.collectionPointName,
    required this.lat,
    required this.lang,
    this.imageUrls,
  });
}
