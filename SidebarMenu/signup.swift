//
//  signup.swift
//  Boxing
//
//  Created by Kushagra Gusain on 07/08/16.
//  Copyright © 2016 Kushagra. All rights reserved.
//

import Foundation
import UIKit

class Signup: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
        var signUpServerResponse = String()
   
    
    @IBAction func signup(sender: UIButton) {
        
        let myUrl = NSURL(string: "http:boxing.farcon.in/register");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";// Compose a query string
        
        var idSend = self.username.text
        var secretSend = self.password.text
        var nameSend = self.fullName.text
        
        let postString = "id=\(idSend!)&secret=\(secretSend!)&name=\(nameSend!)" ;
        
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
            
            print("responseStringsignup = \(responseString!)")
            
            self.signUpServerResponse =  (responseString!) as String
            
            //Let's convert response sent from a server side script to a NSDictionary object:
           
            /* do {
                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                
                if let parseJSON = myJSON {
                    
                    // Now we can access value of First Name by its key
                    let responseFromApi = parseJSON["firstName"] as? String
                    print("firstNameValue: \(responseFromApi)")
                }
            } catch {
                print(error)
            }*/
        }
        task.resume()
    
    }
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.fullName.delegate = self
        self.username.delegate = self
         self.password.delegate = self
    
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        
        if identifier == "signupToLogin" {
            
            var userName = self.username.text
            var secret = self.password.text
            var fullName = self.fullName.text
            
            
            if userName!.characters.count < 4 {
                var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 4 characters", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return false
                
            }
            else if !(userName >= "a" && userName <= "z") && !(userName >= "A" && userName <= "Z"){
                var alert = UIAlertView(title: "Invalid", message: "Username must contain one alphabet", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return false
            }
            else if secret!.characters.count < 8 {
                var alert = UIAlertView(title: "Invalid", message: "Password must be greater than 8 characters", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return false
            }
            else if fullName!.characters.count < 1{
                var alert = UIAlertView(title: "Invalid", message: "Enter a valid Full Name", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return false
            }
                else if signUpServerResponse == "falsexxx"{
                var alert = UIAlertView(title: "Invalid", message: "Account already exists", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            return false
            }
                
                
            else {
                var alert = UIAlertView(title: "Congrats", message: "Now you can login with your credentials", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                return true
            }
        }
        else if identifier == "toLogin"{
            return true
        }
        
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }

}
