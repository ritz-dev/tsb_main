import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  // Use HeroIcon widget directly
  static const home = HeroIcons.home;
  static const list = HeroIcons.queueList;
  static const qrCode = HeroIcons.qrCode;
  static const gift = HeroIcons.gift;
  static const user = HeroIcons.userCircle;
  static const backButton = HeroIcons.chevronLeft;
  static const filter = HeroIcons.funnel;
  static const transfer = FontAwesomeIcons.arrowRightArrowLeft;
  static const reward = HeroIcons.giftTop;
  static const search = HeroIcons.magnifyingGlass;
  static const bus = FontAwesomeIcons.bus;
  static const String busSvgPath = "assets/icon/bus.svg";
  static const String transferSvgPath = "assets/icon/transfer.svg";
  static const String rewardSvgPath = "assets/icon/reward.svg";
  static const String heartSvgPath = "assets/icon/heart.svg";
  static const String barImagePath = "assets/icon/bar.png";
  static const String drawerSvgPath = "assets/icon/drawer.svg";




  // Optional: Helper method to create a HeroIcon widget with size/color
  //home
  static Widget homeIcon({Color? color, double size = 24}) {
    return HeroIcon(home, color: color, size: size);
  }

  //list
  static Widget listIcon({Color? color, double size = 24}) {
    return HeroIcon(list, color: color, size: size);
  }

  //qrcode
  static Widget qrCodeIcon({Color? color, double size = 24}) {
    return HeroIcon(qrCode, color: color, size: size);
  }

  //gift
  static Widget giftIcon({Color? color, double size = 24}) {
    return HeroIcon(gift, color: color, size: size);
  }

  //user
  static Widget userIcon({Color? color, double size = 24}) {
    return HeroIcon(user, color: color, size: size);
  }

  //backbutton
  static Widget backButtonIcon({Color? color, double size = 24}) {
    return HeroIcon(backButton, color: color, size: size);
  }

  //filterIcon
  static Widget filterIcon({Color? color, double size = 24}) {
    return HeroIcon(filter, color: color, size: size);
  }

  //transferIcon
  static Widget transferIcon({Color? color, double size = 24}) {
    return FaIcon(transfer, color: color, size: size);
  }

  //TransferSvgIcon
  static Widget transferSvgIcon({double size = 28, Color? color}) {
    return SvgPicture.asset(
      transferSvgPath,
      width: size,
      height: size,
      color: color,
    );
  }

  //rewardIcon
  static Widget rewardIcon({Color? color, double size = 24}) {
    return HeroIcon(reward, color: color, size: size);
  }

  //RewardSvgIcon
  static Widget rewardSvgIcon({double size = 28, Color? color}) {
    return SvgPicture.asset(
      rewardSvgPath,
      width: size,
      height: size,
      color: color,
    );
  }

  //serachIcon
  static Widget searchIcon({Color? color, double size = 24}) {
    return HeroIcon(search, color: color, size: size);
  }

  //Bus Icon
  static Widget busIcon({Color? color, double size = 24}) {
    return FaIcon(bus, color: color, size: size);
  }

  //BusSvg Icon
  static Widget busSvgIcon({double size = 28, Color? color}) {
    return SvgPicture.asset(
      busSvgPath,
      width: size,
      height: size,
      color: color,
    );
  }

  //HeartImgIcon
  static Widget heartSvgIcon({double size = 24, Color? color}) {
    return SvgPicture.asset(
      heartSvgPath,
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
 
  //Drawer Icon
  static Widget drawerSvgIcon({double size = 24, Color? color}) =>
    SvgPicture.asset(
      drawerSvgPath,
      width: size,
      height: size,
      color: color,
    );  
 
}
