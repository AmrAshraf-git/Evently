import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  var currentLocal="En";
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<String>.rolling(
        current: currentLocal,
        values: ["En","Ar"],
        onChanged: (newLocal){
          setState(() {
            currentLocal=newLocal;
          });
        },
        iconBuilder: (value,isSelected){
          if(value=="Ar"){return SvgPicture.asset(AssetsManager.ic_eg);}
          else{return SvgPicture.asset(AssetsManager.ic_lr);}
        },
        // iconList: [...], you can use iconBuilder, customIconBuilder or iconList
        style: ToggleStyle(
          backgroundColor: null,
          indicatorColor: Theme.of(context).primaryColor,
        ),
    );
  }
}
