import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationsExtension on BuildContext {
   AppLocalizations get localization{
    return AppLocalizations.of(this)!;
  }

}