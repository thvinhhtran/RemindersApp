//
//  ContentView.swift
//  RemindersApp
//
//  Created by Vinh on 30/10/24.
//

import SwiftUI

struct HomeView: View {
    @FetchRequest(sortDescriptors: [])
    private var myListResults: FetchedResults<MyList>
    @State private var isPresented:Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                MyListView(myLists: myListResults)
                //Spacer()
                Button{
                    isPresented = true
                } label:{
                    Text("Add List")
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .font(.headline)
                }.padding()
            }.sheet(isPresented: $isPresented){
                NavigationView{
                    AddNewListView { name, color in
                        do {
                            try  ReminderService.saveMyList(name, color)
                        } catch {
                            print(error)
                        }
                       
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
            .environment(\.managedObjectContext,CoreDataProvider.shared.persistentContainer.viewContext)
    }
}
