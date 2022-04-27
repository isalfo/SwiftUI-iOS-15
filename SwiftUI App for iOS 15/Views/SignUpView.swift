//
//  SignUpView.swift
//  SwiftUI App for iOS 15
//
//  Created by Gonzalo Alfonso on 27/04/2022.
//

import SwiftUI

struct SignUpView: View {
  @State var email: String = ""
  @State var password: String = ""
  
    var body: some View {
      VStack(alignment: .leading, spacing: 16) {
        Text("Sign Up")
          .font(.largeTitle).bold()
        Text("Access 120+ hours of courses, tutorials and livestreams")
          .font(.headline)
        TextField("Email", text: $email)
          .inputStyle(icon: "mail")
          .textContentType(.emailAddress)
          .keyboardType(.emailAddress)
          .autocapitalization(.none)
          .disableAutocorrection(true)
        SecureField("Password", text: $password)
          .inputStyle(icon: "lock")
          .textContentType(.password)
        Button { } label: {
          Text("Create an account")
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.angular)
        .tint(.accentColor)
        .controlSize(.large)
        
        Group {
          Text("By clicking on ")
          + Text("_Create an account_").foregroundColor(.primary.opacity(0.7))
          + Text(", you agree to our **Terms of Service** and **[Privacy Policy](https://designcode.io)**")
          
          Divider()
          
          HStack {
            Text("Already have an account?")
            Button{} label: {
              Text("**Sign in**")
            }
          }
        }
        .font(.footnote)
        .foregroundColor(.secondary)
        .accentColor(.secondary)
        
      }
      .padding(20)
      .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
      .strokeStyle(cornerRadius: 30)
      .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
      .padding(20)
      .background(
        Image("Blob 1").offset(x: 200, y: -100)
      )
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
