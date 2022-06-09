import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodecomm/components/bottom_nav_bar.dart';
import 'package:riverpodecomm/components/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:riverpodecomm/riverpod/riverpod_management.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  void initState() {
    ref.read(productRiverpod).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: appBarBuild(watch),
      body: watch.body(),
    );
  }

  CupertinoNavigationBar appBarBuild(BottomNavBarRiverpod watch) {
    return CupertinoNavigationBar(
      middle: Text(watch.appBarTitle()),
    );
  }
}
