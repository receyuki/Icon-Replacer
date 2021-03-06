//
//  IconMatcher.swift
//  Icon Replacer
//
//  Created by ReceYuki on 2/12/20.
//

import Foundation
import SwiftUI

var iconNameList = fetchIconNameList()

func fetchIconNameList() -> [String]? {
    if let url = URL(string:"https://raw.githubusercontent.com/elrumo/macOS_Big_Sur_icons_replacements/master/icns.txt") {
        if let textFile = try? String(contentsOf: url){
            var iconList = textFile.components(separatedBy: ",\n")
            iconList[iconList.endIndex-1].removeLast()
            return iconList
        }
    }
    return nil
}

func matchIcon(app: AppProfile) -> [String]? {
    var iconMached: Set<String> = []
    let appKeyWords: Set<String> = Set((app._name.components(separatedBy: " ") + (app.bundleName?.components(separatedBy: " "))!).filter{word in
        word != "Microsoft" && word != "Adobe" && word != "Google"
    })
    
    for icon in iconNameList ?? [] {
        let iconKeyWords = icon.components(separatedBy: "_")
        for appKeyWord in appKeyWords.map({$0.lowercased()}) {
            if iconKeyWords.map({$0.lowercased()}).contains(appKeyWord) {
                iconMached.insert(icon)
                break
            }
        }
        
    }
    let iconMachedArray = Array(iconMached)
    
    return iconMachedArray
}

func getIconList(iconNameList: [String]) -> [IconProfile] {
    var iconList = [IconProfile]()
    for icon in iconNameList {
        let iconProfile = IconProfile(name: icon)
        iconList.append(iconProfile)
    }
    
    return iconList
}

func downloadIconList(iconList: [IconProfile]) {
    let fileManager = FileManager.default
    let appSupportURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
    let iconFolder = appSupportURL.appendingPathComponent("com.receyuki.Icon-Replacer/icons")
    for icon in iconList {
        if !isExist(path: iconFolder.path) {
            do {
                try fileManager.createDirectory (at: iconFolder, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                print("Unable to create icons folder")
            }
        }
        if !isExist(path: icon.url!.path){
            FileDownloader.loadFileSync(url: icon.url!, dst: iconFolder){ (path, error) in
                print("Icon downloaded to : \(path!)")
            }
        }
    }
}
