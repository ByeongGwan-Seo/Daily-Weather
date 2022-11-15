//
//  SearchV.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/10/17.
//

import SwiftUI

//struct SearchV: View {
//
//    @EnvironmentObject var vm: CurrentWeatherViewModel
//    @State var searching = false
//
//    let cities = ["Seoul", "Tokyo", "Osaka", "Busan", "Kyoto", "Toronto", "Osan"]
//
//    var body: some View {
//        NavigationView {
//            let filteredCities = cities.filter { $0.hasPrefix(vm.searchText) || vm.searchText == "" }
//
//            VStack(alignment: .leading) {
//                SearchBar(searchText: $vm.searchText, searching: $searching)
//                List(filteredCities, id:\.self) {city in ZStack {
//                    NavigationLink {
//                        CurrentWeatherV()
//                    } label: {
//                        EmptyView()
//                    }
//                    Text(city)
//                }
//                .frame(height: 60)
//                }
//                    .listStyle(GroupedListStyle())
//                    .navigationTitle(searching ? "Searching" : "Search city")
//                    .toolbar {
//                        if searching {
//                            Button("Cancel") {
//                                vm.searchText = ""
//                                withAnimation {
//                                    searching = false
//                                    UIApplication.shared.dismissKeyboard()
//                                }
//                            }
//                        }
//                    }
//            }
//        }
//    }
//}


//struct SearchV_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchV()
//            .environmentObject(dev.currentWeatherVM)
//    }
//}


