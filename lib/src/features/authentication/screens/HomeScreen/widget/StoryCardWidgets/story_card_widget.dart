import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:talkify_chat_application/helpers.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';
import 'package:talkify_chat_application/src/features/authentication/models/story_data.dart';
import 'package:talkify_chat_application/src/features/authentication/screens/HomeScreen/widget/avatar.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 6),
              child: Text(
                'Stories',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: textFaded,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final faker = Faker();
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 60,
                      child: StoryCard(
                        storyData: StoryData(
                          name: faker.person.name(),
                          url: Helpers.randomPictureUrl(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}