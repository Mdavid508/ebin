class CollectionPoint {
  final String id;
  final String collectionPointName;
  final double lat, lang;
  final List<String>? imageUrls;

  CollectionPoint({
    required this.id,
    required this.collectionPointName,
    required this.lat,
    required this.lang,
    this.imageUrls,
  });
}
