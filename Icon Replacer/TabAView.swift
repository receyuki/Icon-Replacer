//
//  TabAView.swift
//  Icon Replacer
//
//  Created by ReceYuki on 1/12/20.
//

import SwiftUI

struct TabAView: View {
    var body: some View {
        
        HStack(spacing: 0) {
            AppList()
            AppDetail()
            }
            
        .background(Color(.sRGB, white: 0.1, opacity: 1))
    }
}

struct TabAView_Previews: PreviewProvider {
    static var previews: some View {
        TabAView()
    }
}
