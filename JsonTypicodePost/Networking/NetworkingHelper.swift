//
//  NetworkingHelper.swift
//  JsonTypicodePost
//
//  Created by Satori on 21/11/25.
//

import Alamofire
import Foundation

protocol Networking {
    func get<T: Decodable>(_ url: URL) async throws -> T
}

final class NetworkingHelper: Networking {

    func get<T: Decodable>(_ url: URL) async throws -> T {

        return try await withCheckedThrowingContinuation { continuation in

            AF.request(url)
                .validate()
                .responseDecodable(of: T.self) { response in
        
                    switch response.result {
                    case .success(let decoded):
                        continuation.resume(returning: decoded)

                    case .failure(_):
                        
                        let statusCode = response.response?.statusCode
                        let message = try? JSONDecoder().decode(ErrorResponse.self, from: response.data ?? Data()).unifiedMessage
                        
                        let apiError: ApiError
                        
                        switch statusCode {
                        case 400: return apiError = .badRequest(message: message)
                        case 401: return apiError = .unauthorized
                        case 403: return apiError = .forbidden
                        case 404: return apiError = .notFound
                        case 500: apiError = .serverError(message: message)
                        default:
                            return apiError = .unknown(statusCode: statusCode, message: message)
                        }
                        
                        continuation.resume(throwing: apiError)
                    }
                }
        }
    }
}
