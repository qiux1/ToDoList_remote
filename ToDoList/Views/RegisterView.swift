//
//  RegisterView.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       backgroundColor: Color.cyan)
            
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
