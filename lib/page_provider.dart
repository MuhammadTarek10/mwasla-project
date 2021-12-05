import 'package:flutter/material.dart';


class CurrentPageController with ChangeNotifier{
  int pageNumber = 2;

  void changePage(newPageNumber){
    pageNumber = newPageNumber;
    notifyListeners();
  }
}