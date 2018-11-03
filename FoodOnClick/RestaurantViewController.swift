//
//  RestaurantViewController.swift
//  FoodOnClick
//
//  Created by abhay mone on 4/17/18.
//  Copyright © 2018 Philipp Gabriel. All rights reserved.
//

import UIKit
import WebKit
//import SQLite

class RestaurantViewController: UIViewController {


    @IBOutlet weak var OnClick: UIButton!
    @IBOutlet weak var webView: WKWebView!
    var food_item : String = ""
//    var database: Connection!
    
    override func viewDidLoad()
    {
       
        super.viewDidLoad()
        
//        do {
//                let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//
//                let fileUrl = documentDirectory.appendingPathComponent("user_searches").appendingPathExtension("sqlite3")
//
//                let database = try Connection(fileUrl.path)
//                self.database = database
//
//
//        }catch{
//
//            print(error)
//            }
        
        let url = URL(string: "https://www.google.com/maps")
        let request = URLRequest(url: url!)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.webView.frame = CGRect(x: 0, y :15, width : screenWidth, height : screenHeight)
        self.webView.load(request)
        
        run(after: 3)
        {

            var search_item : String
            //search_item = "mac n cheese near me"
            
            
            self.webView.evaluateJavaScript("document.getElementById('ml-searchboxinput').value = '\(self.food_item + " near me")'", completionHandler: {(value, error) in
                
//                print("\(value)")
//                print(error)
                
            })
            
            
            
            self.webView.evaluateJavaScript("document.getElementById('ml-searchboxinput').focus();", completionHandler: {(value, error) in
                
//                print("\(value)")
//                print(error)
                
            })
            
            
            self.webView.evaluateJavaScript("document.getElementsByClassName('ml-searchbox-right-side-button ml-search-on-blur-button')[0].click();", completionHandler: {(value, error) in
                
//                print("\(value)")
//                print(error)
                
            })
            
        }

    
    }

    func run(after seconds: Int, completion: @escaping () -> Void) {
        
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline)
        {
            completion()
            
        }
        
}
    

 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
