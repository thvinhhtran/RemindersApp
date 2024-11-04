//
//  ContentView.swift
//  RemindersApp
//
//  Created by Vinh on 30/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresented:Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Text("Hello world")
                Spacer()
                Button{
                    isPresented = true
                } label:{
                    Text("Add List")
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .font(.headline)
                }.padding()
            }.sheet(isPresented: $isPresented){
                NavigationView{
                    AddNewListView{name,color in
                        // save the list to database
                    }
                }
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews:some View{
        HomeView()
    }
}
