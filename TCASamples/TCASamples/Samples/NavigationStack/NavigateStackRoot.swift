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
    
    struct State {
        var path: StackState<Path.State> = StackState<Path.State>()
    }
    enum Action {
        case path(StackAction<Path.State, Path.Action>)
    }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
                .none
        }
    }
}
