//
//  AddView.swift
//  TodoList
//
//  Created by Alperen Sarışan on 10.09.2024.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.gray).opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
