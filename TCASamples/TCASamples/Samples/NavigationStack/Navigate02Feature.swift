//
//  Navigate02Feature.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import ComposableArchitecture

@Reducer
struct Navigate02Feature {
    @ObservableState
    struct State: Equatable {
        var loadState: LoadState = .none
        
        static func == (lhs: Navigate02Feature.State, rhs: Navigate02Feature.State) -> Bool {
            lhs.loadState == rhs.loadState
        }
    }
    
    enum Action {
        case anyTapped
        case nextTapped
        case anyResponse(Result<Bool, Error>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action{
            case .anyTapped:
                logger.debug("このボタンタップ時は、自分のReducerで処理させたい")
                return .none

            case .nextTapped:
                return .run { send in
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    await send(.anyResponse(.success(true)))
                }
                
            case .anyResponse(.success(_)):
                // TODO: 画面遷移処理
                return .none
                
            case let .anyResponse(.failure(error)):
                state.loadState = .error(error)
                return .none
            }
        }
    }
}

