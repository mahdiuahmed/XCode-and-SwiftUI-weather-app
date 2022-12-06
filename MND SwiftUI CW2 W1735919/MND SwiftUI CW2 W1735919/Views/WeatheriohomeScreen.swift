import SwiftUI
import Foundation
import CoreLocation

var detailedWeatherFetch: String = ""

struct homeScreenLocationSearch: View {
    @State var showAlert = false
    @State var searchText: String = ""
    @State var weatherForView:Welcome?
    @State private var searchTextPlaceholder = ""
    @State var searchIcon = "icons8-forward-button-100"
    
    func getText() {
        if searchText.isEmpty{
            searchTextPlaceholder = "PLEASE ENTER A LOCATION"
        }
        else{
            detailedWeatherFetch = searchText
            getWeather()
        }
        
        func getWeather(){
            let setLocation = detailedWeatherFetch.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let url = setLocationStringForWeather(location: setLocation!)
            getCurrentWeather(url: url,completion:{_ in
                                weatherForView = weather!})
        }
    }
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                Color(#colorLiteral(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)).edgesIgnoringSafeArea(.all)
                    .navigationBarHidden(true)
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
                                searchTextPlaceholder,
                                text: $searchText
                            ).padding()
                            .font(Font.custom("Montserrat-SemiBold", size: 16))
                            .background(Color(#colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 0.15)))
                            .frame(width: 285, height: 40)
                            .cornerRadius(25)
                            .padding(.leading, 15)
                            Button(action:{
                                getText()
                            }){
                                Image(searchIcon)
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
                                Text(weatherForView?.main.feelsLike.description ?? "N/A")
                                    .font(Font.custom("Montserrat-SemiBold", size: 35))
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
                                Text(weatherForView?.main.humidity.description ?? "N/A")
                                    .font(Font.custom("Montserrat-SemiBold", size: 35))
                                    .foregroundColor(Color("navy"))
                                    .padding(.leading, 60)
                            }
                            .frame(
                                width:250,
                                alignment: .center)
                            .padding(.bottom, 50)
                        }
                        NavigationLink(destination: detailedWeather()){
                            Text("VIEW DEATILED WEATHER")
                                .font(Font.custom("Montserrat-Bold", size: 16))
                                .foregroundColor(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("navy"))
                                                .frame(width: 255, height: 50, alignment: .center))
                                .padding(.bottom, 35)
                        }
                        Button(action:{
                            searchText = ""
                        }){
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
    }
}

struct homeScreenLocationSearch_Previews: PreviewProvider {
    static var previews: some View {
        homeScreenLocationSearch()
    }
}



