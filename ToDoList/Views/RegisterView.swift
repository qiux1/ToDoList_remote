//
//  RegisterView.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        @State var firstName = ""
        @State var lastName = ""
        @State var email = ""
        @State var password = ""
        
        VStack{
            //Header
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       backgroundColor: Color.cyan)
            
            
            Form{
                TextField("First Name", text:$firstName)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Last Name", text:$lastName)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Email", text:$email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password", text:$password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButtonView(
                    title: "Create Account",
                    backgroundColor: Color.green){
                    //attemp register
                    }
                
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
