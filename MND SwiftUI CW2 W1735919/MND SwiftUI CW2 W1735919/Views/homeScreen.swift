//
//  ContentView.swift
//  MND SwiftUI CW2 W1735919
//
//  Created by Mahdi Ahmed on 5/18/22.
//

import SwiftUI

struct homeScreen: View {
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
    @ObservedObject var networkManager = ifConnectedNetwork()
    
    var body: some View {
        
        if !networkManager.isConnected{
            networkError()
        }
        
        ZStack(alignment: .top){
            
            Color(#colorLiteral(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)).edgesIgnoringSafeArea(.all)
            
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
                    .foregroundColor(Color(#colorLiteral(red: 0.23, green: 0.54, blue: 0.49, alpha: 1.00)))
                
                
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
                
                
                Text("SUGGESTED LOCATIONS")
                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                    .padding()
                
                
                VStack{
                    Text("x")
                        .font(Font.custom("Montserrat-SemiBold", size: 24))
                        .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                        .padding(.leading, 15)
                        .padding(.bottom, 10)
                        .frame(
                            width:365,
                            alignment: .leading
                        )
                    Text("x")
                        .font(Font.custom("Montserrat-SemiBold", size: 24))
                        .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                        .padding(.leading, 15)
                        .padding(.bottom, 10)
                        .frame(
                            width:365,
                            alignment: .leading
                        )
                    Text("x")
                        .font(Font.custom("Montserrat-SemiBold", size: 24))
                        .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                        .padding(.leading, 15)
                        .padding(.bottom, 10)
                        .frame(
                            width:365,
                            alignment: .leading
                        )
                }
                    randomImages?
                        .resizable()
                        .frame(width: 270, height: 270)
                        .cornerRadius(25)
                        
                
            }
            
        }
        
    }
    

    }
    
    }
    




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        homeScreen()
    }
}

