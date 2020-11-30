//
//  AppLoader.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import Foundation

struct AppProperty: Codable {
    let _items: [AppProfile]
}

struct IconPath: Codable {
    let CFBundleIconName : String?
    let CFBundleIconFile : String?
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
                .filter{$0.path.contains("/Applications/")||$0.path.contains("/System/Applications/")}
            print(apps.count)
            apps.forEach{app in app.iconPath = findIconPath(app: app)}
        return apps
        
    }
    return []
}

func findIconPath(app: AppProfile) -> String {
    let infoSuffix = "/Contents/Info.plist"
    let path = app.path
    let iconPrefix = path + "/Contents/Resources/"
    print(app._name)
    let url = URL(fileURLWithPath: (path + infoSuffix))
    if
        let data = try? Data(contentsOf: url),
        let iconName = try? PropertyListDecoder().decode(IconPath.self, from: data).CFBundleIconName
        {
        return iconPrefix + iconName + ".icns"
    }
    else if
        let data = try? Data(contentsOf: url),
        let iconFile = try? PropertyListDecoder().decode(IconPath.self, from: data).CFBundleIconFile
        {
        return iconPrefix + iconFile
    }
    else{
        return ""
    }
}
