import 'package:flutter/material.dart';
import 'package:ignite_sol/index.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({Key key}) : super(key: key);

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  GenreBloc _bloc = GenreBloc();

  @override
  void initState() {
    _bloc.getGenre();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _topPadding = MediaQuery.of(context).padding.top;
    return BaseScreen(
      topViewPadding: false,
      backgroundColor: ColorPalette.secondary,
      body: Column(
        children: WidgetUtility.spreadWidgets(
          [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: _topPadding +
                            MediaQuery.of(context).size.height * 0.27,
                        child: ImageView(
                          assetName: Assets.pattern,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(14).copyWith(top: _topPadding + 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: WidgetUtility.spreadWidgets(
                            [
                              Text(
                                "Gutenberg \n"
                                "Project",
                                style: TextStyles.heading1,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "A social cataloging website that allows you to freely search its database of books,annotations, and reviews.",
                                      style: TextStyles.body,
                                      maxLines: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            interItemSpace: 12,
                            flowHorizontal: false,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            _body(),
          ],
          interItemSpace: 0,
          flowHorizontal: false,
        ),
      ),
    );
  }

  Widget _body() {
    return StreamBuilder<List<Genre>>(
      stream: _bloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.separated(
                itemCount: snapshot.data.length,
                padding: EdgeInsets.all(12),
                separatorBuilder: (context, index) {
                  return Container(
                    height: 12,
                  );
                },
                itemBuilder: (context, index) {
                  return GenreCard(
                    genre: snapshot.data[index],
                    onClick: (type) {
                      AppNavigator.navigateToBookScreen(this.context, type);
                    },
                  );
                }),
          );
        } else if (snapshot.hasError) {
          //todo: add error view
          return Container();
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
