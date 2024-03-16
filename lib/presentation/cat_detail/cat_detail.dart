import 'package:flutter/material.dart';
import 'package:gatitapp/domain/entities/cats.dart';
import 'package:go_router/go_router.dart';

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({
    super.key,
    required this.catData,
  });

  static const routeName = 'catDetail';

  final Cat catData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(catData.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: size.height * 0.6,
                width: size.width * 0.95,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Image.network(
                  height: size.height * 0.4,
                  width: size.width * 0.8,
                  fit: BoxFit.fill,
                  catData.imageUrl,
                  errorBuilder: (context, _, stackTrace) {
                    return const SizedBox(
                      height: 190,
                      width: 180,
                      child: Icon(Icons.catching_pokemon),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Divider(color: Theme.of(context).colorScheme.inversePrimary,),
            Flexible(
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(catData.description, style: const TextStyle(fontSize: 18),),
                        Divider(color: Theme.of(context).colorScheme.inversePrimary,),
                        Text("Origen: ${catData.origin}", style: const TextStyle(fontSize: 18),),
                        Text("Life Span: ${catData.lifeSpan}", style: const TextStyle(fontSize: 18),),
                        Text("Adaptability: ${catData.adaptability}", style: const TextStyle(fontSize: 18),),
                        Text("Intelligence: ${catData.intelligence}", style: const TextStyle(fontSize: 18),),
                        Text("affection Level: ${catData.affectionLevel}" , style: const TextStyle(fontSize: 18),),
                        Divider(color: Theme.of(context).colorScheme.inversePrimary,),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
