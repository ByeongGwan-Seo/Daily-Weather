//
//  SearchListVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import Foundation
import SwiftUI

class SearchListVM: ObservableObject {
    @Published var listItems: [SearchListM] = [] {
        didSet {
            saveItem()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: "savedData"),
            let savedItems = try? JSONDecoder().decode([SearchListM].self, from: data)
        else { return }
        
        self.listItems = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
        saveItem()
    }
    
    func addItem(title: String) {
        let newItem = SearchListM(title: title)
        listItems.append(newItem)
        saveItem()
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(listItems) {
            UserDefaults.standard.set(encodedData, forKey: "savedData")
        }
    }
}
