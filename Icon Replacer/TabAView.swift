//
//  TabAView.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI

struct TabAView: View {
    @State private var selectedApp: AppProfile?
    var body: some View {
        
        NavigationView() {
            VStack{
                Button(action:{
                    appData = loadApps()
                }){
                        Image(systemName: "goforward")
                            .font(.system(size: 16, weight: .heavy))
                }.buttonStyle(PlainButtonStyle())
                
            AppList(selectedApp: $selectedApp)
            }
            if selectedApp != nil {
                AppDetail(appIcon: Image(nsImage: NSImage(byReferencing: URL(fileURLWithPath: selectedApp!.iconPath!))), app: selectedApp!)
            }
        }
            
    }
}

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
