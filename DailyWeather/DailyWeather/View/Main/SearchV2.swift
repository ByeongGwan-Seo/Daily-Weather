//
//  SearchV2.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import SwiftUI

struct SearchV2: View {
    
    @EnvironmentObject var vm: CurrentWeatherViewModel
    @State var searching = false
    
    var body: some View {
        SearchBar(searchText: $vm.searchText, searching: $searching)
        
        Text("検索履歴")
            .font(.largeTitle)
            .fontWeight(.bold)
        List {
            Text("This is searchV2")
            Text("예정 기능 -> 1) searchV2에 입력한 값을 mainV2로 2)사용자의 검색 히스토리 저장")
            Text("살려줘 메우")
        }
        .listStyle(.plain)
        .background(.ultraThinMaterial)
        .background(Color.primary)
        .foregroundColor(Color.primary)
    }
}

struct SearchV2_Previews: PreviewProvider {
    static var previews: some View {
        SearchV2()
            .environmentObject(dev.currentWeatherVM)
    }
}
