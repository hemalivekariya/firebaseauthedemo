import 'package:firebaseauthedemo/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

import '../firebaseStreamService.dart';

class UserStream {
  final _userSink = PublishSubject<UserModel>();

  Stream get userStream => _userSink.stream;

  getAllUser() async {
    try {
      var user = await FireBaseStreamService.getUserData();
      _userSink.add(user);
      print("************** $user");
    } catch (e) {
      print(e);
    }
  }

  dispose() {
    _userSink.close();
  }

}
