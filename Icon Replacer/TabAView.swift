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
            AppList(selectedApp: $selectedApp)
            if selectedApp != nil {
                AppDetail(app: selectedApp!)
            }
        }
            
        .background(Color(.sRGB, white: 0.1, opacity: 1))
    }
}

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
