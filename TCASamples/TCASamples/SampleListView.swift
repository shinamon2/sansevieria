//
//  SampleListView.swift
//  TCASamples
//
//  Created by kaguser on 2024/03/30.
//

import SwiftUI

struct SampleListView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink("ナビゲーションスタック") {
                        NavigateView01()
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
