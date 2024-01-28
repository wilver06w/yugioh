import 'package:yugioh/app/models/archetype.dart';
import 'package:yugioh/app/models/list_yugioh.dart';
import 'package:yugioh/app/utils/http/http_client.dart';

class Repository {
  Repository({
    required this.yuGiOhHttpClient,
  });
  final YuGiOhHttpClient yuGiOhHttpClient;

  final listYuGiOh = '/api/v7/cardinfo.php';
  final archetypes = '/api/v7/archetypes.php';

  Future<List<Archetype>> getArchetypes() async {
    final response = await yuGiOhHttpClient.msDio.get(
      archetypes,
    );

    final List<dynamic> rawListData = response.data as List<dynamic>;

    final list = rawListData.map((p) => Archetype.fromJson(p)).toList();

    return list;
  }

  Future<List<YuGiOh>> getListYugiOhByArchetype(String archetype) async {
    final response = await yuGiOhHttpClient.msDio.get(
      listYuGiOh,
      queryParameters: {
        'archetype': archetype,
      },
    );

    final List<dynamic> rawListData = response.data['data'] as List<dynamic>;

    final list = rawListData.map((p) => YuGiOh.fromJson(p)).toList();

    return list;
  }
}
