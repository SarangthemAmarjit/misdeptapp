import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.get(url, headers: headers);
  }

  Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.post(
      url,
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }

  Future<http.Response> put(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.put(
      url,
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }

  Future<http.StreamedResponse> putgallerycover({
    required String id,
    required String endpoint,
    required Uint8List imageBytes,
    required DateTime eventdate,
    required String title,
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final request = http.MultipartRequest("PUT", url);

    // Add headers if any
    if (headers != null) {
      request.headers.addAll(headers);
    }

    // Add image file as bytes
    request.files.add(
      http.MultipartFile.fromBytes(
        'imageCoverPath', // field name expected by the server
        imageBytes,
      ),
    );

    // Add other form fields
    request.fields['id'] = id;
    request.fields['title'] = title;
    request.fields['eventDate'] = eventdate.toIso8601String();

    // Send the request
    return await request.send();
  }

  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.delete(url, headers: headers);
  }
}
