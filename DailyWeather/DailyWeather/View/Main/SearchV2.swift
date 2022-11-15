//
//  SearchV2.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import SwiftUI

struct SearchV2: View {
    
    @EnvironmentObject var vm: CurrentWeatherViewModel
//    @EnvironmentObject var lvm: SearchListVM
    @State var searching = false
    @State var searchText = ""
    
    var body: some View {
        listSection
    }
}

struct SearchV2_Previews: PreviewProvider {
    static var previews: some View {
        SearchV2()
            .preferredColorScheme(.dark)
            .environmentObject(dev.currentWeatherVM)
//            .environmentObject(SearchListVM)
    }
}

extension SearchV2 {
    private var listSection:some View {
        VStack(spacing: 30) {
            SearchBar(searchText: $vm.searchText, searching: $searching)
            Text("検索履歴")
                .font(.largeTitle)
                .fontWeight(.bold)
            List {
                Text("This is searchV2")
                Text("예정 기능 -> 1) searchV2에 입력한 값을 mainV2로 2)사용자의 검색 히스토리 저장")
                Text("살려줘 메우")
                Text("살려줘 메우")
            }
            .frame(width: 250, height: 400)
            .background()
            .cornerRadius(30)
            .listStyle(.plain)
            .foregroundColor(Color.primary)
        }
    }
}

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText) {startedEditing in if startedEditing {
                    withAnimation{
                        searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }
            .foregroundColor(.gray)
            .padding(.horizontal, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
