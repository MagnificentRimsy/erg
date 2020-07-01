// To parse this JSON data, do
//
//     final checkInventoryStatus = checkInventoryStatusFromJson(jsonString);

import 'dart:convert';

CheckInventoryStatus checkInventoryStatusFromJson(String str) => CheckInventoryStatus.fromJson(json.decode(str));

String checkInventoryStatusToJson(CheckInventoryStatus data) => json.encode(data.toJson());

class CheckInventoryStatus {
    CheckInventoryStatus({
        this.statusCode,
        this.message,
        this.success,
        this.stock,
    });

    int statusCode;
    String message;
    bool success;
    Stock stock;

    factory CheckInventoryStatus.fromJson(Map<String, dynamic> json) => CheckInventoryStatus(
        statusCode: json["StatusCode"],
        message: json["Message"],
        success: json["Success"],
        stock: Stock.fromJson(json["Stock"]),
    );

    Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Message": message,
        "Success": success,
        "Stock": stock.toJson(),
    };
}

class Stock {
    Stock({
        this.oid,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.season,
        this.seasonTitle,
        this.anchor,
        this.anchorName,
        this.anchorAcronym,
        this.distributionCentre,
        this.distributionCentreName,
        this.agent,
        this.stateCoordinator,
        this.stockDate,
        this.transId,
        this.stateCoordinatorId,
        this.agentId,
        this.userId,
        this.stockItems,
    });

    int oid;
    String createdBy;
    DateTime createdOn;
    dynamic modifiedBy;
    dynamic modifiedOn;
    dynamic season;
    dynamic seasonTitle;
    int anchor;
    dynamic anchorName;
    dynamic anchorAcronym;
    int distributionCentre;
    dynamic distributionCentreName;
    String agent;
    String stateCoordinator;
    DateTime stockDate;
    String transId;
    String stateCoordinatorId;
    String agentId;
    String userId;
    List<dynamic> stockItems;

    factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        oid: json["Oid"],
        createdBy: json["CreatedBy"],
        createdOn: DateTime.parse(json["CreatedOn"]),
        modifiedBy: json["ModifiedBy"],
        modifiedOn: json["ModifiedOn"],
        season: json["Season"],
        seasonTitle: json["SeasonTitle"],
        anchor: json["Anchor"],
        anchorName: json["AnchorName"],
        anchorAcronym: json["AnchorAcronym"],
        distributionCentre: json["DistributionCentre"],
        distributionCentreName: json["DistributionCentreName"],
        agent: json["Agent"],
        stateCoordinator: json["StateCoordinator"],
        stockDate: DateTime.parse(json["StockDate"]),
        transId: json["TransId"],
        stateCoordinatorId: json["StateCoordinatorId"],
        agentId: json["AgentId"],
        userId: json["UserId"],
        stockItems: List<dynamic>.from(json["StockItems"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Oid": oid,
        "CreatedBy": createdBy,
        "CreatedOn": createdOn.toIso8601String(),
        "ModifiedBy": modifiedBy,
        "ModifiedOn": modifiedOn,
        "Season": season,
        "SeasonTitle": seasonTitle,
        "Anchor": anchor,
        "AnchorName": anchorName,
        "AnchorAcronym": anchorAcronym,
        "DistributionCentre": distributionCentre,
        "DistributionCentreName": distributionCentreName,
        "Agent": agent,
        "StateCoordinator": stateCoordinator,
        "StockDate": stockDate.toIso8601String(),
        "TransId": transId,
        "StateCoordinatorId": stateCoordinatorId,
        "AgentId": agentId,
        "UserId": userId,
        "StockItems": List<dynamic>.from(stockItems.map((x) => x)),
    };
}
