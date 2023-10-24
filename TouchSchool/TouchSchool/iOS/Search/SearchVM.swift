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
    @Published var isLoading: Bool = false
    
    @Published var searchResult: [School] = []
    
    @Published var viewState: ViewState = ViewState.ready
    
    @ObservedObject var mainVm = MainVM()
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        if text.count > 0 {
            getSearchResults(forText: text)
        }
    }
    
    private func getSearchResults(forText text: String) {
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                // Empty view
                self.searchResult = []
                self.setViewState(to: .empty)
            } else {
                self.searchResult = self.mainVm.schools
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
//
//class SearchVM: ObservableObject {
//    @Published var isLoading: Bool = false
//    @Published var schools: [School] = []
//    // 고등학교API 임시로 받아오는 저장속성
//    @Published var Highschools: [School] = []
//    @Published var viewState: ViewState = ViewState.ready
//
//    public func updateSearchText(with text: String) {
//        setViewState(to: .loading)
//        if text.count > 0 {
//            getSearchResults(forText: text)
//        }
//    }
//
//    private func getSearchResults(forText text: String) {
//        let haveResult = Int.random(in: 0...3)
//
//        // await
//
//        if haveResult == 0 {
//            // Empty view
//            self.schools = []
//            setViewState(to: .empty)
//        } else {
//
//            // Ready view
//            self.schools = []
//            setViewState(to: .ready)
//        }
//    }
//
//    private func setViewState(to state: ViewState){
//        self.viewState = state
//        self.isLoading = state == . loading
//    }
//
//    func fetchData() async {
//        Task {
//            do {
//                let data = try await fetchDataAsync()
//                schools = data.dataSearch.content
//            } catch {
//                print("Error fetching data: \(error)")
//            }
//        }
//        print(schools.count)
//    }
//
//    private func fetchDataAsync() async throws -> schoolData {
//        guard let url = URL(string: "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=elem_list&perPage=1000000") else {
//            throw MyError.invalidURL
//        }
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let decodedData = try JSONDecoder().decode(schoolData.self, from: data)
//
//        return decodedData
//    }
//    
//    
//   // 고등학교 api url
//    private let HighSchool_URL = "https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=47637ffc0e519c2550b56144e7190bff&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&perPage=1000000"
//    
//    // alamofire 동시성
//    // alamofire에서 쉽게 동시성으로 json get해오기 위해서 작성??
//    final class AppNetworking {
//        static let shared = AppNetworking()
//        
//        private init() { }
//        
//        private let session: Session = {
//            let configuration = URLSessionConfiguration.default
//            configuration.timeoutIntervalForRequest = 10
//            configuration.timeoutIntervalForResource = 10
//            return Session(configuration: configuration)
//        }()
//        
//        func requestJSON<T: Decodable>(_ url: String,
//                                       type: T.Type,
//                                       method: HTTPMethod,
//                                       parameters: Parameters? = nil) async throws -> T {
//            
//            return try await session.request(url,
//                                             method: method,
//                                             parameters: parameters,
//                                             encoding: URLEncoding.default)
//            .serializingDecodable()
//            .value
//        }
//    }
//    
//    
//    // 위의 class로 인해 이렇게 간결해지는듯 함
//    private func retrieveJokes(url: String) async {
//        do {
//            let data = try await AppNetworking.shared.requestJSON(url,
//                                                                   type: schoolData.self,
//                                                                   method: .get,
//                                                                   parameters: nil)
//            Highschools = data.dataSearch.content
//        } catch {
//            print("Error")
//        }
//    }
//}
    


enum ViewState {
    case empty
    case loading
    case ready
    case error
}
