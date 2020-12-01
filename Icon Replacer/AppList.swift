//
//  AppList.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI

struct AppList: View {
    @Binding var selectedApp: AppProfile?
    
    var body: some View{
        List(selection: $selectedApp) {
            ForEach(appData) { app in
                AppRow(app: app).tag(app)
            
            }.frame(minWidth: 300).listStyle(SidebarListStyle())
        }
    }
    
}

struct AppList_Previews: PreviewProvider {
    static var previews: some View {
        AppList(selectedApp: .constant(appData[0]))
    }
}

