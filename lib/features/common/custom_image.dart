import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CustomImage extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;

  const CustomImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  late Future<ImageProvider> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = _fetchImage(widget.url);
  }

  Future<ImageProvider> _fetchImage(String url) async {
    await GetIt.instance.isReady<Dio>();
    final Dio _dio = GetIt.instance<Dio>();
    try {
      final response = await _dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      return MemoryImage(Uint8List.fromList(response.data!));
    } catch (e) {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: FutureBuilder<ImageProvider>(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Icon(Icons.error));
          } else if (snapshot.hasData) {
            return Image(
              image: snapshot.data!,
              fit: BoxFit.cover,
            );
          } else {
            return const Center(child: Icon(Icons.error));
          }
        },
      ),
    );
  }
}
