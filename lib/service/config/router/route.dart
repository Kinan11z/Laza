import 'package:go_router/go_router.dart';
import 'package:laza/laza.dart';
import 'package:laza/products.dart';
import 'package:laza/welcome.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => Laza(), routes: [
      GoRoute(
        path: 'Welcome',
        builder: (context, state) => Welcome(),
      ),
      GoRoute(
        path: 'Products',
        builder: (context, state) => Products(),
      ),
    ]),
  ],
);
