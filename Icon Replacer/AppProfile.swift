//
//  AppProfile.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import Foundation
import SwiftUI

class AppProfile: Codable, Identifiable {
    let _name: String
    let path: String
    let version: String?
    var iconPath : String?
}

//extension AppProfile {
//    var image: Image {
//        loadIcon(app: <#T##AppProfile#>)
//    }
//}
