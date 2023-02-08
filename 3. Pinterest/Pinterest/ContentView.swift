//
//  ContentView.swift
//  Pinterest
//
//  Created by Junho Lee on 2023/02/08.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            Text("검색")
                .tabItem {
                    Label("검색", systemImage: "magnifyingglass")
                }
            Text("만들기")
                .tabItem {
                    Label("만들기", systemImage: "plus")
                }
            Text("알림")
                .tabItem {
                    Label("알림", systemImage: "ellipsis.message.fill")
                }
            Text("저장됨")
                .tabItem {
                    Label("저장됨", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
