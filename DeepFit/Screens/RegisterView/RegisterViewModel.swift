//
//  LoginViewModel.swift
//  DeepFit
//
//  Created by Erdal Burak Cinar on 17.07.2023.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var username: String = "erdal"
    private let httpService: HTTPService
    
    init(httpService: HTTPService = HTTPService()) {
        self.httpService = httpService
    }
    
    func fetchUsername() {
        let url = URL(string: "https://api.example.com/user")!
        let request = HTTPRequest(url: url, method: .get, headers: nil, body: nil)
        
        httpService.sendRequest(request) { [weak self] result in
            switch result {
            case .success(let responseData):
                if let username = String(data: responseData, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self?.username = username
                    }
                } else {
                    print("Invalid data")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func RegisterWithEmail(email: String) {
        username = "burak"
        print(email)
    }
}

