//
//  SearchVM.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

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
    
    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == . loading
        }
    }
}

//MARK: JSON Fetch Data
extension SearchVM {
    func fetchData() async {
        Task {
            do {
                let data1 = try await fetchSchool1().dataSearch.content
                let data2 = try await fetchSchool2().dataSearch.content
                let data3 = try await fetchSchool3().dataSearch.content
                DispatchQueue.main.async {
                    self.schools = data1 + data2 + data3 // Update on the main thread
                    self.isDownloading = false
                }
            } catch {
                print("Error fetching data: \(error)")
         
            }
            
        }
    }
    
    private func fetchSchool1() async throws -> schoolData {
        return try await AF.request(eSchoolUrl, method: .get, headers: headers).serializingDecodable(schoolData.self).value
    }
    
    private func fetchSchool2() async throws -> schoolData {
        return try await AF.request(mSchoolUrl, method: .get, headers: headers).serializingDecodable(schoolData.self).value
    }

    private func fetchSchool3() async throws -> schoolData {
        return try await AF.request(hSchoolUrl, method: .get, headers: headers).serializingDecodable(schoolData.self).value
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
