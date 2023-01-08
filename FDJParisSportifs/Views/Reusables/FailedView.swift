//
//  FailedView.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import SwiftUI

struct FailedView: View {
    let reloadButton: Bool
    @Binding var loadingState : LoadingState
    
    var body: some View {
        VStack {
            Spacer()
            Text("Please try later")
            Spacer()
            if reloadButton {
                Button("Reload") {
                    loadingState = .loading
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
}

//struct FailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FailedView(reloadButton: true, loadingState: .loading)
//    }
//}
