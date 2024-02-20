import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppLoader extends StatelessWidget {
  final LoaderType type;
  const AppLoader({super.key, this.type = LoaderType.circular});

  @override
  Widget build(BuildContext context) {
    return type == LoaderType.list
        ? _buildListLoader()
        : const CircularProgressIndicator();
  }
}

Widget _buildListLoader() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 48,
            height: 48,
            color: Colors.white,
          ),
          title: Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
          subtitle: Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
        );
      },
    ),
  );
}

enum LoaderType {
  list,
  dialog,
  circular,
}
