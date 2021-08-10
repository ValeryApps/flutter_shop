import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_shop/constants/colors.dart';
import 'package:flutter_shop/constants/my_icons.dart';
import 'package:flutter_shop/providers/dark_theme_provider.dart';
import 'package:flutter_shop/screens/wishlist_screen.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  ScrollController _scrollController;
  double top = 0.0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var _themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 200,
              pinned: true,
              elevation: 4,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  'Guest',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: userTitle('User Bag')),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Theme.of(context).splashColor,
                      child: ListTile(
                        onTap: () => Navigator.of(context)
                            .pushNamed(WishlistScreen.routeName),
                        title: Text('Wishlist'),
                        trailing: Icon(Icons.chevron_right_rounded),
                        leading: Icon(MyAppIcons.wishlist),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Theme.of(context).splashColor,
                      child: ListTile(
                        onTap: () {},
                        title: Text('Cart'),
                        trailing: Icon(Icons.chevron_right_rounded),
                        leading: Icon(MyAppIcons.cart),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: userTitle('User Information')),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  userListTitle(context, Icon(Icons.email), 'Email',
                      'valeryghn10@gmail.com'),
                  userListTitle(
                      context, Icon(Icons.call), 'Phone', '0776 589 443'),
                  userListTitle(context, Icon(Icons.local_shipping),
                      'Shipping address', 'Monrovia, Liberia'),
                  userListTitle(context, Icon(Icons.watch_later), 'Email',
                      'August 09, 2021'),
                  userTitle('Toggle Theme'),
                  useListTitleSwitch(_themeProvider),
                  userTitle('Toggle Theme'),
                  userListTitle(context, Icon(Icons.logout), 'Logout', ''),
                ],
              ),
            ),
          ],
        ),
        _buildFab(),
      ],
    ));
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  Widget userListTitle(
    BuildContext context,
    Icon icon,
    String title,
    String subTitle,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        onTap: () {},
        child: ListTile(
          leading: icon,
          title: Text(title),
          subtitle: Text(subTitle),
        ),
      ),
    );
  }

  Widget userTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, bottom: 8, top: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }

  ListTileSwitch useListTitleSwitch(DarkThemeProvider _theme) {
    return ListTileSwitch(
      value: _theme.getDarkTheme,
      leading: Icon(Ionicons.md_moon),
      onChanged: (value) {
        setState(() {
          _theme.setDarkTheme = value;
        });
      },
      visualDensity: VisualDensity.comfortable,
      switchType: SwitchType.cupertino,
      switchActiveColor: Colors.indigo,
      title: Text('Dark Theme'),
    );
  }
}
