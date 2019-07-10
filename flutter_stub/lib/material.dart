// Those stubs would ideally be generated from original flutter_web
// APIs.

typedef VoidCallback = void Function();

abstract class Key {}

abstract class BuildContext {}

abstract class Widget {
  const Widget({Key key});
}

abstract class StatefulWidget extends Widget {
  const StatefulWidget({Key key});
  
  State createState();
}

abstract class State<T extends StatefulWidget> {
  T get widget => throw UnimplementedError();
  BuildContext get context => throw UnimplementedError();
  Widget build(BuildContext context);
  void setState(VoidCallback fn) {}
}

class Scaffold extends Widget {
  const Scaffold({
    Key key,
    AppBar appBar,
    Widget body,
    Widget floatingActionButton,
  });
}

class AppBar extends Widget {
  AppBar({
    Widget title,
  });
}

class Text extends Widget {
  Text(
    String title,
  );
}

class Center extends Widget {
  Center({
    Widget child,
  });
}

class FloatingActionButton extends Widget {
  FloatingActionButton({
    Widget child,
    String tooltip,
    VoidCallback onPressed,
  });
}