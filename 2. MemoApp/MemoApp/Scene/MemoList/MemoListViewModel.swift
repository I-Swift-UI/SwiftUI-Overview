//
//  MemoListViewModel.swift
//  MemoApp
//
//  Created by Junho Lee on 2023/02/01.
//

import Combine
import SwiftUI
import CoreData

class MemoListViewModel: ObservableObject {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    var items: FetchedResults<Item>
    
    var context: NSManagedObjectContext!
    
    func addItem() {
        withAnimation {
            let newItem = Item(context: context)
            newItem.timestamp = Date()

            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(context.delete)

            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
