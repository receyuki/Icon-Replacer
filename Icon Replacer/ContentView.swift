//
//  ContentView.swift
//  Icon Replacer
//
//  Created by ReceYuki on 30/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTab = 0
    var body: some View {
        Spacer()
        TabView(selection: $currentTab)
            {
                TabAView()
                    .tabItem({Text("Select App")})
                    .tag(0)
//                    .onAppear() {
//                        self.currentTab = 0
//                    }
                TabBView()
                    .tabItem({Text("Stored App")})
                    .tag(1)
//                    .onAppear() {
//                        self.currentTab = 1
//                    }
        }.frame(minWidth: 720, idealWidth: 720, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 480, idealHeight: 480, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding()
            .previewLayout(.fixed(width: 500.0, height: 500.0))
    }
}

