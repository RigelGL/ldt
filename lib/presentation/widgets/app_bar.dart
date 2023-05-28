import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ldt/domain/state/environment_state.dart';
import 'package:ldt/internal/app_module.dart';
import 'package:ldt/internal/colors.dart';

class AppMainBar extends StatefulWidget implements PreferredSizeWidget {
  const AppMainBar({Key? key}) : super(key: key);

  @override
  State<AppMainBar> createState() => _AppMainBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _AppMainBarState extends State<AppMainBar> {
  late EnvironmentState _environmentState;

  @override
  void initState() {
    super.initState();
    _environmentState = AppModule.environmentState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(width: double.infinity, child: Image.asset('assets/images/header.png', fit: BoxFit.fitWidth, alignment: Alignment.center)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                Expanded(
                  child: Text('Привет, ${_environmentState.user?.name ?? ''}!', style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(children: [
                    Text('10M ', style: TextStyle(color: Colors.white, fontSize: 20)),
                    SvgPicture.asset('assets/icons/logo-solo.svg', height: 20),
                  ]),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
