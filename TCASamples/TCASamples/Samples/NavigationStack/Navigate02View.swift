//
//  Navigate02View.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import SwiftUI
import ComposableArchitecture

struct Navigate02View: View {
    @Bindable var store: StoreOf<Navigate02Feature> = Store(initialState: Navigate02Feature.State()) {
        Navigate02Feature()
    }
    
    var body: some View {
        VStack(spacing: 48){
            Text("仕様は前画面と同じ")
            
            Button("何かアクション") {
                store.send(.anyTapped)
            }
            
            Button("次へ") {
                store.send(.nextTapped)
            }
        }
        .padding(.all, 48)
    }
}
