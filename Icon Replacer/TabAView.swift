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
            
    }
}

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
