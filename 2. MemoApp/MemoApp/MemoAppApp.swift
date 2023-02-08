//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by Junho Lee on 2023/02/01.
//

import SwiftUI

@main
struct MemoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MemoListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
