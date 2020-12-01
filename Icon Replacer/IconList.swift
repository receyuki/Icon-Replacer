//
//  IconList.swift
//  Icon Replacer
//
//  Created by ReceYuki on 2/12/20.
//

import SwiftUI

struct IconList: View {
    @Binding var selectedIcon: IconProfile?
    var selectedApp: AppProfile
    
    var body: some View {
        List(selection: $selectedIcon) {
            ForEach(getIconList(iconNameList: matchIcon(app: selectedApp)!)) { icon in
                IconColumn(icon: icon).tag(icon)
            }.frame(minHeight: 30)
        }
    }
}


//struct IconList_Previews: PreviewProvider {
//    static var previews: some View {
//        IconList()
//    }
//}
