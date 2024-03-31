//
//  NavigateStackRootView.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import ComposableArchitecture
import SwiftUI

struct NavigateStackRootView: View {
    @Bindable var store: StoreOf<NavigateStackRoot>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            defaultContent(store: store)
        } destination: { store in
            switch store.state {
            case .navigate01:
                if let store = store.scope(state: \.navigate01, action: \.navigate01) {
                    Navigate01View(store: store)
                }
            case .navigate02:
                if let store = store.scope(state: \.navigate02, action: \.navigate02) {
                    Navigate02View(store: store)
                }
            case .navigate03:
                if let store = store.scope(state: \.navigate03, action: \.navigate03) {
                    Navigate03View(store: store)
                }
            }
        }
        .onAppear{
            store.send(.onAppear)
        }
    
    }
}

struct defaultContent: View {
    @Bindable var store: StoreOf<NavigateStackRoot>
    
    var body: some View {
        VStack{
            Button("navigate02へ") {
                store.send(.toNavigate02Tapped)
            }
        }
        .navigationTitle("デフォルトのRoot View")
    }
}
