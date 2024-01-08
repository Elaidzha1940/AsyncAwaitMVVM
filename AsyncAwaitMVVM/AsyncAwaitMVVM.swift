//  /*
//
//  Project: AsyncAwaitMVVM
//  File: AsyncAwaitMVVM.swift
//  Created by: Elaidzha Shchukin
//  Date: 08.01.2024
//
//  */

import SwiftUI

final class MyManagerClass {

    func getData() async throws -> String {
        "Some data."
    }
}

actor MyManagerActor {
    
    func getData() async throws -> String {
        "Some data."
    }
}

final class AsyncAwaitMVVMViewModel: ObservableObject {
    let mangerClass = MyManagerClass()
    let managerActor = MyManagerActor()
    
    func onCallToActionButtonPressed() {
        Task {
            
        }
    }
}

struct AsyncAwaitMVVM: View {
    @StateObject private var viewModel = AsyncAwaitMVVMViewModel()
    
    var body: some View {
        
        VStack {
            Button("Press me") {
                viewModel.onCallToActionButtonPressed()
            }
        }
    }
}

#Preview {
    AsyncAwaitMVVM()
}
