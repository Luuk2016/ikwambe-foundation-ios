//
//  DonationsOverview.swift
//  ikwambe-foundation-ios
//
//  Created by Luuk Kenselaar on 09/01/2022.
//

import SwiftUI

struct DonationsOverview: View {
    struct Message: Identifiable {
        var id: String { messageID }
        let messageID: String
        let author: String
        let amount: Double
        let datetime: String
        let message: String
    }
    
    @State var donationMessages: [Message] = [Message.init(messageID: "0", author: "John Doe", amount: 14.95, datetime: "23/11/2021, 15:10", message: "Goodluck with the project"), Message.init(messageID: "1", author: "Jane Roe", amount: 149.95, datetime: "28/11/2021, 10:00", message: "All the best")]
    
    var body: some View {
        ScrollView {
            ForEach(donationMessages) { donationMessage in
                VStack {
                    HStack {
                        VStack {
                            Text(donationMessage.author)
                            
                            Text(donationMessage.datetime)
                            
                            Text(donationMessage.message)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("\(donationMessage.amount)")
                        }
                    }
                    
                }.padding(.bottom)
            }
        }.navigationTitle(NSLocalizedString("donations", comment: ""))
            .padding(.horizontal, 15)
            .padding(.top, 15)
    }
}

struct DonationsOverview_Previews: PreviewProvider {
    static var previews: some View {
        DonationsOverview()
    }
}
