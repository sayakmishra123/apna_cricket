class User {
  int userId;
  String userName;
  String? userPassword;
  String? userNewPassword;
  String userEmail;
  String userMobileNo;
  String address;
  String state;
  String country;
  String? pincode;
  String? reference;
  String? deviceId;
  int points;
  int franchiseId;
  int sortedOrder;
  bool isActive;
  bool isDelete;
  String? createdOn;
  String? createdIP;
  String? modifiedOn;
  String? modifiedIP;
  String? createdBy;
  String? modifiedBy;
  String? output;
  String? output1;
  String? output2;
  String? output3;
  int mode;

  User({
    required this.userId,
    required this.userName,
    this.userPassword,
    this.userNewPassword,
    required this.userEmail,
    required this.userMobileNo,
    required this.address,
    required this.state,
    required this.country,
    this.pincode,
    this.reference,
    this.deviceId,
    required this.points,
    required this.franchiseId,
    required this.sortedOrder,
    required this.isActive,
    required this.isDelete,
    this.createdOn,
    this.createdIP,
    this.modifiedOn,
    this.modifiedIP,
    this.createdBy,
    this.modifiedBy,
    this.output,
    this.output1,
    this.output2,
    this.output3,
    required this.mode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['UserId'],
      userName: json['UserName'],
      userPassword: json['UserPassword'],
      userNewPassword: json['UserNewPassword'],
      userEmail: json['UserEmail'],
      userMobileNo: json['UserMobileNo'],
      address: json['Address'],
      state: json['State'],
      country: json['Country'],
      pincode: json['Pincode'],
      reference: json['Referance'],
      deviceId: json['DeviceId'],
      points: json['Points'],
      franchiseId: json['FranchiseId'],
      sortedOrder: json['SortedOrder'],
      isActive: json['IsActive'],
      isDelete: json['IsDelete'],
      createdOn: json['CreatedOn'],
      createdIP: json['CreatedIP'],
      modifiedOn: json['ModifiedOn'],
      modifiedIP: json['ModifiedIP'],
      createdBy: json['CreatedBy'],
      modifiedBy: json['ModifiedBy'],
      output: json['Output'],
      output1: json['Output1'],
      output2: json['Output2'],
      output3: json['Output3'],
      mode: json['mode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'UserName': userName,
      'UserPassword': userPassword,
      'UserNewPassword': userNewPassword,
      'UserEmail': userEmail,
      'UserMobileNo': userMobileNo,
      'Address': address,
      'State': state,
      'Country': country,
      'Pincode': pincode,
      'Referance': reference,
      'DeviceId': deviceId,
      'Points': points,
      'FranchiseId': franchiseId,
      'SortedOrder': sortedOrder,
      'IsActive': isActive,
      'IsDelete': isDelete,
      'CreatedOn': createdOn,
      'CreatedIP': createdIP,
      'ModifiedOn': modifiedOn,
      'ModifiedIP': modifiedIP,
      'CreatedBy': createdBy,
      'ModifiedBy': modifiedBy,
      'Output': output,
      'Output1': output1,
      'Output2': output2,
      'Output3': output3,
      'mode': mode,
    };
  }
}

class Player {
  int playerID;
  int tournamentId;
  int team2Id;
  int team1Id;
  int contestId;
  int userId;
  int points;
  int runs;
  int catchCount;
  int wicket;
  int boundaries;
  int sixes;
  String playerName;
  int teamId;
  String teamName;
  int playerTypeId;
  String? playerImagePath;
  int franchiseId;
  int sortedOrder;
  bool isActive;
  bool isDelete;
  DateTime? createdOn;
  String? createdIP;
  DateTime? modifiedOn;
  String? modifiedIP;
  String? createdBy;
  String? modifiedBy;
  String? output;
  String? output1;
  String? output2;
  String? output3;
  int mode;

  Player({
    required this.playerID,
    required this.tournamentId,
    required this.team2Id,
    required this.team1Id,
    required this.contestId,
    required this.userId,
    required this.points,
    required this.runs,
    required this.catchCount,
    required this.wicket,
    required this.boundaries,
    required this.sixes,
    required this.playerName,
    required this.teamId,
    required this.teamName,
    required this.playerTypeId,
    this.playerImagePath,
    required this.franchiseId,
    required this.sortedOrder,
    required this.isActive,
    required this.isDelete,
    this.createdOn,
    this.createdIP,
    this.modifiedOn,
    this.modifiedIP,
    this.createdBy,
    this.modifiedBy,
    this.output,
    this.output1,
    this.output2,
    this.output3,
    required this.mode,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerID: json['PlayerID'],
      tournamentId: json['TournamentId'],
      team2Id: json['Team2Id'],
      team1Id: json['Team1Id'],
      contestId: json['ContestId'],
      userId: json['UserId'],
      points: json['Points'],
      runs: json['Runs'],
      catchCount: json['Catch'],
      wicket: json['Wicket'],
      boundaries: json['Boundaries'],
      sixes: json['Sixes'],
      playerName: json['PlayerName'],
      teamId: json['TeamId'],
      teamName: json['TeamName'],
      playerTypeId: json['PlayerTypeId'],
      playerImagePath: json['PlayerImagePath'],
      franchiseId: json['FranchiseId'],
      sortedOrder: json['SortedOrder'],
      isActive: json['IsActive'],
      isDelete: json['IsDelete'],
      createdOn:
          json['CreatedOn'] != null ? DateTime.parse(json['CreatedOn']) : null,
      createdIP: json['CreatedIP'],
      modifiedOn: json['ModifiedOn'] != null
          ? DateTime.parse(json['ModifiedOn'])
          : null,
      modifiedIP: json['ModifiedIP'],
      createdBy: json['CreatedBy'],
      modifiedBy: json['ModifiedBy'],
      output: json['Output'],
      output1: json['Output1'],
      output2: json['Output2'],
      output3: json['Output3'],
      mode: json['mode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PlayerID': playerID,
      'TournamentId': tournamentId,
      'Team2Id': team2Id,
      'Team1Id': team1Id,
      'ContestId': contestId,
      'UserId': userId,
      'Points': points,
      'Runs': runs,
      'Catch': catchCount,
      'Wicket': wicket,
      'Boundaries': boundaries,
      'Sixes': sixes,
      'PlayerName': playerName,
      'TeamId': teamId,
      'TeamName': teamName,
      'PlayerTypeId': playerTypeId,
      'PlayerImagePath': playerImagePath,
      'FranchiseId': franchiseId,
      'SortedOrder': sortedOrder,
      'IsActive': isActive,
      'IsDelete': isDelete,
      'CreatedOn': createdOn?.toIso8601String(),
      'CreatedIP': createdIP,
      'ModifiedOn': modifiedOn?.toIso8601String(),
      'ModifiedIP': modifiedIP,
      'CreatedBy': createdBy,
      'ModifiedBy': modifiedBy,
      'Output': output,
      'Output1': output1,
      'Output2': output2,
      'Output3': output3,
      'mode': mode,
    };
  }
}
