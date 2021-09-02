import 'package:ignite_sol/index.dart';
import 'package:rxdart/rxdart.dart';

class GenreBloc {
  final GenreRepository _repository = GenreRepositoryImpl();
  final BehaviorSubject<List<Genre>> _subject = BehaviorSubject<List<Genre>>();

  getGenre() async {
    try {
      List<Genre> response = await _repository.fetchGenre();
      _subject.sink.add(response);
    } catch (e) {
      _subject.sink.addError(e);
    }
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<Genre>> get subject => _subject;
}
