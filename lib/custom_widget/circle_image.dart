import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  String? imageUrl;

  CircleImage({Key? key, required this.imageUrl}) : super(key: key);

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl ??
            'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVzaW5lc3MlMjBuZXdzfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        imageBuilder: (context, imageProvider) {
          return _imageWidget(imageProvider);
        },
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
        errorWidget: (context, url, error) =>
            _imageWidget(const AssetImage('assets/images/news.jpeg')));
  }
}
/*return CachedNetworkImage(
      imageUrl: imageUrl == null ? '' : imageUrl!,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => _imageWidget(
        AssetImage(
          'assets/images/news01.png',
        ),
      ),
    );*/
