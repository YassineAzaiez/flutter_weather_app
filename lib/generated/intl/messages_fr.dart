// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_new_city": MessageLookupByLibrary.simpleMessage("Ajouter ville"),
        "city_latitude":
            MessageLookupByLibrary.simpleMessage("Latitude de la ville"),
        "city_longitude":
            MessageLookupByLibrary.simpleMessage("Longitude de la ville"),
        "city_name": MessageLookupByLibrary.simpleMessage("Nom de Ville"),
        "weather_add_new_city_title":
            MessageLookupByLibrary.simpleMessage("Ajouter/afficher des villes"),
        "weather_details": MessageLookupByLibrary.simpleMessage("Détails météo")
      };
}
