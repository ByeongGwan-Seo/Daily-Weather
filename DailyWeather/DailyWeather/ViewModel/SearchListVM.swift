//
//  SearchListVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import Foundation

class SearchListVM: ObservableObject {
    
    @Published var listItems: [SearchListM] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            SearchListM(title: "Seoul"),
            SearchListM(title: "Tokyo"),
            SearchListM(title: "메우...")
        ]
        listItems.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
    }
    
    func addItem(title: String) {
        let newItem = SearchListM(title: title)
        listItems.append(newItem)
    }
}
