
class Product{
  String name;
  String name2;
  String Price;
  String img;

  Product({
    required this.name,
    required this.name2,
    required this.Price,
    required this.img,
});


  static List<Product>product = [
    Product(name: 'Ivorian', name2: 'DOLCE', Price: '100', img: 'assets/sweat5.jpg'),
    Product(name: 'Lafeti', name2: 'DOLCE', Price: '120', img: 'assets/dress2.jpg'),
    Product(name: 'Magnique', name2: 'DOLCE', Price: '200', img: 'assets/dress.jpg'),
    Product(name: 'Comfy', name2: 'DOLCE', Price: '98', img: 'assets/sweat6.jpg'),
    Product(name: 'Venus', name2: 'DOLCE', Price: '220', img: 'assets/model3.jpeg'),
    Product(name: 'WWW', name2: 'DOLCE', Price: '199', img: 'assets/model6.jpeg'),
    Product(name: 'Zealous', name2: 'DOLCE', Price: '199', img: 'assets/model9.jpeg'),

  ];
}