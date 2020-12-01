//
//  IconProfile.swift
//  Icon Replacer
//
//  Created by ReceYuki on 2/12/20.
//

import Foundation
import SwiftUI

class IconProfile: Codable, Identifiable, Hashable {
    var name: String
    var url: URL?
    static func == (lhs: IconProfile, rhs: IconProfile) -> Bool {
        return lhs.name == rhs.name
    }
    func hash(into hasher: inout Hasher) {
          hasher.combine(name)
    }
    func getIconUrl(iconName: String) -> URL {
        let iconPrefix = "https://github.com/elrumo/macOS_Big_Sur_icons_replacements/raw/master/icons/"
        let iconSuffix = ".icns"
        return URL(string: iconPrefix + iconName + iconSuffix )!
    }

    init(name: String) {
        self.name = name
        self.url = getIconUrl(iconName: name)
    }
}



