import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatitapp/design/widgets/cat_card.dart';
import 'package:gatitapp/design/widgets/loading.dart';
import 'package:gatitapp/injection_container.dart';
import 'package:gatitapp/presentation/cat_list/cubit/cats_cubit.dart';
import 'package:gatitapp/presentation/cat_list/cubit/cats_status.dart';
import 'package:go_router/go_router.dart';

class CatList extends StatelessWidget {
  const CatList({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gatitap', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) {
          final cubit = serviceLocator<CatsCubit>();
          Future.microtask(() => cubit.fetchData());
          return cubit;
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<CatsCubit, CatsState>(
              listenWhen: (_, current) => current.status == CatsStatus.loading,
              listener: (context, state) => const Loading().show(context),
            ),
            BlocListener<CatsCubit, CatsState>(
              listenWhen: (previous, _) =>
                  previous.status == CatsStatus.loading,
              listener: (context, state) => context.pop(),
            ),
            BlocListener<CatsCubit, CatsState>(
              listenWhen: (previous, current) =>
                  previous.status != CatsStatus.error &&
                  current.status == CatsStatus.error,
              listener: (context, state) {
                final snackBar = SnackBar(
                  content: Text(
                    state.errorMessage ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.error,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
          child: BlocBuilder<CatsCubit, CatsState>(
            buildWhen: (previous, current) =>
                previous.status != CatsStatus.loaded &&
                current.status == CatsStatus.loaded,
            builder: (context, state) {
              return state.cats != null
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const TextField(
                            decoration:
                                InputDecoration(prefixIcon: Icon(Icons.search)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Flexible(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.cats?.length ?? 0,
                              itemBuilder: (context, index) {
                                final item = state.cats![index];
                                return CatCard(data: item);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
