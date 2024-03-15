import 'package:flutter/material.dart';
import 'package:gatitapp/domain/entities/cats.dart';
import 'package:gatitapp/presentation/cat_detail/cat_detail.dart';
import 'package:go_router/go_router.dart';

class CatCard extends StatelessWidget {
  const CatCard({
    super.key,
    required this.data,
  });

  final Cat data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        context.pushNamed(
          CatDetailPage.routeName,
          extra: data,
        );
      },
      child: Container(
        width: size.width * 0.85,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: data.imageUrl,
              height: size.height,
              width: double.infinity,
              imageErrorBuilder: (context, _, stackTrace) {
                return Image.asset(
                  'assets/not_found.jpg',
                  height: size.height,
                  width: double.infinity,
                );
              },
            ),
            Positioned(
              bottom: 7,
              child: Container(
                width: size.width * 0.96,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                  color: Colors.black38,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Origin: ${data.origin}   Intelligence: ${data.intelligence}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
