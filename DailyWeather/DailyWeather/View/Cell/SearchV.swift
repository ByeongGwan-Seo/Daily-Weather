//
//  SearchV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/17.
//

import SwiftUI

struct SearchV: View {

    @State var searchText = ""
    @State var searching = false
    
    let cities = ["seoul", "tokyo", "osaka", "busan", "kyoto"]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(searchText: $searchText, searching: $searching)
                List(cities, id:\.self) {city in Text(city)}
                    .listStyle(GroupedListStyle())
                    .navigationTitle("Search city")
            }
        }
    }
}


struct SearchV_Previews: PreviewProvider {
    static var previews: some View {
        SearchV()
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.cyan)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}
