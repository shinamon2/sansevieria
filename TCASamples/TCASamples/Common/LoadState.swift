//
//  LoadState.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import Foundation

public enum LoadState: Equatable {
    case none
    case loading
    case empty
    case error(Error)
    case loaded
    
    public static func == (lhs: LoadState, rhs: LoadState) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none), (.loaded, .loaded):
            true
        case (.loading, .loading):
            true
        case let (.error(lhsError), .error(rhsError)):
            lhsError.localizedDescription == rhsError.localizedDescription
        default:
            false
        }
    }
}
