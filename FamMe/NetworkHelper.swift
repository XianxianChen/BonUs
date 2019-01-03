//
//  Singlet.swift
//  FamMe
//
//  Created by C4Q on 12/12/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    private init() {}
    func makeUrlRequest(_ urlStr: String, completionHandler: @escaping (Data) -> Void) {
        guard let url = URL(string: urlStr) else {return}
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let response = response {
            print(response)
        }
        
        if let data = data {
            completionHandler(data)
        }
        
        if let error = error {
            print("error making urlRequest: \(error)")
        }
    }
        task.resume()
    }

}

class Singleton {
    static let shared: Singleton = {
        return Singleton()
    }()
    
}


