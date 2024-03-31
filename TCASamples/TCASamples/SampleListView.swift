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
                    NavigationLink("NavigationStack:destination") {
                        Navigate01View(store: Store(initialState: Navigate01Feature.State(), reducer: {
                            Navigate01Feature()._printChanges()
                        }))
                    }
                    NavigationLink("NavigationStack:store") {
                        NavigateStackRootView(store: Store(initialState: NavigateStackRoot.State() , reducer: {
                            NavigateStackRoot()._printChanges()
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
