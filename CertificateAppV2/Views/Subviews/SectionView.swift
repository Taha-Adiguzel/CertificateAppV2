//
//  SectionView.swift/Users/edaeren/bitirme/CertificateAppV4/CertificateAppV2/Views/Screens/CertificateView.swift
//  CertificateAppV2
//
//  Created by Eda Eren on 14.03.2024.
//

import SwiftUI

struct SectionView: View {
    //  @State var section: CertificateModel
    @ObservedObject var datas : DataArrayObject
    @ObservedObject var section1 : DataArrayObject
    
    
    var body: some View {
        //        VStack(alignment: .center, spacing: 0, content: {
        // MARK: HEADER
        /*
         HStack {
         
         Text(section.sectionName)
         .font(.subheadline)
         .fontWeight(.heavy)
         .foregroundColor(.primary) //changes the color depenging of the mode(dark mode or light mode)
         Spacer() //sola dayadik
         Image(systemName: "ellipsis") //sagdaki uc nokta
         .font(.headline) //belki buraya tiklayarak geri kalan sertifikalara bakilabilir. tumunu gor gibi
         }
         .padding(.all, 6)*/
        
        // MARK: IMAGE/SERTİFİKALAR
        
        ScrollView(.horizontal) {
            
            
            HStack{
                
                ForEach(section1.section1Array, id : \.self){data in
                    MiniCertificateView(data : data)
                }
                /*
                 ForEach(datas.dataArray, id : \.self){data in
                 MiniCertificateView(data : data)
                 }*/
            }
            
            
            /*
             ForEach(datas.dataArray, id : \.self){ section in
             
                 if (section.sectionID=="1") {
                     section1.section1Array.append(section)
                     HStack{
                         
                         ForEach(section1.section1Array, id : \.self){data in
                             MiniCertificateView(data : data)
                         }
             /*
              ForEach(datas.dataArray, id : \.self){data in
              MiniCertificateView(data : data)
              }*/
             
                     }
                 }//ifin
             /*
              if (section.sectionID=="2") {
              HStack{
              MiniCertificateView(data : data)
              }
              }//ifin*/
             
             }//foreachin*/
            
        }//scrollviewin
        
        //MARK: FOOTER
        //                .padding(.all,6)
        //        })//vstackin
        
    }
}



struct SectionView_Previews: PreviewProvider{
    
    static var previews: some View{
//        SectionView(section: <#T##CertificateModel#>, datas: DataArrayObject())
          SectionView(datas: DataArrayObject(), section1: DataArrayObject())
            .previewLayout(.sizeThatFits)
    }
}
