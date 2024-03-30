//
//  SampleListView.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import SwiftUI
import ComposableArchitecture

struct SampleListView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink("ナビゲーションスタック") {
                        Navigate01View(store: Store(initialState: Navigate01Feature.State(), reducer: {
                            Navigate01Feature()
                        }))
                    }
                    NavigationLink("モーダル") {
                        // TODO:
                    }
                    NavigationLink("アラート") {
                        // TODO:
                    }
                } header: {
                    Text("画面遷移系のサンプル")
                }
            }
        }
    }
}

#Preview {
    SampleListView()
}
