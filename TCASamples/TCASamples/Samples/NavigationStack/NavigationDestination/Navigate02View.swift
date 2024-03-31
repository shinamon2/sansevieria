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
            Text("02画面。")
            
            Button("何かアクション") {
                store.send(.anyTapped)
            }
            HStack(spacing: 48) {
                Button("戻る") {
                    store.send(.backTapped)
                }
                Button("次へ") {
                    store.send(.nextTapped)
                }
            }
        }
        .padding(.all, 48)
    }
}
