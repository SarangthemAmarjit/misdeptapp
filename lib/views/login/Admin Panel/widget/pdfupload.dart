import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class PdfUploadWidget extends StatefulWidget {
  const PdfUploadWidget({Key? key}) : super(key: key);

  @override
  _PdfUploadWidgetState createState() => _PdfUploadWidgetState();
}

class _PdfUploadWidgetState extends State<PdfUploadWidget> {
  PlatformFile? _pickedFile;
  bool _isLoading = false;
  String? _error;

  Future<void> _pickFile() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'],
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) return;

      final file = result.files.first;
      final allowedExtensions = [
        'pdf',
        'jpg',
        'jpeg',
        'png',
        'gif',
        'bmp',
        'webp',
      ];
      if (!allowedExtensions.contains(file.extension?.toLowerCase())) {
        throw 'Only PDF and image files are allowed';
      }

      setState(() => _pickedFile = file);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _removeFile() {
    setState(() {
      _pickedFile = null;
    });
  }

  // ...existing imports...

  Widget _buildFilePreview(BuildContext context) {
    if (_pickedFile == null) return const SizedBox.shrink();

    final ext = _pickedFile!.extension?.toLowerCase();
    final isImage = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(ext);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          if (isImage)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(6),
              ),
              child:
                  _pickedFile!.path != null
                      ? (kIsWeb
                          ? Image.memory(_pickedFile!.bytes!, fit: BoxFit.cover)
                          : Image.file(
                            File(_pickedFile!.path!),
                            fit: BoxFit.cover,
                          ))
                      : const Icon(Icons.image, color: Colors.blue, size: 32),
            )
          else
            const Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _pickedFile!.name,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${(_pickedFile!.size / 1024).toStringAsFixed(2)} KB',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.preview),
            onPressed: () => OpenFile.open(_pickedFile!.path),
          ),
          IconButton(icon: const Icon(Icons.delete), onPressed: _removeFile),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upload Button
        ElevatedButton.icon(
          icon: const Icon(Icons.file_upload_outlined),
          onPressed: _isLoading ? null : _pickFile,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.grey),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          ),
          label:
              _isLoading
                  ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                  : const Text('Select PDF or Image File'),
        ),

        // Error Message
        if (_error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(_error!, style: TextStyle(color: Colors.red[700])),
          ),

        // File Preview
        _buildFilePreview(context),
      ],
    );
  }
}
