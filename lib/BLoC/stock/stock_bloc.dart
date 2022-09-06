import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/BLoC/stock/stock_event.dart';
import 'package:stock_app/BLoC/stock/stock_state.dart';
import 'package:stock_app/data/overview_remote_data_provider.dart';
import 'package:stock_app/data/performance_remote_data_provider.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final OverviewRemoteDataProvider overviewRemoteDataProvider;
  final PerformanceRemoteDataProvider performanceRemoteDataProvider;
  StockBloc(
      {required this.overviewRemoteDataProvider,
      required this.performanceRemoteDataProvider})
      : super(LoadingData()) {
    on<LoadData>(_loadData);
  }

  void _loadData(LoadData event, Emitter emit) async {
    emit(LoadingData());

    try {
      final overview = await overviewRemoteDataProvider.getOverview();
      // print(overview);
      final perfStats =
          await performanceRemoteDataProvider.getPerformanceStats();
      // print(perfStats);

      emit(DataLoaded(overview, perfStats));
    } catch (ex) {
      print(ex);
      emit(LoadingFailed());
    }
  }
}
