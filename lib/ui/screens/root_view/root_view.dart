import 'package:auto_route/auto_route.dart';
import 'package:blaa/ui/modals/add_new_word.dart';
import 'package:blaa/ui/router/tabs_routes.dart';
import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Colors.amber,
      routes: bottomTabs,
      appBarBuilder: (_, tRouter) => AppBar(
        toolbarHeight: 40,
        elevation: 0.0,
        leading: const AutoBackButton(
          color: Colors.black,
        ),
      ),
      bottomNavigationBuilder: (_, tRouter) {
        return BottomNavigationBar(
            backgroundColor: Colors.grey[300],
            currentIndex: tRouter.activeIndex,
            onTap: tRouter.setActiveIndex,
            items: bottomBarItems);
      },
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade400,
        onPressed: () => _showAddWordDialog(context, const AddNewWord()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('new', style: TextStyle(fontSize: 11)),
                Icon(Icons.add, size: 14),
                Text('word', style: TextStyle(fontSize: 11))
              ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Future<dynamic> _showAddWordDialog(
          BuildContext ctx, Widget alertContentWidget) =>
      showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        barrierDismissible: true,
        barrierLabel: '',
        context: ctx,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  scrollable: true,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  title: const Text('Add new word'),
                  content: alertContentWidget,
                ),
              ));
        },
      );
}
