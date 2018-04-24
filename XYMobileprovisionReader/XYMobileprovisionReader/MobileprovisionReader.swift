//
//  MobileprovisionReader.swift
//  XYMobileprovisionReader
//
//  Created by 高昕源 on 2018/4/24.
//  Copyright © 2018年 高昕源. All rights reserved.
//

import Foundation

public class MobileprovisionReader {
    let path : String
    let security : String = "/usr/bin/security"
    let args : [String]
    
    public init(path: String) {
        self.path = path
        self.args = ["cms", "-D", "-i", self.path]
    }
    
    public func getInfo() -> MobileprovisionInfo? {
        
        let process = Process()
        let outpipe = Pipe()
        let errpipe = Pipe()
        process.standardOutput = outpipe
        process.standardError = errpipe
        process.launchPath = self.security
        process.arguments = self.args
        process.launch()
        process.waitUntilExit()
        
        let outdata = outpipe.fileHandleForReading.availableData
        let errdata = errpipe.fileHandleForReading.availableData
        if errdata.count != 0  {
            let errString = String(data: errdata, encoding: String.Encoding.utf8) ?? ""
            print(errString)
        }
        
        let propertyList = try! PropertyListSerialization.propertyList(from: outdata, options: .mutableContainers, format: nil)
        let pDic = propertyList as! Dictionary<String, Any>
        
        let uuid = pDic["UUID"] as! String
        let teamName = pDic["TeamName"] as! String
        let expirationDate = pDic["ExpirationDate"] as! Date
        let creationDate = pDic["CreationDate"] as! Date
        
        let name = pDic["Name"] as! String
        let version = pDic["Version"] as! Int
        let appIDName = pDic["AppIDName"] as! String
        
        let entitlementsDic = pDic["Entitlements"] as! Dictionary<String, Any>
        let bundleID = entitlementsDic["application-identifier"] as! String
        let teamID = entitlementsDic["com.apple.developer.team-identifier"] as! String
        
        let teamIdentifier = entitlementsDic["com.apple.developer.team-identifier"] as! String
        let bundleIdentifier = bundleID.replacingOccurrences(of: "\(teamID).", with: "")
        
        let dateString = expirationDate.description
        let startSlicingIndex = dateString.index(dateString.startIndex, offsetBy: 18)
        let dateS = dateString[...startSlicingIndex]
        
        let creationDateString = creationDate.description
        let creationDateS = creationDateString[...startSlicingIndex]
        
        let info = MobileprovisionInfo(uuid: uuid, teamName: teamName, expirationDate: String(dateS), creationDate: String(creationDateS), name: name, version: version, appIDName: appIDName, teamIdentifier: teamIdentifier, bundleIdentifier: bundleIdentifier)
        
        return info
    }
}
