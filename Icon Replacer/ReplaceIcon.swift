//
//  ReplaceIcon.swift
//  Icon Replacer
//
//  Created by ReceYuki on 2/12/20.
//

import Foundation

func replaceIcon(app:AppProfile, icon:IconProfile) {
//    let fileManager = FileManager.default
//    let srcUrl = app.iconPath!
//    let fileName = URL(fileURLWithPath: srcUrl).lastPathComponent
//
//    let dstUrl = NSHomeDirectory()+"/Downloads/"+fileName
//
    
    //  Find Application Support directory
    let fileManager = FileManager.default
    let appSupportURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
    let iconFolder = appSupportURL.appendingPathComponent("com.receyuki.Icon-Replacer/icons")
    let iconBackup = appSupportURL.appendingPathComponent("com.receyuki.Icon-Replacer/apps/"+app._name)
    let appIconName = URL(fileURLWithPath: app.iconPath!).lastPathComponent
    let iconName = icon.url!.lastPathComponent
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
    if !isExist(path: iconBackup.path) {
        try! fileManager.createDirectory (at: iconBackup, withIntermediateDirectories: true, attributes: nil)
    }
    if !isExist(path: iconBackup.appendingPathComponent(appIconName).path) {
        try! fileManager.copyItem(atPath: app.iconPath!, toPath: iconBackup.path+"/"+appIconName)
    }
    do {
        let newPath = try fileManager.replaceItemAt(URL(fileURLWithPath: app.iconPath!), withItemAt: iconFolder.appendingPathComponent(iconName))
        print(newPath!.path)
    }
    catch{
        print(error)
    }

}

