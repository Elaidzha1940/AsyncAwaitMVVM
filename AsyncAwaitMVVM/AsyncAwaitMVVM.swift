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

@MainActor
final class AsyncAwaitMVVMViewModel: ObservableObject {
    let mangerClass = MyManagerClass()
    let managerActor = MyManagerActor()
    
    @Published private(set) var myData: String = "Starting text"
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    @MainActor
    func onCallToActionButtonPressed() {
       let task = Task {
           do {
               myData = try await mangerClass.getData()
           } catch {
               print(error)
           }
        }
        tasks.append(task)
    }
}

struct AsyncAwaitMVVM: View {
    @StateObject private var viewModel = AsyncAwaitMVVMViewModel()
    
    var body: some View {
        
        VStack {
            Button(viewModel.myData) {
                viewModel.onCallToActionButtonPressed()
            }
        }
        .onDisappear {
            
        }
    }
}

#Preview {
    AsyncAwaitMVVM()
}
