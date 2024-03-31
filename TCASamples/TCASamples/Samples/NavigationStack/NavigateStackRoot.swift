//
//  NavigateStackRoot.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import ComposableArchitecture

@Reducer
struct NavigateStackRoot {
    @Reducer
    public struct Path {
        @ObservableState
        public enum State {
            case navigate01(Navigate01Feature.State)
            case navigate02(Navigate02Feature.State)
            case navigate03(Navigate03Feature.State)
        }
        
        public enum Action {
            case navigate01(Navigate01Feature.Action)
            case navigate02(Navigate02Feature.Action)
            case navigate03(Navigate03Feature.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: \.navigate01, action: \.navigate01) {
                Navigate01Feature()
            }
            Scope(state: \.navigate02, action: \.navigate02) {
                Navigate02Feature()
            }
            Scope(state: \.navigate03, action: \.navigate03) {
                Navigate03Feature()
            }
        }
    }
    
    @ObservableState
    struct State {
        var path: StackState<Path.State> = .init()
    }
    enum Action {
        case onAppear
        case toNavigate02Tapped
        case path(StackAction<Path.State, Path.Action>)
    }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action{
            case .onAppear:
                state.path.append(.navigate01(Navigate01Feature.State()))  
                return .none
                
            case .toNavigate02Tapped:
                state.path.append(.navigate02(Navigate02Feature.State()))
                return .none
                
            case let .path(element):
                logger.debug(element)
                logger.debug(element)
                //                                logger.debug(action)
                
                switch element {
                case .element(id: let id, action: let action):
                    switch action{
                    case let .navigate01(action):
                        logger.debug(action)
                        switch action {
                        case .navigate02:
                            state.path.append(.navigate02(Navigate02Feature.State()))
                        case .next02Tapped:
                            state.path.append(.navigate02(Navigate02Feature.State()))
                        case .next03Tapped:
                            state.path.append(.navigate03(Navigate03Feature.State()))
                        case .any02Response(_):
                            return .none
                        case .any03Response(_):
                            return .none
                        case .navigate03(_):
                            return .none
                        }
                        
                    case let .navigate02(action):
                        switch action {
                        case .anyTapped:
                            return .none
                        case .nextTapped:
                            state.path.append(.navigate03(Navigate03Feature.State()))
                        case .backTapped:
                            state.path.popLast()
                        case .anyResponse:
                            return .none
                        }
                        
                    case .navigate03:
                        return .none
                    }
                    return .none
                case .popFrom(id: let id):
                    return .none
                case .push(id: let id, state: let state):
                    return .none
                }
            }
            
        }
    }
}
