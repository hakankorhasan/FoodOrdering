//
//  AppError.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 15.08.2023.
//

import UIKit

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoding"
        case .unknownError:
            return "unkown error"
        case .invalidUrl:
            return "heyy!!! Give me a valid URL!!"
        case .serverError(let error):
            return error
        }
    }
}
