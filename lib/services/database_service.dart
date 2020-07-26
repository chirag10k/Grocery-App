import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groceryshop/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DatabaseService{

  User user;
  DatabaseService({this.user});

  static final Firestore _firestore = Firestore.instance;
  SharedPreferences prefs;

  //Users Collection reference
  final CollectionReference userCollection = _firestore.collection('users');

  //map user snapshot to user data
  User userDataFromSnapshot(DocumentSnapshot snapshot){
    return User(
      uid: snapshot.data['uid'],
      nickname: snapshot.data['nickname'],
      photoUrl: snapshot.data['photoUrl'],
      email: snapshot.data['email'],
    );
  }

  //get user data stream from firebase
  Stream<User> get userData {
    return _firestore.collection('users').document(user.uid).snapshots()
        .map(userDataFromSnapshot);
  }

  //Write data to firestore server for new user
  Future setUserData() async{
    return await userCollection.document(user.uid).setData({
      'uid': user.uid,
      'nickname': user.nickname,
      'email': user.email,
      'photoUrl': user.photoUrl,
    });
  }

//  //Update Profile data to server
//  Future updateBudgetData() async{
//    user.tExpenseAmount = 0;
//    user.tIncomeAmount = 0;
//    user.balance = 0;
//    return await userCollection.document(user.uid).updateData({
//      'budgetCycle': user.budgetCycle,
//      'totalIncomeAmount': user.tIncomeAmount,
//      'totalExpenseAmount': user.tExpenseAmount,
//      'balance': user.balance,
//    });
//  }


}