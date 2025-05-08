import 'package:alexapps/core/constants/routes.dart';
import 'package:alexapps/core/constants/theme.dart';
import 'package:alexapps/core/localization/change_locale.dart';
import 'package:alexapps/core/localization/translation.dart';
import 'package:alexapps/core/services/services.dart';
import 'package:alexapps/view%20model/home_page/home_page_cubit.dart';
import 'package:alexapps/view/modules/main/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Services().init();
  runApp(const Test());
}
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomePageCubit(),
              ),
            ],
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(LocaleClass().curLang),
              translations: MyTranslation(),
              routes: routes,
              theme: theme,
              home: const OnBoarding(),
            ));
      },
    );
  }
}
