import 'package:flutter/foundation.dart';
import 'package:myriad_bus_scheduler/core/enum/view_state.dart';

class BaseViewModel with ChangeNotifier {
  ViewState _state = ViewState.IDLE;

  void changeState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  bool isBusy() => (_state == ViewState.BUSY);
}
