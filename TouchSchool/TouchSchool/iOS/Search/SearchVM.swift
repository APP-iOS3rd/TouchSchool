//
//  SearchVM.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI
import Alamofire

class SearchVM: ObservableObject {
    @Published var isDownloading: Bool = true
    
    @Published var isLoading: Bool = false
    
    @State var progress: Double = 0
    
    @Published var schools: [School] = []
    
    @Published var searchResult: [School] = []
    
    @Published var viewState: ViewState = ViewState.empty
        
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        if text.count > 0 {
            getSearchResults(forText: text)
        }
    }
    
    private func getSearchResults(forText text: String) {
        
        searchResult = schools.filter { $0.schoolName.contains(text) }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.searchResult.count == 0 {
                // Empty view
                self.setViewState(to: .empty)
            } else {
                self.setViewState(to: .ready)
            }
        }
    }
    
    private func setViewState(to state: ViewState){
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == . loading
        }
    }
}

//MARK: Fetch Data
extension SearchVM {
    func fetchData() async {
        Task {
            do {
                let data = try await fetchDataAsync()
                DispatchQueue.main.async {
                    self.schools = data.dataSearch.content // Update on the main thread
                    self.isDownloading = false
                }
            } catch {
                print("Error fetching data: \(error)")
         
            }
            print(schools.startIndex)
            print(schools)
            
        }
    }
    
    private func fetchDataAsync() async throws -> schoolData {
        guard let url = URL(string: "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list&perPage=100000") else {
            throw MyError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        for i in 1...10 {
            DispatchQueue.main.async {
                self.progress = Double(i) / 10.0
            }
            try await Task.sleep(nanoseconds: 1) // Simulate a delay
        }
        let decodedData = try JSONDecoder().decode(schoolData.self, from: data)
        return decodedData
    }
}

enum ViewState: String {
    case empty
    case loading
    case ready
    case error
}

enum MyError: Error {
    case invalidURL
}
