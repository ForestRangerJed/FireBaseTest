//
//  ListView.swift
//  FireBaseTest
//
//  Created by Jared Eldridge on 10/31/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            List(dataManager.candy) { candy in
                Text(candy.name)
            }
            .navigationTitle("Halloween Candy")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:  {
                        showPopup.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $showPopup) {
                        NewCandyView()
                    }
                }
            }
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}


