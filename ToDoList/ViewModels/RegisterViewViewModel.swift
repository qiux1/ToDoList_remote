//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
}
