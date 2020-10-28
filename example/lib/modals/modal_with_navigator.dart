import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalWithNavigator extends StatelessWidget {
  const ModalWithNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final scrollController = PrimaryScrollController.of(context);
    return Material(
        child: Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context) => Builder(
          builder: (context) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                leading: Container(),
                middle: Text('Modal Page')),
            child: SafeArea(
              bottom: false,
              child: ListView(
                shrinkWrap: true,
                controller: ModalScrollController.of(context),
                children: ListTile.divideTiles(
                  context: context,
                  tiles: List.generate(
                      100,
                      (index) => ListTile(
                            title: Text('Item'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CupertinoPageScaffold(
                                      navigationBar: CupertinoNavigationBar(
                                        transitionBetweenRoutes: false,
                                        middle: Text('New Page'),
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[],
                                      ))));
                            },
                          )),
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
