//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    init(){}
}
