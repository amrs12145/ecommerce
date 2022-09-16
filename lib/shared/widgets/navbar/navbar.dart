import 'package:ecommerce/shared/widgets/navbar/Bloc/cubit.dart';
import 'package:ecommerce/shared/widgets/navbar/Bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/dimensions.dart';
import '../../../screens/main/home/home.dart';
import '../../../screens/main/shop/category.dart';
import '../../../screens/main/cart/cart.dart';
import '../../../screens/main/favorite/favorite.dart';
import '../../../screens/main/profile/profile.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NavbarCubit(),
        child: BlocConsumer<NavbarCubit, NavbarStates>(
          listener: (context, state) => {},
          builder: (BuildContext context, state) {
            NavbarCubit cubit = NavbarCubit.get(context);
            return
              Scaffold(
                body: cubit.screens[cubit.currentIndex],
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
                      currentIndex: cubit.currentIndex,
                      selectedItemColor: Kcolors.primary,
                      items: [
                        BottomNavigationBarItem(
                          icon: cubit.currentIndex == 0
                              ? SvgPicture.asset(
                              "assets/icons/Selected_bot_home.svg")
                              : SvgPicture.asset(
                              "assets/icons/Bot_bar_home.svg"),
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: cubit.currentIndex == 1
                              ? SvgPicture.asset(
                              "assets/icons/Selected_bot_shop.svg")
                              : SvgPicture.asset(
                              "assets/icons/Bot_bar_Shop.svg"),
                          label: "Shop",
                        ),
                        BottomNavigationBarItem(
                          icon: cubit.currentIndex == 2
                              ? SvgPicture.asset(
                              "assets/icons/Selected_bot_cart.svg")
                              : SvgPicture.asset(
                              "assets/icons/Bot_bar_cart.svg"),
                          label: "Cart",
                        ),
                        BottomNavigationBarItem(
                          icon: cubit.currentIndex == 3
                              ? SvgPicture.asset(
                              "assets/icons/Selected_bot_heart.svg")
                              : SvgPicture.asset(
                              "assets/icons/Bot_bar_heart.svg"),
                          label: "Favorites",
                        ),
                        BottomNavigationBarItem(
                          icon: cubit.currentIndex == 4
                              ? SvgPicture.asset(
                              "assets/icons/Selected_bot_profile.svg")
                              : SvgPicture.asset(
                              "assets/icons/Bot_bar_profile.svg"),
                          label: "Profile",
                        ),
                      ],
                      onTap: (index) {
                    cubit.changeNavbarState(index);
                      },
                    ),
                  ),
                ),
              );
          },
        ));
  }
}
