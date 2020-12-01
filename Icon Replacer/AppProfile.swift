//
//  AppProfile.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import Foundation
import SwiftUI

class AppProfile: Codable, Identifiable, Hashable {
    let _name: String
    let path: String
    let version: String?
    var iconPath : String?
    var bundleName : String?
    static func == (lhs: AppProfile, rhs: AppProfile) -> Bool {
        return lhs._name == rhs._name && lhs.path == rhs.path
    }
    func hash(into hasher: inout Hasher) {
          hasher.combine(_name)
          hasher.combine(path)
    }
}

