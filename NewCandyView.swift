//
//  NewCandyView.swift
//  FireBaseTest
//
//  Created by Jared Eldridge on 10/31/22.
//

import SwiftUI

struct NewCandyView: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State private var newCandy = ""
    
    var body: some View {
        VStack{
            TextField("Candy", text: $newCandy)
            
            Button {
                dataManager.addCandy(candyName: newCandy)
                
            } label: {
                Text("Save")
            }
            
        }
        .padding()
        
    }
}

struct NewCandyView_Previews: PreviewProvider {
    static var previews: some View {
        NewCandyView()
    }
}
