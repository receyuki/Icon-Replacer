//
//  IconMatcher.swift
//  Icon Replacer
//
//  Created by ReceYuki on 2/12/20.
//

import Foundation

var iconList = fetchIconList()

func fetchIconList() -> [String]? {
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
    let appKeyWords: Set<String> = Set( app._name.components(separatedBy: " ") + (app.bundleName?.components(separatedBy: " "))!)
    
    for icon in iconList ?? [] {
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

func getIconUrl(iconName: String) -> URL {
    let iconPrefix = "https://github.com/elrumo/macOS_Big_Sur_icons_replacements/raw/master/icons/"
    let iconSuffix = ".icns"
    return URL(string: iconPrefix + iconName + iconSuffix )!
}
