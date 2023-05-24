//
//  ContentView.swift
//  GetAge
//
//  Created by Gocement on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    @State private var calculateDateStr = ""
    @State private var presentAlert = false
    
    
    var body: some View {
        VStack {
            DatePicker(
                "Select Your Birthday",
                selection: $date,
                displayedComponents: [.date])
            .datePickerStyle(.wheel)
            .labelsHidden()
            
            Text(calculateDateStr)
            
            Button{
                let selecteDate = date
                let today = Date()
                
                if(selecteDate >= today){
                    presentAlert = true
                } else {
                    presentAlert = false
                    
                    let caledar = Calendar.current
                    let components = caledar.dateComponents([.year, .month, .day], from: date, to: Date())
                    
                    calculateDateStr = "Umur \(components.day ?? 0) Hari \(components.month ?? 0) Bulan \(components.year ?? 0) Tahun"
                }
            } label: {
                Text("Kalkulasi")
                    .padding(8)
                    .bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonBorderShape(.roundedRectangle)
            .buttonStyle(.borderedProminent)
            .tint(.orange)
        }
        .padding()
        .alert(isPresented: $presentAlert) {
            Alert(
                title: Text("Error").bold(),
                message: Text("Waktu tidak sesuai"),
                dismissButton: .cancel(Text("Oke Mengerti"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
