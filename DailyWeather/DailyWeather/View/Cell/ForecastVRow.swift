//
//  ForecastVRow.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/02.
//

import SwiftUI

struct ForecastVRow: View {
    
    @Binding var forecast: ForecastModel
    
    var body: some View {
        
        let temperature = "\(forecast.foreMaxT)" + "/" + "\(forecast.foreMinT)"
        HStack {
            Text("\(forecast.date)")
                .font(.system(size: 20, weight: .bold))
            Spacer()
            Image(systemName: "\(forecast.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Spacer()
            HStack {
                Text(temperature)
                    .font(.system(size: 20))
            }
        }
        .padding()
    }
}

struct ForecastVRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastVRow(forecast: .constant(ForecastModel.foreList[0]))
            .previewLayout(.fixed(width: 390, height: 80))
    }
}
