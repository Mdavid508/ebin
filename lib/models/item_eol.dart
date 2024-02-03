class ItemEol {
  final String itemName;
  final String url;
  final int eol;
  final String category;
  final String? yearofPurchase;

//constructor of this class.
  ItemEol({
    required this.itemName,
    required this.url,
    required this.eol,
    required this.category,
    this.yearofPurchase,
  });
}
