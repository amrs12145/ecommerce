extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String replace_() {
    return replaceAll('_', ' & ');
  }

  // String capitalizeAndReplace_() {
  //   int i = indexOf('_') + 3;
  //   String t = capitalize();
  //   t = t.replaceAll('_', ' & ');
  //   t[i] =
  //   return t;

  //   // return this[(capitalize().indexOf('_') + 3)].toUpperCase();
  // }
}
