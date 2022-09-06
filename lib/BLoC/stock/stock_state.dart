abstract class StockState {}

class LoadingData extends StockState {}

class DataLoaded extends StockState {
  final Map<String, dynamic> overView;
  final List<dynamic> perfStats;

  DataLoaded(this.overView, this.perfStats);
}

class LoadingFailed extends StockState {}
