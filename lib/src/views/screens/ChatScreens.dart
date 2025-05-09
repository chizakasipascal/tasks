import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task/src/Models/Character.dart';
import 'package:theme/theme.dart';

import '../widgets/BodyEditingModalSheet.dart';
import '../widgets/BodyModalSheet.dart';
import '../widgets/InputAddTasks.dart';
import '../widgets/TaskItems.dart';

class ChatScreens extends StatefulWidget {
  const ChatScreens({
    super.key,
  });

  @override
  State<ChatScreens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  final scrollController = ScrollController();
  double itemSize = 150.0;
  bool expanded = false;
  void onListen() {
    debugPrint("Scroller listner${scrollController.offset}");
    setState(() {});
  }

  void _onScrollDiretion() {
    debugPrint(
        "Scroll durection ${scrollController.position.userScrollDirection}");

    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        expanded = false;
      });
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        expanded = true;
      });
    }
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: Scaffold(
        floatingActionButton: InputAddTasks(
          size: size,
          expanded: expanded,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.9,
                  child: BodyModalSheet(),
                );
              },
            );
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              _onScrollDiretion();
              return true;
            },
            child: // wrap this code with Bloc provider to access the bloc
                // BlocProvider(
                //   create: (context) => ChatBloc(),
                //   child:
                // ),
                // BlocBuilder<ChatBloc, ChatState>(
                //   builder: (context, state) {
                //     if (state is ChatLoading) {
                //       return const Center(child: CircularProgressIndicator());
                //     } else if (state is ChatLoaded) {
                //       final characters = state.characters;
                //       return _buildChatList(characters);
                //     } else if (state is ChatError) {
                //       return Center(child: Text('Error: ${state.message}'));
                //     }
                //     return const Center(child: Text('No data available'));
                //   },
                // ),

                CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverFloatingHeader(
                    child: Text(
                  "Chat",
                  style: AppTypography().extraLarge,
                )),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final charter = characters[index];
                      final itemPosition0ffset = index * itemSize / 2;
                      final difference =
                          scrollController.offset - itemPosition0ffset;
                      final percent = 1 - (difference / (itemSize / 2));

                      double opacity = percent;
                      double scale = percent;
                      if (opacity > 1.0) opacity = 1.0;
                      if (opacity < 0.0) opacity = 0.0;
                      if (percent > 1.0) scale = 1.0;

                      return TaskItems(
                        opacity: opacity,
                        scale: scale,
                        itemSize: itemSize,
                        charter: charter,
                        onTap: () {
                          debugPrint("Tapped on ${charter.text}");

                          showModalBottomSheet(
                            context: context,
                            backgroundColor:
                                AppColors.backgroundModaleSheetColors,
                            isScrollControlled: true,
                            builder: (context) {
                              return FractionallySizedBox(
                                heightFactor: 0.9,
                                child: BodyEditingModalSheet(),
                              );
                            },
                          );
                        },
                      );
                    },
                    childCount: characters.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
