//
//  ForecastV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastV: View {
    
    @StateObject var vm = ForeCastViewModel()
    
    var body: some View {
        List($vm.models) { $item in ForecastVRow(forecast: $item)
        }
        .listStyle(.insetGrouped)
        
    }
}

struct ForecastV_Previews: PreviewProvider {
    static var previews: some View {
        ForecastV()
    }
}