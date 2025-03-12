import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  var currentTheme=ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<ThemeMode>.rolling(
        current: currentTheme,
        values: [ThemeMode.system,ThemeMode.light,ThemeMode.dark],
        onChanged: (newTheme){
          setState(() {
            currentTheme=newTheme;
          });
        },
        iconBuilder: (value,isSelected){
          if(value==ThemeMode.dark){return SvgPicture.asset(AssetsManager.ic_moon);}
          else if(value==ThemeMode.light){return SvgPicture.asset(AssetsManager.ic_sun);}
          else{return SvgPicture.asset(AssetsManager.ic_system);}
        },
        // iconList: [...], you can use iconBuilder, customIconBuilder or iconList
        style: ToggleStyle(
          backgroundColor: null,
          indicatorColor: Theme.of(context).primaryColor,
        ), // optional style settings
    );
  }
}
