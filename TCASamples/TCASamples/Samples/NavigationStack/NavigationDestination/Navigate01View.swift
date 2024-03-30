//
//  NavigateView01.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import SwiftUI
import ComposableArchitecture

struct Navigate01View: View {
    @Bindable var store: StoreOf<Navigate01Feature>
    
    var body: some View {
        VStack(spacing: 48){
            Text("この画面は「次へ」ボタンをタップすると、何か処理をして、その処理が成功だった場合に画面に遷移するサンプルです。")
            
            Button("Navigate02画面へ") {
                store.send(.next02Tapped)
            }
            
            Button("Navigate03画面へ") {
                store.send(.next03Tapped)
            }
        }
        .padding(.all, 48)
        .navigationDestination(item: $store.scope(state: \.navigate02, action: \.navigate02)) { _ in
            Navigate02View()
        }
        .navigationDestination(item: $store.scope(state: \.navigate03, action: \.navigate03)) { navigateStore in
            Navigate03View(store: navigateStore)
        }
    }
}
