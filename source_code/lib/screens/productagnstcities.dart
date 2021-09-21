import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/ui_elements/product_card.dart';
import 'package:active_ecommerce_flutter/repositories/product_repository.dart';
import 'package:active_ecommerce_flutter/helpers/shimmer_helper.dart';
import 'package:http/http.dart' as http;
import 'package:active_ecommerce_flutter/screens/product_details.dart';
import 'dart:convert';

class ProductCities extends StatefulWidget {
  int id;
  ProductCities({this.id});
  @override
  _ProductCitiesState createState() => _ProductCitiesState();
}

class _ProductCitiesState extends State<ProductCities> {
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: FutureBuilder(
                          future: buildProductOfCities(context),
                          builder: ((context, snap) {
                            var products = snap.data;
                            if (snap.hasData) {
                              return snap.data;
                            } else if (snap.hasError) {
                              return Text("${snap.error}");
                            } else {
                              return Row(
                                children: [
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ShimmerHelper().buildBasicShimmer(
                                          height: 120.0,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  32) /
                                              3)),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ShimmerHelper().buildBasicShimmer(
                                          height: 120.0,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  32) /
                                              3)),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(right: 0.0),
                                      child: ShimmerHelper().buildBasicShimmer(
                                          height: 120.0,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  32) /
                                              3)),
                                ],
                              );
                            }
                          }),
                        ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        "Products",
        style: TextStyle(fontSize: 16, color: MyTheme.accent_color),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

    Future<Widget> buildProductOfCities(context) async {
    List<Widget> x = [];

    var response = await http.get(
        Uri.parse("https://easykhareeddev.einnovention.tech/api/city/${widget.id}"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];

      data.forEach((element) {
        x.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () {},
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetails(
                      id: widget.id,
                    );
                  }));
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    side: new BorderSide(color: MyTheme.light_grey, width: 1.0),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 0.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          //width: 100,
                          height: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                  bottom: Radius.zero),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/placeholder.png',
                                image: '${element['image']}',
                                fit: BoxFit.cover,
                              ))),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
                        child: Container(
                          height: 32,
                          child: Text(
                            "${element['name']}",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 11, color: MyTheme.font_grey),
                          ),
                        ),
                      ),
                   
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
    }
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(8),
      crossAxisSpacing: 10,
      childAspectRatio: 0.7,
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: x,
    );
  }
}
