import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo(
      {super.key,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.images,
      required this.thumbnail,
      required this.hero});
  final String title;
  final String description;
  final num price;
  final num rating;
  final num stock;
  final num discountPercentage;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;
  final num hero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(159, 162, 173, 0.15),
                ),
                child: Hero(
                  tag: hero,
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 320,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset('asset/Bag.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(143, 149, 158, 1)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(143, 149, 158, 1)),
                      ),
                      Text(
                        '\$$price',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(159, 162, 173, 0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Description',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              description,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(143, 149, 158, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
