//
//  ContentView.swift
//  iOSDevProject1
//
//  Created by Ian Brown on 4/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCheck = ""
    @State private var numPeople = 2
    @State private var defaultPercentageIndex = 2
    let tipChoice = [10,15,20,25, 0]
    
    var totalPerPerson: Double {
        let orderTotal = Double(totalCheck) ?? 0
        let tipAmount  = Double(tipChoice[defaultPercentageIndex])
        let totalPeople = Double(numPeople+2)
        let dividedTip = orderTotal * (tipAmount/100)
        
        let grandTotal = Double((orderTotal + dividedTip)/totalPeople)
        return grandTotal
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Total Check ($)", text: $totalCheck).keyboardType(.decimalPad)
                    //expand to other currencies
                    Picker("Total Party", selection: $numPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Tip")) {
                    Picker("", selection: $defaultPercentageIndex) {
                        ForEach(0..<tipChoice.count){
                            Text("\(self.tipChoice[$0]) %")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total per Person")){
                    let result = String(format: "%.2f", totalPerPerson)
                    Text("$"+result)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
