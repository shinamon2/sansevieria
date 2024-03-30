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
        Text("NavigateStackRootView")
    }
}

//#Preview {
//    NavigateStackRootView()
//}
