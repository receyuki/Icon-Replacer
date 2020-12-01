//
//  ReplaceIcon.swift
//  Icon Replacer
//
//  Created by ReceYuki on 2/12/20.
//

import Foundation

func replaceIcon(app:AppProfile, icon:IconProfile) {
    let fileManager = FileManager.default
    let srcUrl = app.iconPath!
    let fileName = URL(fileURLWithPath: srcUrl).lastPathComponent
    
    let desUrl = NSHomeDirectory()+"/Downloads/"+fileName
    try! fileManager.copyItem(atPath: srcUrl, toPath: desUrl)
}
