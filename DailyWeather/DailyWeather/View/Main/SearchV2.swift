//
//  SearchV2.swift
//  DailyWeather
//
//  Created by seobyeonggwan on 2022/11/15.
//

import SwiftUI

struct SearchV2: View {
    
    @EnvironmentObject var vm: CurrentWeatherViewModel
    @EnvironmentObject var lvm: SearchListVM
    @EnvironmentObject var foreVm: ForeCastViewModel
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
            .environmentObject(SearchListVM())
            .environmentObject(ForeCastViewModel())
    }
}

extension SearchV2 {
    private var listSection:some View {
        VStack(spacing: 10) {
            SearchBar(searchText: $vm.searchText, searching: $searching)
            Text(L10n.Localizable.searchHistory)
                .font(.largeTitle)
                .fontWeight(.bold)
            List {
                ForEach(lvm.listItems) { item in
                    SearchListRowV(item: item, clickRow: {
                        vm.getCurrentWeather(cityName: item.title)
                        foreVm.getForecastweather(cityName: item.title) 
                    })
                }
                .onDelete(perform: lvm.deleteItem)
            }
            .frame(width: 250, height: 400)
            .background()
            .cornerRadius(30)
            .padding()
            .listStyle(.plain)
            .foregroundColor(Color.primary)
            Button {
                lvm.deleteAll()
            } label: {
                Text("Delete All")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundColor(.red)
                    .frame(width: 150, height: 55)
                    .background(Color.white)
                    .cornerRadius(20)
            }
        }
    }
}

struct SearchBar: View {
    @EnvironmentObject var lvm: SearchListVM
    @EnvironmentObject var vm: CurrentWeatherViewModel
    @EnvironmentObject var fvm: ForeCastViewModel
    @Binding var searchText: String
    @Binding var searching: Bool
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
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
                } .onSubmit {
                    userSubmitted()
                    vm.getCurrentWeather(cityName: searchText)
                    fvm.getForecastweather(cityName: searchText)
                    searchText = ""
                }
            }
            .foregroundColor(.gray)
            .padding(.horizontal, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
        .alert(alertTitle, isPresented: $showAlert){
            
        }
    }
    
    func userSubmitted() {
        if isInfoAppropriate() {
            lvm.addItem(title: searchText)
        }
    }
    
    func isInfoAppropriate() -> Bool {
        if searchText.count < 2 {
            alertTitle = "Inappropriate Search Text(at least 2 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
