//
//  AssignJuryView.swift
//  CertificateAppV2
//
//  Created by Eda Eren on 5.06.2024.
//

import SwiftUI

struct AssignJuryView: View {
    @ObservedObject var listOfJuries = UserArrayObject()
       @EnvironmentObject var array: ApplicantsArrayObject

       @State var juryExpert = UserModel(userID: "", userName: "", isAdmin: false, isJury: true, juryExpert: "")
       @Environment(\.presentationMode) var presentationMode

       let sectionID: String // Accepting sectionID as a parameter

    
    // Filtering juries based on sectionID
   
        var filteredJuries: [UserModel] {
            let filtered = listOfJuries.userArray.filter { $0.juryExpert == sectionID }
            // Debug print
            print("Filtered Juries for section \(sectionID): \(filtered.map { $0.userID })")
            return filtered
        }

    /*
    if let juryExpert = user.juryExpert, juryExpert == sectionName {
        return listOfJuries.section1Array // section1'de atiyorum yemekle alakali expert olan juriler tutulacak
    }*/
    // Function to filter juries based on sectionID
    /*
    @State private var filteredJuries: [UserModel] = []
        private func filterJuries() {
            filteredJuries = listOfJuries.userArray.filter { $0.juryExpert == sectionID }
        }
*/
    
    
    var body: some View {
       
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .fontWeight(.medium)

            })
            .accentColor(.black)
            .padding(.all, 20)
            .padding(.leading)
            Spacer()
            
        }//hstack
        ScrollView{
            Text("Admin will assign juries here")
            Text("Juries which can evaluate the application:")
            Text("Experts in .... section: \(sectionID)" )
            
                //ekrana istenilen alanda uzman jurilerin userID'leri getirilecek
                VStack{
                    if filteredJuries.isEmpty {
                                            Text("No juries found for section \(sectionID)")
                                                .foregroundColor(.red)
                    } else {
                        ForEach(filteredJuries, id: \.self) { jury in
                            Text(jury.userID)
                        }
                    }
                    /*
                    List(filteredJuries, id: \.self) { jury in
                        HStack{
                            Text(jury.userID)
                            Text("gelmio")
                        }
                        
                    }*/
                }
        }
        .onAppear {
                    // This ensures the view updates when it appears
            print("All Juries: \(listOfJuries.userArray.map { $0.userID })")
                    _ = filteredJuries
                }
        
    }
}

#Preview {
        AssignJuryView(sectionID: "exampleSection")
            .environmentObject(ApplicantsArrayObject.shared)
    
}
