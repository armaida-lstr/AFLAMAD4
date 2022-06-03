//
//  NewsM.swift
//  AFLAMAD4
//
//  Created by MacBook Pro on 02/06/22.
//

import Foundation
import Combine
import SwiftyJSON

//https://newsapi.org/v2/everything?q=tesla&from=2022-05-02&sortBy=publishedAt&apiKey=6517a5b0391541659fc117934eadb591

class NewsModels : ObservableObject{
    @Published var data = [News] ()
    
    init(){
        let url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=41855beebf3449a99669da4062946153"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) {(data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data: data!)
            
            let items = json["articles"].array!
            
            for x in items {
                let title = x["title"].stringValue
                let description = x["description"].stringValue
                let imgurl = x["urlToImage"].stringValue
                
                
                DispatchQueue.main.async {
                    self.data.append(News(title: title, image: imgurl, description: description))
                }
            }
    }.resume()
  }
}


