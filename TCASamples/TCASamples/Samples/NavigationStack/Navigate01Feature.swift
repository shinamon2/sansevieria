//
//  Navigate01Feature.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import ComposableArchitecture

@Reducer
struct Navigate01Feature {
    @ObservableState
    struct State: Equatable {
        var loadState: LoadState = .none
        @Presents var navigate02: Navigate02Feature.State?
        @Presents var navigate03: Navigate03Feature.State?
        
        static func == (lhs: Navigate01Feature.State, rhs: Navigate01Feature.State) -> Bool {
            lhs.loadState == rhs.loadState
        }
    }
    
    enum Action {
        case next02Tapped
        case next03Tapped
        case any02Response(Result<Bool, Error>)
        case any03Response(Result<Bool, Error>)
        case navigate02(PresentationAction<Navigate02Feature.Action>)
        case navigate03(PresentationAction<Navigate03Feature.Action>)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action{
            case .next02Tapped:
                return .run { send in
                    await send(.any02Response(.success(true)))
                }
                
            case .next03Tapped:
                return .run { send in
                    await send(.any03Response(.success(true)))
                }
                
            case .any02Response(.success):
                state.navigate02 = Navigate02Feature.State()
                return .none
                
            case let .any02Response(.failure(error)):
                state.loadState = .error(error)
                return .none
                
            case .any03Response:
                state.navigate03 = Navigate03Feature.State()
                return .none
                
            case .navigate02:
                return .none
                
            case .navigate03:
                logger.debug("navigate03の方の親Actionで処理〜！")
                return .none
            }
        }
    }
}

