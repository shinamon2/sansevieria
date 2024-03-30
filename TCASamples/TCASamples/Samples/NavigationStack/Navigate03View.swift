//
//  Navigate03View.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import SwiftUI
import ComposableArchitecture

struct Navigate03View: View {
    @Bindable var store: StoreOf<Navigate03Feature>
    
    var body: some View {
        VStack(spacing: 48){
            Text("03画面")
            
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
