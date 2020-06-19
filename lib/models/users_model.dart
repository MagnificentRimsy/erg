// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        this.statusCode,
        this.message,
        this.success,
        this.userName,
        this.userDetail,
    });

    int statusCode;
    String message;
    bool success;
    String userName;
    UserDetail userDetail;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        statusCode: json["StatusCode"],
        message: json["Message"],
        success: json["Success"],
        userName: json["UserName"],
        userDetail: UserDetail.fromJson(json["UserDetail"]),
    );

    Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Message": message,
        "Success": success,
        "UserName": userName,
        "UserDetail": userDetail.toJson(),
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
    });

    String title;
    String firstName;
    String middleName;
    String lastName;
    String email;
    String userType;
    String designation;
    String organization;

    factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        title: json["Title"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        email: json["Email"],
        userType: json["UserType"],
        designation: json["Designation"],
        organization: json["Organization"],
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
    };
}
