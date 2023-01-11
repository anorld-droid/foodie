import 'package:trice/model/tasks.dart';

var tasks = TaskModel(filters: [
  'Filter1',
  'Filter2',
  'Filter3',
  'Filter4',
  'Filter5',
  'Filter6',
  'Filter7',
], tasks: {
  'Oct 22, Sunday': [
    TaskItem(time: '7:30pm', text: 'Lorem ipsum dolor sit amet.', done: false),
    TaskItem(
        time: '8:30am',
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A, magna dignissim massa sed etiam felis amet, ultrices. ',
        done: true)
  ],
  'Oct 23, Monday': [
    TaskItem(
        time: '9:30am',
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A, magna dignissim massa sed etiam felis amet, ultrices. ',
        done: false),
    TaskItem(
        time: '8:30am',
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. A, magna dignissim massa sed etiam felis amet, ultrices. ',
        done: false)
  ],
});
