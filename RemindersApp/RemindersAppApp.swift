//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Vinh on 30/10/24.
//

import SwiftUI

@main
struct RemindersAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext,CoreDataProvider.shared.persistentContainer.viewContext)
            // thực hiện các thao tác CRUD (Create, Read, Update, Delete) trên dữ liệu Core Data trực tiếp trong SwiftUI view mà không cần tạo context riêng lẻ.
        }
    }
}
