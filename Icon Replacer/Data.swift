//
//  Data.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import Foundation
import SwiftUI

var appData = [AppProfile]()
var iconList = [IconProfile]()

let fileManager = FileManager.default
let appSupportURL = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
let iconFolder = appSupportURL.appendingPathComponent("com.receyuki.Icon-Replacer/icons")

//var appData = loadApps().sorted{
//    $0._name<$1._name
//}


