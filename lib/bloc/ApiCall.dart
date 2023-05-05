import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'ApiCallState.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(MyInitialState());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    if (event is MyApiCallEvent) {
      yield MyLoadingState();
      try {
        final response = await http.get(Uri.parse('https://stoic-quotes.com/api/quote'));
        if (response.statusCode == 200) {
          yield MySuccessState(response.body);
        } else {
          yield MyErrorState('Failed to load data');
        }
      } catch (e) {
        yield MyErrorState('Failed to connect to the server');
      }
    }
  }
}