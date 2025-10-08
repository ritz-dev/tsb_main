import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  final String locale;

  const LanguageState({required this.locale});

  @override
  List<Object> get props => [locale];
}

