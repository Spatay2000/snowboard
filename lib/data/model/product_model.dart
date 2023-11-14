class ProductModel {
  int id;
  String name;
  String image;

  ProductModel({required this.id, required this.name, required this.image});
}
 List<ProductModel> productModel = [
    ProductModel(id: 1, name: 'Комбо', image: 'assets/png/combo.png'),
    ProductModel(id: 2, name: 'Шлем', image: 'assets/png/helmet.png'),
    ProductModel(id: 3, name: 'Очки', image: 'assets/png/glasses.png'),
    ProductModel(id: 4, name: 'Куртка', image: 'assets/png/jacket.png'),
    ProductModel(id: 5, name: 'Лыжи', image: 'assets/png/skis.png'),
    ProductModel(id: 6, name: 'Борд', image: 'assets/png/board.png'),
    ProductModel(id: 7, name: 'Штаны', image: 'assets/png/trousers.png'),
    ProductModel(id: 8, name: 'Обувь', image: 'assets/png/boots.png'),
    ProductModel(id: 9, name: 'Перчатки', image: 'assets/png/gloves.png'),
    ProductModel(id: 10, name: 'Палки', image: 'assets/png/cane.png'),
    ProductModel(id: 11, name: 'Ски-пасс', image: 'assets/png/skipass.png'),
  ];