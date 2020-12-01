//
//  AppLoader.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import Foundation
import SwiftUI

struct AppProperty: Codable {
    let _items: [AppProfile]
}

struct IconPath: Codable {
    let CFBundleIconName : String?
    let CFBundleIconFile : String?
    let CFBundleName : String?
}


func loadApps() -> [AppProfile] {
    let task = Process()
    let pipe = Pipe()
    
    task.launchPath = "/usr/sbin/system_profiler"
    task.arguments = ["-xml", "-detailLevel", "mini", "SPApplicationsDataType"]
    task.standardOutput = pipe
    task.launch()
    
    // parse the plist data
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    if
        let decoder = try? PropertyListDecoder().decode([AppProperty].self, from: data),
        var apps = decoder.first?._items {
        apps = apps
            .filter({$0.path.hasPrefix("/Applications/")||$0.path.hasPrefix("/System/Applications/")})
        apps.forEach{app in app.iconPath = findIconPath(app: app)}
        return apps.filter{$0.iconPath != ""}
        
    }
    return []
}

func findIconPath(app: AppProfile) -> String {
    let infoSuffix = "/Contents/Info.plist"
    let path = app.path
    let iconPrefix = path + "/Contents/Resources/"
    let url = URL(fileURLWithPath: (path + infoSuffix))
    if
        let data = try? Data(contentsOf: url),
        let iconName = try? PropertyListDecoder().decode(IconPath.self, from: data).CFBundleIconName
        {
            let fullpath = iconPrefix + iconName + ".icns"
            if isExist(path: fullpath) {
                return fullpath
            }
            
            return ""
        }
    else if
        let data = try? Data(contentsOf: url),
        let iconFile = try? PropertyListDecoder().decode(IconPath.self, from: data).CFBundleIconFile
        {
            if iconFile.hasSuffix(".icns") {
                let fullpath = iconPrefix + iconFile
                if isExist(path: fullpath) {
                    return fullpath
                }
            }
            else {
                let fullpath = iconPrefix + iconFile + ".icns"
                if isExist(path: fullpath) {
                    return fullpath
                    
                }
            }
            return ""
        }
    return ""
}

func isExist(path: String) -> Bool {
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: path) {
        return true
    } else {
        return false
    }
}
