//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by Junho Lee on 2023/02/01.
//

import SwiftUI

@main
struct MemoAppApp: App {
    @StateObject private var coredataService = CoreDataService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coredataService.container.viewContext)
        }
    }
}
