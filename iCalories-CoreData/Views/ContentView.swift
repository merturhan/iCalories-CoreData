//
//  ContentView.swift
//  iCalories-CoreData
//
//  Created by Mert Urhan on 9.03.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObject
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    
    @State private var showingAddView : Bool = false
    
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment:.leading){
                Text("\(Int(totalCaloriesToday())) Kcal (Today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                List{
                    ForEach(food) { food in
                        NavigationLink(destination: Text("\(food.calories)")){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(food.name!)")
                                        .bold()
                                    
                                    Text("\(Int(food.calories))") + Text(" calories").foregroundColor(.red)
                                }
                            }
                            Spacer()
                            Text(calcTimeSince(date: food.date!))
                                .foregroundColor(.gray)
                                .italic()
                        }
                    }.onDelete(perform: deleteFood)
                }.listStyle(.plain)
                
            }
            .navigationTitle("iCalories")
            .toolbar {
                
                //Add
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add Food", systemImage: "plus.circle")
                    }

                }
                
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }.sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
            
        }
        .navigationViewStyle(.stack)
        
    }
    
    private func totalCaloriesToday() -> Double{
        var caloriesToday : Double = 0
        
        for item in food{
            if(Calendar.current.isDateInToday(item.date!)){
                caloriesToday += item.calories
            }
        }
        
        return caloriesToday
    }
    
    private func deleteFood(offsets : IndexSet){
        withAnimation {
            offsets.map { food[$0] } .forEach(managedObject.delete)
            DataController().save(context: managedObject)
            }
        }
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
