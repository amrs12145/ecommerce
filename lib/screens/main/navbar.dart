import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/constants/colors.dart';
import '../../shared/constants/dimensions.dart';
import 'home/home.dart';
import 'shop/category.dart';
import 'cart/cart.dart';
import 'favorite/favorite.dart';
import 'profile/profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Home(),
    Category(),
    Cart(),
    Favorite(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Kdimensions.borderUnit),
            topLeft: Radius.circular(Kdimensions.borderUnit),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(Kdimensions.borderUnit),
            topLeft: Radius.circular(Kdimensions.borderUnit),
          ),
          child: BottomNavigationBar(
            backgroundColor: Kcolors.dark,
            elevation: 11,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: Kcolors.primary,
            items: [
              BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? SvgPicture.asset("assets/icons/Selected_bot_home.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_home.svg"),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? SvgPicture.asset("assets/icons/Selected_bot_shop.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_Shop.svg"),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? SvgPicture.asset("assets/icons/Selected_bot_cart.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_cart.svg"),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 3
                    ? SvgPicture.asset("assets/icons/Selected_bot_heart.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_heart.svg"),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 4
                    ? SvgPicture.asset("assets/icons/Selected_bot_profile.svg")
                    : SvgPicture.asset("assets/icons/Bot_bar_profile.svg"),
                label: "Profile",
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
