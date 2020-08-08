import 'package:flutter/material.dart';
import 'package:vendegana/constants.dart';
import 'package:vendegana/models/Product.dart';
import 'package:vendegana/screens/details/details_screen.dart';
import 'package:vendegana/screens/home/components/item_card.dart';
import 'package:vendegana/screens/home2/components/recomend_plants.dart';
import 'package:vendegana/screens/home2/components/title_with_more_bbtn.dart';




class Accesorios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /* Categories(), */
          // HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomendados", press: () {}),
          RecomendsPlants(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
