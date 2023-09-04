//
//  LoginView.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: 15,
                           backgroundColor: Color.indigo)
                
                //Login Form
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Email Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButtonView(
                        title: "Login",
                        backgroundColor: Color.blue){
                        //action
                    }
                    
                }
                .offset(y: -50)
                
                
                //Create New Account
                VStack{
                    Text("New Around Here?")
                    NavigationLink("Creat An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
        Spacer()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
