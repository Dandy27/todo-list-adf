import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';
import 'default_change_notifier.dart';

class DefaultListenerNotifier {
  final DefaultChangeNotifier changeNotifier;

  DefaultListenerNotifier({required this.changeNotifier});

  void listener(
      {required BuildContext context,
      required SuccessVoildCallback successVoildCallback,
      ErrorVoildCallback? errorVoildCallback}) {
    changeNotifier.addListener(() {
      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }
      if (changeNotifier.hasError) {
        if (errorVoildCallback != null) {
          errorVoildCallback(changeNotifier, this);
        }
        Messages.of(context).showError(changeNotifier.error ?? 'Erro interno');
      } else if (changeNotifier.isSuccess) {
        successVoildCallback(changeNotifier, this);
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SuccessVoildCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);

typedef ErrorVoildCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);
