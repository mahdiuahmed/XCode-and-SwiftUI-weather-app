//
//  ContentView.swift
//  MND SwiftUI CW2 W1735919
//
//  Created by Mahdi Ahmed on 5/18/22.
//

import SwiftUI
import Foundation

struct homeScreenLocationSearch: View {
    @State private var searchThing = ""
    @State private var randomLocation1 = ""
    @State private var randomLocation2 = ""
    @State private var randomLocation3 = ""
    @State private var randomImages : Image?
    
    @State var randomImagesArray = ["2", "3", "4", "5", "6", "7", "8", "9"]
    
    
    func changeText(){
        searchThing = "233112"
    }
    
    func imagesRandom(){
        let randomInt = Int.random(in: 0..<10)
        
        randomImages = Image(String(randomInt))
    }
    

    
    var body: some View {
        ZStack(alignment: .top){
            
            Color(#colorLiteral(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                    .frame(height: 20)
                Image("cloudy")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Spacer()
                    .frame(height: 25)
                Text("WEATHERIO")
                    .font(Font.custom("Montserrat-Bold", size: 26))
                    .foregroundColor(Color("green"))
                
                
                VStack{
                    HStack{
                        TextField(
                            "SEARCH LOCATION",
                            text: $searchThing
                        ).padding()
                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                            .background(Color(#colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 0.15)))
                            .frame(width: 285, height: 40)
                            .cornerRadius(25)
                            .padding(.leading, 15)
                        
                        Button(action:{
                            changeText()
                            imagesRandom()
                        }){
                        Image("icons8-forward-button-100")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("green"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                
                VStack{
                    HStack{
                        Image("icons8-thermometer-100")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                            .foregroundColor(Color("navy"))
                    Text("x")
                        .font(Font.custom("Montserrat-SemiBold", size: 45))
                        .foregroundColor(Color("navy"))
                        .padding(.leading, 60)
                        
                    }
                    .frame(
                        width:250,
                        alignment: .center)
                    
                    HStack{
                        Image("icons8-dry-100")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                            .foregroundColor(Color("navy"))
                    Text("x")
                        .font(Font.custom("Montserrat-SemiBold", size: 45))
                        .foregroundColor(Color("navy"))
                        .padding(.leading, 60)
                        
                    }
                    .frame(
                        width:250,
                        alignment: .center)
                    .padding(.bottom, 50)
                }
               
                    Text("VIEW DEATILED WEATHER")
                        .font(Font.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("navy"))
                                        .frame(width: 255, height: 50, alignment: .center))
                        .padding(.bottom, 35)
                    
                    Text("VIEW 5-DAY WEATHER")
                        .font(Font.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("navy"))
                                        .frame(width: 255, height: 50, alignment: .center))
                        .padding(.bottom, 35)
                    
                    Text("CLEAR SEARCH LOCATION")
                        .font(Font.custom("Montserrat-Bold", size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color(#colorLiteral(red: 0.23, green: 0.54, blue: 0.49, alpha: 1.00)))
                                        .frame(width: 255, height: 50, alignment: .center))
                        
                
            }
            
        }
        
    }
    

    }
    
    }
    




struct homeScreenLocationSearch_Previews: PreviewProvider {
    static var previews: some View {
        homeScreenLocationSearch()
    }
}

