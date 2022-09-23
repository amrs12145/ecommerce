import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterStates> {
  FilterCubit() : super(FilterStates.intial);

  bool edited = false;

  Map<String, dynamic> filters = {
    'range': <double>[],
    'colors': <int>[],
    'sizes': <String>[],
    'categories': <String>[],
    'brands': <String>[],
  };

  Map<String, dynamic> localFilters = {
    'range': <double>[],
    'colors': <int>[],
    'sizes': <String>[],
    'categories': <String>[],
    'brands': <String>[],
  };

  List<T> get<T>(String key) => [...filters[key]];

  void save(Map<String, dynamic> localFilters) {
    edited = true;
    filters = {
      'range': <double>[...localFilters['range']],
      'colors': <int>[...localFilters['colors']],
      'sizes': <String>[...localFilters['sizes']],
      'categories': <String>[...localFilters['categories']],
      'brands': <String>[...localFilters['brands']],
    };
  }

  void reset() {
    edited = false;
    filters = {
      'range': <double>[],
      'colors': <int>[],
      'sizes': <String>[],
      'categories': <String>[],
      'brands': <String>[],
    };
    emit(FilterStates.dummy);
    emit(FilterStates.intial);
  }

  Map<String, dynamic> getFilters() {
    return {
      'range': <double>[...filters['range']],
      'colors': <int>[...filters['colors']],
      'sizes': <String>[...filters['sizes']],
      'categories': <String>[...filters['categories']],
      'brands': <String>[...filters['brands']],
    };
  }
}

enum FilterStates { intial, dummy }
