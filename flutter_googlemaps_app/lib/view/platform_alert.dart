import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_settings/app_settings.dart';

class PlatformAlert {

  final String? title;
  final String? message;

  const PlatformAlert({@required this.title, @required this.message})
      : assert(title != null),
        assert(message != null);

  void show(BuildContext context) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      _buildCupertinoAlert(context);
    } else {
      _buildMaterialAlert(context);
    }

  }

  void _buildMaterialAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                TextButton(
                    child: Text('Setting'),
                    onPressed: () => AppSettings.openLocationSettings()   // Open Location setting
                ),
                TextButton(
                    child: Text('Close'),
                    onPressed: () => Navigator.of(context).pop()
                ),
              ]
          );
        }
     );
  }

  void _buildCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                CupertinoButton(
                    child: Text('Setting', style: TextStyle(color: CupertinoColors.activeBlue),),
                    onPressed: () => AppSettings.openLocationSettings()   // Open Location setting
                ),
                CupertinoButton(
                    child: Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed),),
                    onPressed: () => Navigator.of(context).pop()
                ),
              ]
          );
        }
     );
  }


  void show2(BuildContext context) {

    TargetPlatform platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      _buildCupertinoAlert2(context);
    } else {
      _buildMaterialAlert2(context);
    }

  }

  void _buildMaterialAlert2(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                TextButton(
                    child: Text('Close'),
                    onPressed: () => Navigator.of(context).pop()
                ),
              ]
          );
        }
    );
  }

  void _buildCupertinoAlert2(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: Text(title!),
              content: Text(message!),
              actions: [
                CupertinoButton(
                    child: Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed),),
                    onPressed: () => Navigator.of(context).pop()
                ),
              ]
          );
        }
    );
  }

}
