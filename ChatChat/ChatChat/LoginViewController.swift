/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBAction func loginDidTouch(sender: AnyObject) {
        var loginData: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("firebase", ofType: "plist") {
            loginData = NSDictionary(contentsOfFile: path)
        }

        if let data = loginData {
            let email = data.objectForKey("email")
            let password = data.objectForKey("password")
            FIRAuth.auth()?.signInWithEmail(email! as! String, password: password! as! String) { (user, error) in
                if error != nil { print(error!.description); return }
                self.performSegueWithIdentifier("LoginToChat", sender: user?.uid)
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)

        let navVc = segue.destinationViewController as! UINavigationController
        let chatVc = navVc.viewControllers.first as! ChatViewController

        chatVc.senderId = sender?.uid;
        chatVc.senderDisplayName = ""
    }
    
}

