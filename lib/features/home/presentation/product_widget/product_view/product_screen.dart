import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/widgets/product_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../product_view_model/product_view_model.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ProductViewModel>(
        create: (context) => getIt.get<ProductViewModel>()..start(),
        child: BlocConsumer<ProductViewModel, BaseState>(
          listener: (context, state) {
            baseListener(context, state);

          },
          builder: (context, state) {
            return baseBuilder(
              context,
              state,
              ProductScreenBody(viewModel: context.read<ProductViewModel>()),
            );
          },
        ),
      ),
    );
  }
}
