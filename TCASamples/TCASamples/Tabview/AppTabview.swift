//
//  AppTabview.swift
//  transitionSample
//
//  Created by kaguser on 2024/03/30.
//

import ComposableArchitecture
import SwiftUI

struct AppTabview: View {
    
    var body: some View {
        TabView {
            Text("First Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
        }
    }
}
