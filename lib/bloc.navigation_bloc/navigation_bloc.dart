import 'package:bloc/bloc.dart';
import 'package:vendegana/screen/myaccount.dart';
import 'package:vendegana/screen/myorders.dart';
import 'package:vendegana/screen/settings.dart';
import 'package:vendegana/screen/wish_list.dart';

import '../main.dart';

enum NavigationEvents {HomePageClickedEvent, MyAccountClickedEvent,MyOrdersClickedEvent,MySettingsClickedEvent
, MyWishClickedEvent}

abstract class NavigationStates{}
class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  @override

  NavigationStates get initialState => WelcomeScreen();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event){
      case NavigationEvents.HomePageClickedEvent: yield WelcomeScreen();
      break;
      case NavigationEvents.MyAccountClickedEvent: yield MyAccountPage();
      break;
      case NavigationEvents.MyOrdersClickedEvent: yield MyOrdersPage();
      break;
      case NavigationEvents.MySettingsClickedEvent: yield SettingsPage();
      break;
      case NavigationEvents.MyWishClickedEvent: yield WishPage();
      break;
    }
  }
}