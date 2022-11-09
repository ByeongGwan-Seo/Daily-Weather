//
//  ForecastV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastV: View {
    
    @StateObject var vm: ForeCastViewModel
    
    init(cityName: String) {
        _vm = StateObject(wrappedValue: ForeCastViewModel(cityName: cityName))
    }
    
    var body: some View {
        Text("TODO")
//        List($vm.models) { $item in ForecastVRow(forecast: $item)
//        }
//        .listStyle(.insetGrouped)
        
    }
}

struct ForecastV_Previews: PreviewProvider {
    static var previews: some View {
        ForecastV(cityName: "Seoul")
    }
}
