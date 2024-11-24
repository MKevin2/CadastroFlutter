import 'package:banco/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends InheritedWidget{
  final Widget child;
  List<Usuario> users = [];

  UserProvider(
    {
      required this.child, 
    }
  ) : super(child: child);

  static UserProvider? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}