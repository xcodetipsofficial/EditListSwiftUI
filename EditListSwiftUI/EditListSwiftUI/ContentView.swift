//
//  ContentView.swift
//  EditListSwiftUI
//
//  Created by Kyle Wilson on 2020-12-06.
//

import SwiftUI

struct Cat: Hashable {
    var id = UUID()
    var catName: String
    var image: String
}

var data = [
    Cat(catName: "Mohawk Cat", image: "mohawk-cat"),
    Cat(catName: "Eraser Cat", image: "eraser-cat"),
    Cat(catName: "Dark Cat", image: "dark-cat"),
    Cat(catName: "Macho Leg Cat", image: "macho-leg-cat"),
    Cat(catName: "Lion Cat", image: "lion-cat"),
    Cat(catName: "The Flying Cat", image: "the-flying-cat"),
    Cat(catName: "Island Cat", image: "island-cat"),
    Cat(catName: "King Dragon Cat", image: "king-dragon-cat"),
    Cat(catName: "Jamiera Cat", image: "jamiera-cat")
]

struct ContentView: View {
    
    @State var catData = [
        Cat(catName: "Mohawk Cat", image: "mohawk-cat"),
        Cat(catName: "Eraser Cat", image: "eraser-cat"),
        Cat(catName: "Dark Cat", image: "dark-cat"),
        Cat(catName: "Macho Leg Cat", image: "macho-leg-cat"),
        Cat(catName: "Lion Cat", image: "lion-cat"),
        Cat(catName: "The Flying Cat", image: "the-flying-cat"),
        Cat(catName: "Island Cat", image: "island-cat"),
        Cat(catName: "King Dragon Cat", image: "king-dragon-cat"),
        Cat(catName: "Jamiera Cat", image: "jamiera-cat")
    ]
    
    var body: some View {
        NavigationView {
            List {
                if catData.count != 0 {
                    ForEach(catData, id: \.self) { cat in
                        CatCell(cat: cat)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
            }
            .navigationBarTitle(Text("List"))
            .navigationBarItems(leading: Button(action: { addNewCar() }, label: {
                Text("Add")
            }), trailing: EditButton())
        }
        
    }
    
    private func addNewCar() {
        let randomNumber = Int.random(in: 0..<data.count)
        let cat = Cat(catName: data[randomNumber].catName, image: data[randomNumber].image)
        catData.append(cat)
    }
    
    func deleteItems(at offset: IndexSet) {
        catData.remove(atOffsets: offset)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        catData.move(fromOffsets: source, toOffset: destination)
    }
}

struct CatCell: View {
    var cat: Cat
    
    var body: some View {
        HStack {
            HStack {
                Image(cat.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text(cat.catName)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
