//
//  AppData.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import Foundation
import SwiftUI


var appData = loadApps().sorted{
    $0._name<$1._name
}


