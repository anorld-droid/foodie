import 'package:trice/model/events/event.dart';
import 'package:trice/model/news/news_post.dart';

final imageUrls = [
  'https://images.unsplash.com/photo-1523580494863-6f3031224c94?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZXZlbnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1531058020387-3be344556be6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZXZlbnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1549451371-64aa98a6f660?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZXZlbnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1478147427282-58a87a120781?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZXZlbnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1530023367847-a683933f4172?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGV2ZW50c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
];

var events = [
  EventModel(
      metadata: Metadata(
          PostAuthor('Trice Inc.',
              'https://images.unsplash.com/photo-1487017159836-4e23ece2e4cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80'),
          'Oct 22, Sun',
          4),
      imageUrls: imageUrls,
      commentsLength: '120k',
      likesLength: '156M',
      likes: [],
      comments: [],
      rating: '4+',
      attendees: '23k',
      description:
          'Signing up is not mandatory for our users to use the Rock Identifier app. Once you successfully download and open Rock Identifier, our system will assign a unique secure account for you to use on your current device. You can access everything with this account. No user-created account is required even if you upgrade to Rock Identifier Premium. However, we do recommend signing up with email to keep your data safe if you lose or change your device.'),
  EventModel(
      metadata: Metadata(
          PostAuthor('TMwangaza',
              'https://images.unsplash.com/photo-1487017159836-4e23ece2e4cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80'),
          'Oct 22, Sun',
          4),
      imageUrls: imageUrls,
      commentsLength: '120k',
      likesLength: '156M',
      likes: [],
      comments: [],
      rating: '4+',
      attendees: '23k',
      description:
          'Signing up is not mandatory for our users to use the Rock Identifier app. Once you successfully download and open Rock Identifier, our system will assign a unique secure account for you to use on your current device. You can access everything with this account. No user-created account is required even if you upgrade to Rock Identifier Premium. However, we do recommend signing up with email to keep your data safe if you lose or change your device.')
];
