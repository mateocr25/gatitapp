import 'package:flutter/material.dart';
import 'package:gatitapp/domain/entities/cats.dart';
import 'package:gatitapp/injection_container.dart' as injection_container;
import 'package:gatitapp/presentation/cat_detail/cat_detail.dart';
import 'package:gatitapp/presentation/cat_list/cat_list.dart';
import 'package:go_router/go_router.dart';

import 'design/theme/gatitapp_theme.dart';

void main() {
  injection_container.init();
  runApp(const GatitApp());
}

final router = GoRouter(
  initialLocation: CatList.routeName,
  routes: [
    GoRoute(
      path: "/",
      name: CatList.routeName,
      builder: (context, state) => const CatList(),
    ),
    GoRoute(
      path: "/catDetail",
      name: CatDetailPage.routeName,
      builder: (context, state){
        final arguments = state.extra as Cat;
        return CatDetailPage(catData: arguments,);
      },
    ),
  ],
);

class GatitApp extends StatelessWidget {
  const GatitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Gatitapp',
      theme: gatitAppTheme,
    );
  }
}
