// Тестовый запрос с использованием http
import 'package:http/http.dart' as http;

void main() {
  fetchPokemonData();
}

void fetchPokemonData() async {
  var url = 'https://pokeapi.co/api/v2/pokemon/1';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Ошибка запроса: ${response.statusCode}');
  }
}