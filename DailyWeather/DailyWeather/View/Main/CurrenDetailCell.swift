//
//  CurrenDetailCell.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/24.
//

import SwiftUI

struct CurrenDetailCell: View {
    
    @EnvironmentObject var vm: CurrentWeatherViewModel

    var systemName: String
    var description: String
    var function: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 120)
            VStack(alignment: .leading, spacing: 10) {
                Text(description)
                    .font(.title3)
                Text(function)
                    .font(.title2)
            }
        }
        .frame(width: 140, height:140)
        .padding()
        .background(Color.white)
        .foregroundColor(Color.black)
        .cornerRadius(20)
    }
}

struct CurrenDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        CurrenDetailCell(systemName: "person.fill", description: "Feels Like", function: "toko")
            
    }
}
