//
//  EditFoodView.swift
//  iCalories-CoreData
//
//  Created by Mert Urhan on 9.03.2023.
//

import SwiftUI

struct EditFoodView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EditFoodView_Previews: PreviewProvider {
    static var previews: some View {
        EditFoodView()
    }
}
