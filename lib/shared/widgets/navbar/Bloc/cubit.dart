import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/shared/widgets/navbar/Bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../screens/main/cart/cart.dart';
import '../../../../screens/main/favorite/Favorite.dart';
import '../../../../screens/main/home/home.dart';
import '../../../../screens/main/profile/profile.dart';
import '../../../../screens/main/shop/category.dart';

class NavbarCubit extends Cubit<NavbarStates>{
  NavbarCubit() : super(NavbarInitialState());
  static NavbarCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final List<Widget> screens = [
    Home(),
    Category(),
    Cart(),
    Favorite(),
    Profile(),
  ];
  void changeNavbarState(int index){
    currentIndex= index;
    emit(ChangeNavbarStates());
  }

}