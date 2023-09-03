//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
