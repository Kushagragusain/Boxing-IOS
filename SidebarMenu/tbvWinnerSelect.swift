//
//  tbvWinnerSelect.swift
//  Boxing
//
//  Created by Kushagra Gusain on 09/08/16.
//  Copyright © 2016 Kushagra. All rights reserved.
//

import Foundation
import UIKit
var jsoncount = Int()
class tbvWinnerSelect: UIViewController {
 
  
    @IBAction func rightPlayerScoreDec(sender: AnyObject) {
    }
    @IBAction func rightPlayerScoreInc(sender: AnyObject) {
    }
   
    @IBAction func leftPlayerScoreDec(sender: AnyObject) {
    }
    @IBAction func leftPlayerScoreInc(sender: AnyObject) {
    }
    @IBOutlet weak var rightPlayerScoreLow: UILabel!
    @IBOutlet weak var leftplayerScoreLow: UILabel!
    @IBOutlet weak var rightPlayerNameLow: UILabel!
    @IBOutlet weak var leftPlayerNameLow: UILabel!
    @IBOutlet weak var timeLeftShow: UILabel!
    @IBOutlet weak var roundNo: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var extraButton: UIBarButtonItem!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var leftPlayer: UIImageView!
    @IBOutlet weak var rightPlayer: UIImageView!
    @IBOutlet weak var leftPlayerName: UILabel!
    @IBOutlet weak var rightPlayerName: UILabel!
    @IBOutlet weak var playerOneName: UILabel!
    @IBOutlet weak var playerTwoName: UILabel!
    @IBOutlet weak var rOnePlOne: UILabel!
    @IBOutlet weak var rTwoPlOne: UILabel!
    @IBOutlet weak var rThreePlOne: UILabel!
    @IBOutlet weak var rFourPlOne: UILabel!
    @IBOutlet weak var rFivePlOne: UILabel!
    @IBOutlet weak var rSixPlOne: UILabel!
    @IBOutlet weak var rSevenPlOne: UILabel!
    @IBOutlet weak var rEightPlOne: UILabel!
    @IBOutlet weak var rNinePlOne: UILabel!
    @IBOutlet weak var rTenPlOne: UILabel!
    @IBOutlet weak var totPlOne: UILabel!
    @IBOutlet weak var rOnePlTwo: UILabel!
    @IBOutlet weak var rTwoPlTwo: UILabel!
    @IBOutlet weak var rThreePlTwo: UILabel!
    @IBOutlet weak var rFourPlTwo: UILabel!
    @IBOutlet weak var rFivePlTwo: UILabel!
    @IBOutlet weak var rSixPlTwo: UILabel!
    @IBOutlet weak var rSevenPlTwo: UILabel!
    @IBOutlet weak var rEightPlTwo: UILabel!
    @IBOutlet weak var rNinePlTwo: UILabel!
    @IBOutlet weak var rTenPlTwo: UILabel!
    @IBOutlet weak var totPlTwo: UILabel!
    @IBOutlet weak var fanPlayerOneName: UILabel!
    @IBOutlet weak var fanPlayerTwoName: UILabel!
    @IBOutlet weak var frOnePlOne: UILabel!
    @IBOutlet weak var frTwoPlOne: UILabel!
    @IBOutlet weak var frThreePlOne: UILabel!
    @IBOutlet weak var frFourPlOne: UILabel!
    @IBOutlet weak var frFivePlOne: UILabel!
    @IBOutlet weak var frSixPlOne: UILabel!
    @IBOutlet weak var frSevenPlOne: UILabel!
    @IBOutlet weak var freightPlOne: UILabel!
    @IBOutlet weak var frNinePlOne: UILabel!
    @IBOutlet weak var frTenPlOne: UILabel!
    @IBOutlet weak var ftotPlOne: UILabel!
    @IBOutlet weak var frOnePlTwo: UILabel!
    @IBOutlet weak var frTwoPlTwo: UILabel!
    @IBOutlet weak var frThreePlTwo: UILabel!
    @IBOutlet weak var frFourPlTwo: UILabel!
    @IBOutlet weak var frFivePlTwo: UILabel!
    @IBOutlet weak var frSixPlTwo: UILabel!
    @IBOutlet weak var frSevenPlTwo: UILabel!
    @IBOutlet weak var frEightPlTwo: UILabel!
    @IBOutlet weak var frNinePlTwo: UILabel!
    @IBOutlet weak var frTenPlTwo: UILabel!
    @IBOutlet weak var frtotPlTwo: UILabel!
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
       //fanScoreFunc()
        eventplayerfunc()
        roundScoreFunc()
        someValue = 0
        someRight = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            
            revealViewController().rightViewRevealWidth = 150
            extraButton.target = revealViewController()
            extraButton.action = "rightRevealToggle:"
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var counter = 120
    var timer = NSTimer()
    
    func timerAction() {
        counter = counter - 1
        if counter >= 0{
            timeLeftShow.text = "\(counter)"
        }
    }
    var someValue: Int = 0 {
        didSet {
            leftplayerScoreLow.text = "\(someValue)"
        }
    }
    var someRight: Int = 0 {
        didSet {
            rightPlayerScoreLow.text = "\(someRight)"
        }
    }
    
    func fanScoreFunc(){
        
        let myUrl = NSURL(string: "http:boxing.farcon.in/fanroundscore");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "1"
        
        let postString = "event_id=\(eventid)";
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            
            //print("response = \(response)")
            
            // Print out response body
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print("responseStringslivescoring = \(responseString!)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSArray
                for x in myJSON! {
                    
                    if let item = x as? [String: AnyObject] {
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            
                         
                            
                        })
                    }
                }
                
            }
                
            catch {
                print(error)
            }
        }
        task.resume()

        
    }
    var roundno = [String]()
    var playerids = [String]()
    var prediction = [String]()
    
    
    func roundScoreFunc(){
        
        let myUrl = NSURL(string: "http:boxing.farcon.in/roundscore");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "1"
        var clid = clientid!
        
        let postString = "event_id=\(eventid)&client_id=\(clid)";
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                print("errorwqqwwq=\(error)")
                return
            }
            
            // You can print out response object
            
            //print("response = \(response)")
            
            // Print out response body
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print("responseStringslivescoringqqq = \(responseString!)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSArray
                jsoncount = (myJSON?.count)!
               // print(self.jsoncount)
                for x in myJSON! {
                    
                    if let item = x as? [String: AnyObject] {
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            
                            self.roundno.append((item["round_no"] as? String)!)
                            self.prediction.append((item["prediction"] as? String)!)
                            self.playerids.append((item["player_id"] as? String)!)
                        
                        })
                    }
                    
                }
                print(self.playerids)
               self.roundscoring(self.roundno,predictlast: self.prediction,playerlast: self.playerids)
            }
                
            catch {
                print(error)
            }
        }
        task.resume()
        
        
    }
    
    var idplayer1 = String()
    var idplayer2 = String()
    var nameplayer1 = String()
    var nameplayer2 = String()
    
    func eventplayerfunc(){
        
        let myUrl = NSURL(string: "http:boxing.farcon.in/eventplayer");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var eventid = "2"
        
        let postString = "event_id=\(eventid)";
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            
            //print("response = \(response)")
            
            // Print out response body
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            //print("responseStringlogin = \(responseString!)")
            
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSArray
                
                
                if let item = myJSON?[0] as? [String: AnyObject] {
                    
                        self.nameplayer1 = (item["name"]! as? String)!
                        // print(item["name"]!)
                        var x = item["id"] as! NSNumber
                        self.idplayer1 = "\(x)"
                  
                }
                if let item = myJSON?[1] as? [String: AnyObject] {
                    
                        self.nameplayer2 = (item["name"]! as? String)!
                        // print(item["name"]!)
                        var x = item["id"] as! NSNumber
                        self.idplayer2 = "\(x)"
                 
            }
            
                
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
   /* var roundn = [String]()
    var playeri = [String]()
    var predictions = [String]()
    
    func extractfromround(round:String,predict:String,player:String){
       
        roundn.append(round)
    
        playeri.append(player)
        
        predictions.append(predict)
    }*/
   
    func roundscoring(roundlast:[String],predictlast:[String],playerlast:[String]){
        
        print(roundlast)
        print(predictlast)
        print(playerlast)
        print(idplayer1)
        print(idplayer2)
     
        
        for(var i=0;i<jsoncount;i++){
        
            
         //   if playerlast[0] == idplayer1 {
                var i = 0
                var r = roundlast[i]
            
            switch r {
            case "1"  :
                print("1")
                rOnePlOne.text = predictlast[i]
            case "2" :
                print("1")
                rTwoPlOne.text = predictlast[i]
            case "3" :
                 print("1")
                rThreePlOne.text = predictlast[i]
            case "4"  :
                 print("1")
                rFourPlOne.text = predictlast[i]
            case "5"  :
                 print("1")
                rFivePlOne.text = predictlast[i]
            case "6" :
                 print("1")
                rSixPlOne.text = predictlast[i]
            case "7"  :
                 print("1")
                rSevenPlOne.text = predictlast[i]
            case "8"  :
                 print("1")
                rEightPlOne.text = predictlast[i]
            case "9"  :
                 print("1")
                rNinePlOne.text = predictlast[i]
            case "10" :
                 print("1")
               rTenPlOne.text = predictlast[i]
                
            default :
                 print("1")
                rOnePlOne.text = "-"
            }
        
       // }
       // if playerlast[1] == "3" {
                var j = 1
            var q = roundlast[j]
        
            switch q {
            case "1"  :
                 print("2")
                rOnePlTwo.text = predictlast[j]
            case "2"  :
                  print("2")
                rTwoPlTwo.text = predictlast[j]
            case "3" :
                  print("2")
                rThreePlTwo.text = predictlast[j]
            case "4"  :
                  print("2")
                rFourPlTwo.text = predictlast[j]
            case "5"  :
                  print("2")
                rFivePlTwo.text = predictlast[j]
            case "6" :
                  print("2")
                rSixPlTwo.text = predictlast[j]
            case "7"  :
                  print("2")
                rSevenPlTwo.text = predictlast[j]
            case "8"  :
                  print("2")
                rEightPlTwo.text = predictlast[j]
            case "9"  :
                  print("2")
                rNinePlTwo.text = predictlast[j]
            case "10" :
                  print("2")
                rTenPlTwo.text = predictlast[j]
                
            default :
                  print("2")
                rOnePlTwo.text = "-"
            }
              
       // }
    }
}

}