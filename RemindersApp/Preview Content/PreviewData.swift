//
//  PreviewData.swift
//  RemindersApp
//
//  Created by Vinh on 5/11/24.
//

import Foundation
import CoreData
class PreviewData {
    static var myList: MyList {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = MyList.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? MyList()
    }
}
