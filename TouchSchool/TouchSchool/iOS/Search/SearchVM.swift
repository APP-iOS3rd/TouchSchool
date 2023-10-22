//
//  SearchVM.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var schools: [School] = []
    
    @Published var viewState: ViewState = ViewState.ready
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        Task {
            await getSearchResults(forText: text)
        }
    }
    
    private func getSearchResults(forText text: String) async {
        let haveResult = Int.random(in: 0...3)
        
        // await
        
        if haveResult == 0 {
            // Empty view
            self.schools = []
            setViewState(to: .empty)
        } else {
            
            // Ready view
            self.schools = []
            setViewState(to: .ready)
        }
    }
    
    private func setViewState(to state: ViewState){
        self.viewState = state
        self.isLoading = state == . loading
    }
    
    func fetchData() async {
        Task {
            do {
                let data = try await fetchDataAsync()
                schools = data.dataSearch.content
            } catch {
                print("Error fetching data: \(error)")
            }
        }
        print(schools.count)
    }
    
    private func fetchDataAsync() async throws -> schoolData {
        guard let url = URL(string: "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list&perPage=1000000") else {
            throw MyError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(schoolData.self, from: data)
        print(decodedData)
        return decodedData
    }
}

enum MyError: Error {
    case invalidURL
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
