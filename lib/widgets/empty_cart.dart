import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/colors.dart';
import 'package:flutter_shop/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/emptycart.png'))),
        ),
        Text(
          "Your Cart Is Empty",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 30,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
        ),
        Text(
          "You have not added \n anything to your Cart yet",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: _theme.getDarkTheme
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
              fontSize: 21,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .09,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.red),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            width: MediaQuery.of(context).size.width * .7,
            child: Text(
              "SHOP NOW",
              style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
