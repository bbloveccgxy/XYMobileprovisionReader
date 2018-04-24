//
//  MobileprovisionInfo.swift
//  XYMobileprovisionReader
//
//  Created by 高昕源 on 2018/4/24.
//  Copyright © 2018年 高昕源. All rights reserved.
//

import Foundation

public class MobileprovisionInfo {
    public let uuid : String
    public let teamName: String
    public let expirationDate: String
    public let creationDate: String
    public let name: String
    public let version: Int
    public let appIDName: String
    public let teamIdentifier: String
    public let bundleIdentifier: String
    
    init(uuid: String, teamName: String, expirationDate: String, creationDate: String, name: String, version: Int, appIDName: String, teamIdentifier: String, bundleIdentifier: String) {
        self.uuid = uuid
        self.teamName = teamName
        self.expirationDate = expirationDate
        self.creationDate = creationDate
        self.name = name
        self.version = version
        self.appIDName = appIDName
        self.teamIdentifier = teamIdentifier
        self.bundleIdentifier = bundleIdentifier
    }
    
    public func description() {
        print("UUID: \(self.uuid)")
        print("Team Name: \(self.teamName)")
        print("Team Identifier: \(self.teamIdentifier)")
        print("Bundle Indentifier: \(self.bundleIdentifier)")
        print("App ID Name: \(self.appIDName)")
        print("Expiration Date: \(self.expirationDate)")
        print("Creation Date: \(self.creationDate)")
        print("name: \(self.name)")
        print("version: \(self.version)")
    }
}
