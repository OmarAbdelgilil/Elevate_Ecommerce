import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';
import 'package:elevate_ecommerce/features/orders/domain/usecases/get_orders_usecase.dart';
import 'package:elevate_ecommerce/features/orders/presentation/orders_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'orders_view_model_test.mocks.dart';

@GenerateMocks([GetOrdersUsecase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OrdersViewModel viewModel;
  late MockGetOrdersUsecase mockGetOrdersUsecase;

  setUp(() {
    mockGetOrdersUsecase = MockGetOrdersUsecase();
    viewModel = OrdersViewModel(mockGetOrdersUsecase);

    provideDummy<Result<OrdersModel?>>(Success(OrdersModel()));
    provideDummy<Result<OrdersModel?>>(
        Fail(Exception('Failed to load orders')));
  });

  group('OrdersViewModel Tests', () {
    test('initial state is OrdersInitialState', () {
      expect(viewModel.state, isA<OrdersInitialState>());
    });

    test(
        'doIntent with LoadOrders emits OrdersLoadingState, OrdersSuccessState on success',
        () async {
      when(mockGetOrdersUsecase.getOrders()).thenAnswer(
        (_) async => Success(OrdersModel()),
      );

      expectLater(
        viewModel.stream,
        emitsInOrder([
          isA<OrdersLoadingState>(),
          isA<OrdersSuccessState>(),
        ]),
      );

      viewModel.doIntent(LoadOrders());
    });

    test(
        'doIntent with LoadOrders emits OrdersLoadingState, OrdersErrorState on failure',
        () async {
      when(mockGetOrdersUsecase.getOrders()).thenAnswer(
        (_) async => Fail(Exception('Failed to load orders')),
      );

      expectLater(
        viewModel.stream,
        emitsInOrder([
          isA<OrdersLoadingState>(),
          isA<OrdersErrorState>(),
        ]),
      );

      viewModel.doIntent(LoadOrders());
    });
  });
}
