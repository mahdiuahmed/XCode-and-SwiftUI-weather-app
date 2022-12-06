import SwiftUI
import Foundation
struct detailedWeather: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var weatherForView:Welcome?
    
    func getWeather(){
        let setLocation = detailedWeatherFetch.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = setLocationStringForWeather(location: setLocation!)
        getCurrentWeather(url: url,completion:{_ in
                            weatherForView = weather!})
    }
    var body: some View {
        ZStack(alignment: .top){
            Color(#colorLiteral(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)).edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
            VStack{
                Spacer()
                    .frame(height: 20)
                Image("cloudy")
                    .resizable()
                    .frame(width: 75, height: 75)
                Spacer()
                    .frame(height: 25)
                Text("DEATILED WEATHER")
                    .font(Font.custom("Montserrat-Bold", size: 26))
                    .foregroundColor(Color(#colorLiteral(red: 0.23, green: 0.54, blue: 0.49, alpha: 1.00)))
                VStack{
                    Text(detailedWeatherFetch)
                        .padding(.top, 10)
                        .font(Font.custom("Montserrat-SemiBold", size: 30))
                        .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                        .frame(alignment: .center)
                    VStack{
                        HStack{
                            Image("icons8-thermometer-100")
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                            Text(weatherForView?.main.feelsLike.description ?? "N/A" + "℃")
                                .font(Font.custom("Montserrat-SemiBold", size: 35))
                                .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                                .padding(.leading, 60)
                        }
                        .frame(
                            width:250,
                            alignment: .center)
                        HStack{
                            Image("icons8-dry-100")
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                            Text(weatherForView?.main.humidity.description ?? "N/A" + "%")
                                .font(Font.custom("Montserrat-SemiBold", size: 35))
                                .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                                .padding(.leading, 60)
                        }
                        .frame(
                            width:250,
                            alignment: .center)
                        HStack{
                            Image("icons8-pressure-gauge-100")
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                            Text(weatherForView?.main.pressure.description ?? "N/A")
                                .font(Font.custom("Montserrat-SemiBold", size: 35))
                                .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                                .padding(.leading, 60)
                        }
                        .frame(
                            width:250,
                            alignment: .center)
                        HStack{
                            Image("icons8-wind-gauge-100")
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .center)
                            Text(weatherForView?.wind.speed.description ?? "N/A")
                                .font(Font.custom("Montserrat-SemiBold", size: 35))
                                .foregroundColor(Color(#colorLiteral(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)))
                                .padding(.leading, 60)
                        }
                        .frame(
                            width:250,
                            alignment: .center)
                    }
                    .padding(.bottom, 50)
                    Button(action:{ presentationMode.wrappedValue.dismiss()
                    }){
                        Text("GO BACK")
                            .font(Font.custom("Montserrat-Bold", size: 16))
                            .foregroundColor(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)))
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color(#colorLiteral(red: 0.23, green: 0.54, blue: 0.49, alpha: 1.00)))
                                            .frame(width: 255, height: 50, alignment: .center))
                    }
                }
            }
        }.onAppear(perform: getWeather)
    }
}

struct detailedWeather_Previews: PreviewProvider {
    static var previews: some View {
        detailedWeather()
    }
}

