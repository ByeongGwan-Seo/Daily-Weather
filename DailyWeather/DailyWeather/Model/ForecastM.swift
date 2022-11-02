//
//  ForecastM.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import Foundation
import SwiftUI

struct ForecastModel: Hashable, Identifiable {
    var id: UUID = UUID()
    
    let date: String
    let imageName: String
    let foreMinT: String
    let foreMaxT: String
}

extension ForecastModel {
    static let foreList: [ForecastModel] = [
        ForecastModel(date: "11/3", imageName: "sun.max.fill", foreMinT: "13", foreMaxT: "16"),
        ForecastModel(date: "11/4", imageName: "cloud.fill", foreMinT: "11", foreMaxT: "14"),
        ForecastModel(date: "11/5", imageName: "cloud.rain.fill", foreMinT: "9", foreMaxT: "13"),
        ForecastModel(date: "11/6", imageName: "cloud.fog.fill", foreMinT: "12", foreMaxT: "17"),
        ForecastModel(date: "11/7", imageName: "cloud.hail.fill", foreMinT: "13", foreMaxT: "15"),
        ForecastModel(date: "11/8", imageName: "cloud.fill", foreMinT: "14", foreMaxT: "19"),
        ForecastModel(date: "11/9", imageName: "sun.max.fill", foreMinT: "11", foreMaxT: "14"),
        ForecastModel(date: "11/10", imageName: "sun.max.fill", foreMinT: "11", foreMaxT: "14"),
    ]
}
