//
//  ForecastVRow.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastVRow: View {
    
    @StateObject var vm: ForeCastViewModel
    
    init(cityName: String) {
        _vm = StateObject(wrappedValue: ForeCastViewModel(cityName: cityName))
    }
    
    var body: some View {
        Text("TODO")

    }
}

struct ForecastVRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastVRow(cityName: "seoul")
            .previewLayout(.fixed(width: 390, height: 80))
    }
}
