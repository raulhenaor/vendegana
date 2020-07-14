import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:vendegana/bloc.navigation_bloc/navigation_bloc.dart';
import 'custom_clipper.dart';
import 'menu_item.dart';



class SideBar extends StatefulWidget {
  const SideBar({Key key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  StreamSink<bool> isSideBarOpenedSink;
  
  final _animationDuration = const Duration(milliseconds: 350);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if(isAnimationCompleted){
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    }else{
      isSideBarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync){
        return     AnimatedPositioned(
        duration: _animationDuration,
        top: 0,
        bottom: 0,
        left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
        right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
         child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.amber,
                child: Column(children: <Widget>[
                  SizedBox(height: 100),
                  ListTile(
                    title: Text("Usuario", style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800
                    )),
                    subtitle: Text(
                      "telefono@registrado",
                      style: TextStyle(
                      color: Colors.white54,
                      fontSize: 20,
                      ),
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                      radius: 40, 
                      ),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.6),
                    height: 64,
                    thickness: 0.5,
                    indent: 32,
                    endIndent: 32,
                  ),
                  Menucitos(
                    icon: Icons.home,
                    title: 'Inicio',
                    onTap: (){
                      onIconPressed();
                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                    },
                  ),
                  Menucitos(
                    icon: Icons.person,
                    title: 'Mi Perfil',
                    onTap: (){
                      onIconPressed();
                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                    },
                  ),
                  Menucitos(
                    icon: Icons.shopping_basket,
                    title: 'Mi Carrito',
                    onTap: (){
                      onIconPressed();
                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                    },
                  ),
                  Menucitos(
                      icon: Icons.card_giftcard,
                      title: 'Deseados',
                      onTap: (){
                      onIconPressed();
                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyWishClickedEvent);
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.6),
                    height: 64,
                    thickness: 0.5,
                    indent: 32,
                    endIndent: 32,
                  ),
                  Menucitos(
                    icon: Icons.settings,
                    title: 'Configuracion',
                    onTap: (){
                      onIconPressed();
                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MySettingsClickedEvent);
                    },
                  ),
                  Menucitos(
                    icon: Icons.exit_to_app,
                    title: 'Salir',
                  )
                ],
                ),
              ) 
            ),
            Align(
              alignment: Alignment(0, -0.9),
              child: GestureDetector(
                onTap:(){
                  onIconPressed();
                },
                child: ClipPath(
                  clipper: CustomMenuClipper(),
                  child: Container(
                    width: 35,
                    height: 110,
                    color: Colors.amber,
                    alignment: Alignment.centerLeft,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      progress: _animationController.view,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
      },

    );
  }
}