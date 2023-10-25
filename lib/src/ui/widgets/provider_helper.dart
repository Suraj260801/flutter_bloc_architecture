import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProviderHelper<T extends ChangeNotifier> extends StatelessWidget {
  const ProviderHelper({super.key, required this.provider, required this.callback, required this.providerChild});
  final T provider;
  final Function(BuildContext,T,Widget) callback;
  final Widget providerChild;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create:(context)=>provider,
        builder: (context,child){
          return Consumer<T>(builder: callback(context,provider,providerChild!));
        },
    );
  }
}
