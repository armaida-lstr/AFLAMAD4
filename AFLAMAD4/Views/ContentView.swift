//
//  ContentView.swift
//  AFLAMAD4
//
//  Created by MacBook Pro on 02/06/22.
//



////static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=41855beebf3449a99669da4062946153")
//static let searchurl"https://newsapi.org/v2/everything?sortBy=popularity&apiKey=41855beebf3449a99669da4062946153&q="


import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        
        Home().navigationTitle("News")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View{
    @ObservedObject var News = NewsModels()
    
    var body : some View{
        Text("The Sire News")
        List(News.data){x in
           
              //  data desk
                HStack {
                    VStack (alignment: .leading){
                    Text(x.title).fontWeight(.bold)
                    Text(x.description).font(.caption).frame(width: 110, height: 155)
                    }
                    VStack (alignment: .trailing) {
                        if x.image != "" {
                            WebImage(url: URL(string: x.image)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 170)
                                .background(Color.secondary)
                                .cornerRadius(10)
                        }else{
                            Image("Loading").resizable().frame(width: 120, height: 170).cornerRadius(10)
                        }
                }
            }
        }
    }
    
}
