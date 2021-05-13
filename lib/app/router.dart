import 'package:auto_route/auto_route_annotations.dart';
import 'package:dorry_v1/ui/views/getstarted/getstarted_view.dart';
import 'package:dorry_v1/ui/views/home/home_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dorry_v1/ui/views/laundry/laundry_view.dart';
import 'package:dorry_v1/ui/views/login/login_view.dart';
import 'package:dorry_v1/ui/views/signup/signup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: GetStartedView, initial: true),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LaundryView),
  ],
)
class $Router {}

// run "flutter pub run build_runner build --delete-conflicting-outputs"
// this auto generate the routing
