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
            SearchListM(title: NSLocalizedString("search_list_item_1", comment: "Seoul")),
            SearchListM(title: NSLocalizedString("search_list_item_2", comment: "Tokyo")),
            SearchListM(title: NSLocalizedString("search_list_item_3", comment: "Osaka")),
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
