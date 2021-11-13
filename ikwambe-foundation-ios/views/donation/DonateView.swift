//
//  DonateView.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 13/11/2021.
//

import SwiftUI

struct DonateView: View {
    @ObservedObject var ikwambeAPI: IkwambeAPI = IkwambeAPI.shared
    private let projectId: String = "138eef32-5e38-4c7d-9c18-d8f22afca86a"
    @State private var amount = 0
    
    var body: some View {
        VStack {
          
            Text("By donating, you will help to bring clean water to Ikwambe. Please select an amount below").multilineTextAlignment(.center)
            
            VStack(spacing: 50) {
                HStack(spacing: 30) {
                    Button("€ 2.00") {
                        amount = 2
                    }
                    
                    Button("€ 5.00") {
                        amount = 5
                    }
                    
                    Button("€ 10.00") {
                        amount = 10
                    }
                }
                
                HStack(spacing: 30) {
                    Button("€ 20.00") {
                        amount = 20
                    }
                    
                    Button("€ 50.00") {
                        amount = 50
                    }
                    
                    Button("€ 100.00") {
                        amount = 100
                    }
                }
            }.padding(70)
            
            if (amount != 0) {
                Button("Donate € \(amount)") {
                    
                }
            }
            
            Spacer()
        }.navigationTitle("Donate")
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView()
    }
}
