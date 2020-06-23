// To parse this JSON data, do
//
//     final userinfo = userinfoFromJson(jsonString);

import 'dart:convert';

Userinfo userinfoFromJson(String str) => Userinfo.fromJson(json.decode(str));

String userinfoToJson(Userinfo data) => json.encode(data.toJson());

class Userinfo {
    Userinfo({
        this.statusCode,
        this.message,
        this.success,
        this.userName,
        this.roles,
        this.userDetail,
        this.anchors,
        this.userId,
    });

    int statusCode;
    String message;
    bool success;
    String userName;
    List<Role> roles;
    UserDetail userDetail;
    List<Anchor> anchors;
    String userId;

    factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
        statusCode: json["StatusCode"],
        message: json["Message"],
        success: json["Success"],
        userName: json["UserName"],
        roles: List<Role>.from(json["Roles"].map((x) => Role.fromJson(x))),
        userDetail: UserDetail.fromJson(json["UserDetail"]),
        anchors: List<Anchor>.from(json["Anchors"].map((x) => Anchor.fromJson(x))),
        userId: json["UserId"],
    );

    Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Message": message,
        "Success": success,
        "UserName": userName,
        "Roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "UserDetail": userDetail.toJson(),
        "Anchors": List<dynamic>.from(anchors.map((x) => x.toJson())),
        "UserId": userId,
    };
}

class Anchor {
    Anchor({
        this.oid,
        this.name,
        this.acronym,
        this.distributionCentres,
    });

    int oid;
    String name;
    String acronym;
    List<DistributionCentre> distributionCentres;

    factory Anchor.fromJson(Map<String, dynamic> json) => Anchor(
        oid: json["Oid"],
        name: json["Name"],
        acronym: json["Acronym"],
        distributionCentres: List<DistributionCentre>.from(json["DistributionCentres"].map((x) => DistributionCentre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Oid": oid,
        "Name": name,
        "Acronym": acronym,
        "DistributionCentres": List<dynamic>.from(distributionCentres.map((x) => x.toJson())),
    };
}

class DistributionCentre {
    DistributionCentre({
        this.oid,
        this.name,
        this.address,
    });

    int oid;
    String name;
    String address;

    factory DistributionCentre.fromJson(Map<String, dynamic> json) => DistributionCentre(
        oid: json["Oid"],
        name: json["Name"],
        address: json["Address"],
    );

    Map<String, dynamic> toJson() => {
        "Oid": oid,
        "Name": name,
        "Address": address,
    };
}

class Role {
    Role({
        this.name,
        this.isAdministrative,
        this.canEditModel,
        this.permissionPolicy,
        this.oid,
    });

    String name;
    bool isAdministrative;
    bool canEditModel;
    int permissionPolicy;
    String oid;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        name: json["Name"],
        isAdministrative: json["IsAdministrative"],
        canEditModel: json["CanEditModel"],
        permissionPolicy: json["PermissionPolicy"],
        oid: json["Oid"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "IsAdministrative": isAdministrative,
        "CanEditModel": canEditModel,
        "PermissionPolicy": permissionPolicy,
        "Oid": oid,
    };
}

class UserDetail {
    UserDetail({
        this.title,
        this.firstName,
        this.middleName,
        this.lastName,
        this.email,
        this.userType,
        this.designation,
        this.organization,
        this.state,
        this.localGovernment,
    });

    String title;
    String firstName;
    dynamic middleName;
    String lastName;
    String email;
    String userType;
    String designation;
    String organization;
    String state;
    String localGovernment;

    factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        title: json["Title"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        email: json["Email"],
        userType: json["UserType"],
        designation: json["Designation"],
        organization: json["Organization"],
        state: json["State"],
        localGovernment: json["LocalGovernment"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "Email": email,
        "UserType": userType,
        "Designation": designation,
        "Organization": organization,
        "State": state,
        "LocalGovernment": localGovernment,
    };
}
