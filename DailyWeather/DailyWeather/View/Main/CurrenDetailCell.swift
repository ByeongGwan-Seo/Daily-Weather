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
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text(description)
                    .font(.subheadline)
            }
            Divider()
            Spacer()
            Text(function)
                .font(.largeTitle)
            Spacer()
        }
        .frame(width: 120, height:120)
        .padding()
        .foregroundColor(Color.primary)
        .background(Color.secondary)
        .background(.thinMaterial)
        .cornerRadius(20)
    }
}

struct CurrenDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        CurrenDetailCell(systemName: "person.fill", description: "Feels Like", function: "toko")
            
    }
}
