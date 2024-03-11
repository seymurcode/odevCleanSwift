//
//  NetworkUtil.swift
//  AzApi
//
//  Created by Sefa Aycicek on 27.02.2024.
//

import UIKit

class NetworkUtil: NSObject {

}

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkError : Error {
    case invalidURL
    case noData
    case decodingError
    case httpResponseError(statusCode : Int)
    case unknown(Error)
}
