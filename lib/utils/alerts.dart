import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> showConfirmationAlert(BuildContext context, String message) async {
  final result = await showOkCancelAlertDialog(
    context: context,
    message: message,
    isDestructiveAction: true,
    title: 'Are you sure?',
    okLabel: 'Yes, I\'m sure',
    cancelLabel: 'Cancel',
  );

  return result == OkCancelResult.ok;
}

Future<void> showOkAlert(BuildContext context, String message) async {
  await showOkAlertDialog(
    context: context,
    message: message,
    title: 'Notification',
  );
}
