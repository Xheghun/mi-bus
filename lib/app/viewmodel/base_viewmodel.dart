import 'package:flutter/foundation.dart';
import 'package:myriad_bus_scheduler/core/enum/view_state.dart';
import 'package:myriad_bus_scheduler/core/usecase/auth/auth_usecase.dart';

class BaseViewModel with ChangeNotifier {
  ViewState _state = ViewState.IDLE;
  final AuthUseCase authUseCase;

  BaseViewModel({this.authUseCase});

  void changeState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  bool isBusy() => (_state == ViewState.BUSY);

  Future<bool> hasUser() async =>
   await authUseCase.hasUser();

}
