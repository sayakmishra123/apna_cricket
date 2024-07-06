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

class AllContest {
  int contestTypeId;
  int contestTeamId;
  int tournamentMatchesID;
  int contestId;
  int numberOfPlayers;
  int levelId;
  String contestTypeName;
  String? team1Logo;
  String? team2Logo;
  String? team1Name;
  String? team2Name;
  DateTime? matchStartDate;
  DateTime? matchStartTime;
  String? tournamentName;
  int userId;
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

  AllContest({
    required this.contestTypeId,
    required this.contestTeamId,
    required this.tournamentMatchesID,
    required this.contestId,
    required this.numberOfPlayers,
    required this.levelId,
    required this.contestTypeName,
    this.team1Logo,
    this.team2Logo,
    this.team1Name,
    this.team2Name,
    this.matchStartDate,
    this.matchStartTime,
    this.tournamentName,
    required this.userId,
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

  factory AllContest.fromJson(Map<String, dynamic> json) {
    return AllContest(
      contestTypeId: json['ContestTypeId'],
      contestTeamId: json['ContestTeamId'],
      tournamentMatchesID: json['TournamentMatchesID'],
      contestId: json['ContestId'],
      numberOfPlayers: json['NumberOfPlayers'],
      levelId: json['LevelId'],
      contestTypeName: json['ContestTypeName'],
      team1Logo: json['Team1Logo'],
      team2Logo: json['Team2Logo'],
      team1Name: json['Team1Name'],
      team2Name: json['Team2Name'],
      matchStartDate: json['MatchStartDate'] != null
          ? DateTime.parse(json['MatchStartDate'])
          : null,
      matchStartTime: json['MatchStartTime'] != null
          ? DateTime.parse(json['MatchStartTime'])
          : null,
      tournamentName: json['TournamentName'],
      userId: json['UserId'],
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
      'ContestTypeId': contestTypeId,
      'ContestTeamId': contestTeamId,
      'TournamentMatchesID': tournamentMatchesID,
      'ContestId': contestId,
      'NumberOfPlayers': numberOfPlayers,
      'LevelId': levelId,
      'ContestTypeName': contestTypeName,
      'Team1Logo': team1Logo,
      'Team2Logo': team2Logo,
      'Team1Name': team1Name,
      'Team2Name': team2Name,
      'MatchStartDate': matchStartDate?.toIso8601String(),
      'MatchStartTime': matchStartTime?.toIso8601String(),
      'TournamentName': tournamentName,
      'UserId': userId,
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

class AllTournament {
  int tournamentId;
  String tournamentName;
  String? tournamentLogoPath;
  String tournamentStartDate;
  String tournamentStartTime;
  String tournamentEndDate;
  String tournamentEndTime;
  String? tournamentLastEntryDate;
  String? tournamentLastEntryTime;
  int userId;
  int contestTypeId;
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

  AllTournament({
    required this.tournamentId,
    required this.tournamentName,
    this.tournamentLogoPath,
    required this.tournamentStartDate,
    required this.tournamentStartTime,
    required this.tournamentEndDate,
    required this.tournamentEndTime,
    this.tournamentLastEntryDate,
    this.tournamentLastEntryTime,
    required this.userId,
    required this.contestTypeId,
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

  factory AllTournament.fromJson(Map<String, dynamic> json) {
    return AllTournament(
      tournamentId: json['TournamentId'],
      tournamentName: json['TournamentName'],
      tournamentLogoPath: json['TournamentLogoPath'],
      tournamentStartDate: json['TournamentStartDate'],
      tournamentStartTime: json['TournamentStartDate_Time'].toString(),
      tournamentEndDate: json['TournamentEndDate'].toString(),
      tournamentEndTime: json['TournamentEndDate_Time'],
      tournamentLastEntryDate: json['TournamentLastEntryDate']?.toString(),
      tournamentLastEntryTime: json['TournamentLastEntryDate_Time'],
      userId: json['UserId'],
      contestTypeId: json['ContestTypeId'],
      franchiseId: json['FranchiseId'],
      sortedOrder: json['SortedOrder'],
      isActive: json['IsActive'],
      isDelete: json['IsDelete'],
      createdOn: json['CreatedOn'] != null
          ? DateTime.parse(json['CreatedOn']).toString()
          : null,
      createdIP: json['CreatedIP'],
      modifiedOn: json['ModifiedOn'] != null
          ? DateTime.parse(json['ModifiedOn']).toString()
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
      'TournamentId': tournamentId,
      'TournamentName': tournamentName,
      'TournamentLogoPath': tournamentLogoPath,
      'TournamentStartDate': tournamentStartDate.toString(),
      'TournamentStartDate_Time': tournamentStartTime,
      'TournamentEndDate': tournamentEndDate.toString(),
      'TournamentEndDate_Time': tournamentEndTime,
      'TournamentLastEntryDate': tournamentLastEntryDate?.toString(),
      'TournamentLastEntryDate_Time': tournamentLastEntryTime,
      'UserId': userId,
      'ContestTypeId': contestTypeId,
      'FranchiseId': franchiseId,
      'SortedOrder': sortedOrder,
      'IsActive': isActive,
      'IsDelete': isDelete,
      'CreatedOn': createdOn?.toString(),
      'CreatedIP': createdIP,
      'ModifiedOn': modifiedOn?.toString(),
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

class SingleTournament {
  int tournamentMatchesID;
  int team1ID;
  int team2ID;
  String team1Name;
  String team2Name;
  String? team1LogoPath;
  String? team2LogoPath;
  String tournamentName;
  int matchNo;
  int tournamentId;
  int matchId;
  String matchStartTime;
  DateTime matchStartDate;
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

  SingleTournament({
    required this.tournamentMatchesID,
    required this.team1ID,
    required this.team2ID,
    required this.team1Name,
    required this.team2Name,
    this.team1LogoPath,
    this.team2LogoPath,
    required this.tournamentName,
    required this.matchNo,
    required this.tournamentId,
    required this.matchId,
    required this.matchStartTime,
    required this.matchStartDate,
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

  factory SingleTournament.fromJson(Map<String, dynamic> json) {
    return SingleTournament(
      tournamentMatchesID: json['TournamentMatchesID'],
      team1ID: json['Team1ID'],
      team2ID: json['Team2ID'],
      team1Name: json['Team1_Name'],
      team2Name: json['Team2_Name'],
      team1LogoPath: json['Team1LogoPath'],
      team2LogoPath: json['Team2LogoPath'],
      tournamentName: json['TournamentName'],
      matchNo: json['MatchNo'],
      tournamentId: json['TournamentId'],
      matchId: json['MatchId'],
      matchStartTime: json['MatchStartTime'],
      matchStartDate: DateTime.parse(json['MatchStartDate']),
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
      'TournamentMatchesID': tournamentMatchesID,
      'Team1ID': team1ID,
      'Team2ID': team2ID,
      'Team1_Name': team1Name,
      'Team2_Name': team2Name,
      'Team1LogoPath': team1LogoPath,
      'Team2LogoPath': team2LogoPath,
      'TournamentName': tournamentName,
      'MatchNo': matchNo,
      'TournamentId': tournamentId,
      'MatchId': matchId,
      'MatchStartTime': matchStartTime,
      'MatchStartDate': matchStartDate.toIso8601String(),
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

class CurrentContest {
  int contestTypeId;
  int contestTeamId;
  int tournamentMatchesID;
  int contestId;
  int numberOfPlayers;
  int levelId;
  String? contestTypeName;
  String? team1Logo;
  String? team2Logo;
  String team1Name;
  String team2Name;
  String matchStartDate;
  String matchStartTime;
  String tournamentName;
  int userId;
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

  CurrentContest({
    required this.contestTypeId,
    required this.contestTeamId,
    required this.tournamentMatchesID,
    required this.contestId,
    required this.numberOfPlayers,
    required this.levelId,
    this.contestTypeName,
    this.team1Logo,
    this.team2Logo,
    required this.team1Name,
    required this.team2Name,
    required this.matchStartDate,
    required this.matchStartTime,
    required this.tournamentName,
    required this.userId,
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

  factory CurrentContest.fromJson(Map<String, dynamic> json) {
    return CurrentContest(
      contestTypeId: json['ContestTypeId'],
      contestTeamId: json['ContestTeamId'],
      tournamentMatchesID: json['TournamentMatchesID'],
      contestId: json['ContestId'],
      numberOfPlayers: json['NumberOfPlayers'],
      levelId: json['LevelId'],
      contestTypeName: json['ContestTypeName'],
      team1Logo: json['Team1Logo'],
      team2Logo: json['Team2Logo'],
      team1Name: json['Team1Name'],
      team2Name: json['Team2Name'],
      matchStartDate: json['MatchStartDate'],
      matchStartTime: json['MatchStartTime'],
      tournamentName: json['TournamentName'],
      userId: json['UserId'],
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
      'ContestTypeId': contestTypeId,
      'ContestTeamId': contestTeamId,
      'TournamentMatchesID': tournamentMatchesID,
      'ContestId': contestId,
      'NumberOfPlayers': numberOfPlayers,
      'LevelId': levelId,
      'ContestTypeName': contestTypeName,
      'Team1Logo': team1Logo,
      'Team2Logo': team2Logo,
      'Team1Name': team1Name,
      'Team2Name': team2Name,
      'MatchStartDate': matchStartDate.toString(),
      'MatchStartTime': matchStartTime,
      'TournamentName': tournamentName,
      'UserId': userId,
      'FranchiseId': franchiseId,
      'SortedOrder': sortedOrder,
      'IsActive': isActive,
      'IsDelete': isDelete,
      'CreatedOn': createdOn?.toString(),
      'CreatedIP': createdIP,
      'ModifiedOn': modifiedOn?.toString(),
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

// contest history
class ContestHistory {
  int contestTypeId;
  int contestTeamId;
  int tournamentMatchesID;
  int contestId;
  int numberOfPlayers;
  int levelId;
  String? contestTypeName;
  String? team1Logo;
  String? team2Logo;
  String team1Name;
  String team2Name;
  String matchStartDate;
  String matchStartTime;
  String tournamentName;
  int userId;
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

  ContestHistory({
    required this.contestTypeId,
    required this.contestTeamId,
    required this.tournamentMatchesID,
    required this.contestId,
    required this.numberOfPlayers,
    required this.levelId,
    this.contestTypeName,
    this.team1Logo,
    this.team2Logo,
    required this.team1Name,
    required this.team2Name,
    required this.matchStartDate,
    required this.matchStartTime,
    required this.tournamentName,
    required this.userId,
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

  factory ContestHistory.fromJson(Map<String, dynamic> json) {
    return ContestHistory(
      contestTypeId: json['ContestTypeId'],
      contestTeamId: json['ContestTeamId'],
      tournamentMatchesID: json['TournamentMatchesID'],
      contestId: json['ContestId'],
      numberOfPlayers: json['NumberOfPlayers'],
      levelId: json['LevelId'],
      contestTypeName: json['ContestTypeName'],
      team1Logo: json['Team1Logo'],
      team2Logo: json['Team2Logo'],
      team1Name: json['Team1Name'],
      team2Name: json['Team2Name'],
      matchStartDate: json['MatchStartDate'],
      matchStartTime: json['MatchStartTime'],
      tournamentName: json['TournamentName'],
      userId: json['UserId'],
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
      'ContestTypeId': contestTypeId,
      'ContestTeamId': contestTeamId,
      'TournamentMatchesID': tournamentMatchesID,
      'ContestId': contestId,
      'NumberOfPlayers': numberOfPlayers,
      'LevelId': levelId,
      'ContestTypeName': contestTypeName,
      'Team1Logo': team1Logo,
      'Team2Logo': team2Logo,
      'Team1Name': team1Name,
      'Team2Name': team2Name,
      'MatchStartDate': matchStartDate.toString(),
      'MatchStartTime': matchStartTime,
      'TournamentName': tournamentName,
      'UserId': userId,
      'FranchiseId': franchiseId,
      'SortedOrder': sortedOrder,
      'IsActive': isActive,
      'IsDelete': isDelete,
      'CreatedOn': createdOn?.toString(),
      'CreatedIP': createdIP,
      'ModifiedOn': modifiedOn?.toString(),
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

// Change Password
class ChangepasswordModel {
  int userId;
  String? userName;
  String? userPassword;
  String? userNewPassword;
  String? userEmail;
  String? userMobileNo;
  String? address;
  String? state;
  String? country;
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

  ChangepasswordModel({
    required this.userId,
    this.userName,
    this.userPassword,
    this.userNewPassword,
    this.userEmail,
    this.userMobileNo,
    this.address,
    this.state,
    this.country,
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

  factory ChangepasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangepasswordModel(
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



