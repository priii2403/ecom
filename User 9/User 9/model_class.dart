class AlbumData {
  Null? userData;
  List<GetRoleListResponses>? getRoleListResponses;
  bool? flgIsSuccess;
  String? stMessage;

  AlbumData(
      {this.userData,
      this.getRoleListResponses,
      this.flgIsSuccess,
      this.stMessage});

  AlbumData.fromJson(Map<String, dynamic> json) {
    userData = json['userData'];
    if (json['getRoleListResponses'] != null) {
      getRoleListResponses = <GetRoleListResponses>[];
      json['getRoleListResponses'].forEach((v) {
        getRoleListResponses!.add(new GetRoleListResponses.fromJson(v));
      });
    }
    flgIsSuccess = json['flgIsSuccess'];
    stMessage = json['stMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userData'] = this.userData;
    if (this.getRoleListResponses != null) {
      data['getRoleListResponses'] =
          this.getRoleListResponses!.map((v) => v.toJson()).toList();
    }
    data['flgIsSuccess'] = this.flgIsSuccess;
    data['stMessage'] = this.stMessage;
    return data;
  }
}

class GetRoleListResponses {
  String? unRoleId;
  String? stRoleName;
  bool? flgIsSuccess;
  String? stMessage;

  GetRoleListResponses(
      {this.unRoleId, this.stRoleName, this.flgIsSuccess, this.stMessage});

  GetRoleListResponses.fromJson(Map<String, dynamic> json) {
    unRoleId = json['unRoleId'];
    stRoleName = json['stRoleName'];
    flgIsSuccess = json['flgIsSuccess'];
    stMessage = json['stMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unRoleId'] = this.unRoleId;
    data['stRoleName'] = this.stRoleName;
    data['flgIsSuccess'] = this.flgIsSuccess;
    data['stMessage'] = this.stMessage;
    return data;
  }
}
