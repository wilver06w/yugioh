import 'package:yugioh/app/utils/yugioh_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  static Future<void> launchInBrowser({required String url}) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  static String? textMothDay({required int moth, required int day}) {
    return '$day ${YuGiOhUiValues.of} ${moths[moth - 1]}';
  }

  static List<String> moths = [
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre",
  ];
}
