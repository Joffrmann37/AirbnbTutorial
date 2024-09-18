//
//  RequestGenerator.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/17/24.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

class RequestGenerator {
    static func createRequest(urlStr: String, token: String? = nil, body: Encodable?, method: HTTPMethod = .GET, contentType: String) -> URLRequest? {
        guard let url = URL(string: urlStr) else {
            return nil
        }
        var request = URLRequest(url: url)
        if let token = token {
            //request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = method.rawValue
        if let body = body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        
        return request
    }
}
