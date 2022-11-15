//
//  SearchListVM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import Foundation

//class SearchListVM: ObservableObject {
//    @Published var items: [SearchListM]
//    
//    let itemsKey: String = "items_list"
//    
////    init() {
////        getItems()
////    }
//    
//    func getItems() {
//        guard
//            let data = UserDefaults.standard.data(forKey: itemsKey),
//            let savedItems = try? JSONDecoder().decode([SearchListM].self, from: data)
//        else { return }
//        
//        self.items = savedItems
//    }
//    
//    func addItem(title: String) {
//        let newItem = SearchListM(title: title)
//        items.append(newItem)
//    }
//    
//    func saveItems() {
//        if let encodedData = try? JSONEncoder().encode(items) {
//            UserDefaults.standard.set(encodedData, forKey: itemsKey)
//        }
//    }
//}
