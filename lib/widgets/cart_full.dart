import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_shop/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  const CartFull({Key key}) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    var _theme = Provider.of<DarkThemeProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 138,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: 138,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/adidas-pink-shoe-on-blue-background-michael-dechev.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                // margin: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          width: MediaQuery.of(context).size.width * .4,
                          child: Text(
                            "This is the Text",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _buildIcon(Entypo.cross, Colors.red, () {}),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Price: ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text("34.98"),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Sub Total: ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text("34.98"),
                      ],
                    ),
                    Spacer(),
                    _shipping(_theme)
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icons, Color color, Function onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icons,
            color: color,
          ),
        ),
        splashColor: Colors.yellow,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _shipping(DarkThemeProvider theme) {
    return Container(
      decoration: BoxDecoration(
          color: theme.getDarkTheme ? Colors.black45 : Colors.teal.shade900,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              "Shipping fees: ",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Spacer(),
          _buildIcon(Icons.remove, Colors.white, () {}),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              child: Text(
                "78",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            color: Colors.tealAccent,
          ),
          _buildIcon(Icons.add, Colors.white, () => print('Icons.add')),
        ],
      ),
    );
  }
}
