import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isLightBlue = true; //_underscore : private

  bool get isLightBlue => _isLightBlue; // buat getter & setter
  set isLightBlue(bool value) {
    _isLightBlue = value;

    // perintah ini memberitahukan pada widget2 yang sedang menunggu si consuner tadi.
    // kita kasih tau oiii.. ada perubahan nih ke consumer yg lagi nunggu perubahan dari si application_color ini.
    notifyListeners();
  }
  // getter yang akan mengembalikan color sesuai dengan _isLightBlue
  // jika true mengembalikan lightBlue dan jika tidak true - amber
  Color get color => (_isLightBlue) ? Colors.lightBlue : Colors.amber;
}
