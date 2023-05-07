import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToastData {
  final String text;
  final String? iconAsset;
  final bool isTemporary;

  ToastData(
    this.text, {
    this.iconAsset,
    this.isTemporary = true,
  });
}

typedef ToastDataBuilder = ToastData Function();

class ToasterService extends Cubit<ToasterState> {
  ToasterService() : super(const ToasterState());

  void show(ToastDataBuilder toastBuilder) => emit(ToasterState(builder: toastBuilder));

  void dismissAll() => emit(const ToasterState());

  void clear() => emit(const ToasterState());
}

class ToasterState {
  final ToastDataBuilder? builder;

  const ToasterState({this.builder});
}

class Toaster {
  static const _toastDurationInSec = 5;

  Flushbar? _permanentFlushBar;

  Future<void> show(
    BuildContext context, {
    required String text,
    required String? iconAsset,
    required bool isTemporary,
    String? subText,
    bool isWhite = true,
  }) async {
    final bar = Flushbar(
      borderRadius: BorderRadius.circular(8.0),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: iconAsset != null ? 5.0 : 15.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconAsset != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                        child: Image.asset(
                          iconAsset,
                          color: isWhite ? Colors.white : null,
                        ),
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          subText != null
              ? Text(
                  subText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[300]),
                )
              : const SizedBox.shrink()
        ],
      ),
      boxShadows: const [BoxShadow(color: Colors.black26, offset: Offset(0.0, 4.0), blurRadius: 4.0)],
      duration: isTemporary ? const Duration(seconds: _toastDurationInSec) : null,
      animationDuration: const Duration(milliseconds: 500),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.grey[500]!,
      isDismissible: isTemporary,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    );

    if (!isTemporary) {
      await _permanentFlushBar?.dismiss();
      _permanentFlushBar = bar;
    }
    // ignore: use_build_context_synchronously
    await bar.show(context);
  }

  Future<void> dismiss() async {
    await _permanentFlushBar?.dismiss();
    _permanentFlushBar = null;
  }
}
