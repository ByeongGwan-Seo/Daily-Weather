//
//  SearchListM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import Foundation

//dddd

struct SearchListM: Identifiable, Codable {
    let id: String
    let title: String
    
    init(id: String = UUID().uuidString, title: String) {
        self.id = id
        self.title = title
    }
}
