//
//  ViewController.swift
//  FamMe
//
//  Created by C4Q on 9/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var backgroundIV: UIImageView!
    let imgUrlStr = "https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA05982_hires.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       getBackgroundImg()
        let capitalized: (String) -> (String) = {str in
            return str.capitalized
        }
     print( nonEscape(capitalized))
    }

    func getBackgroundImg() {
        NetworkHelper.shared.makeUrlRequest(imgUrlStr) { (data) in
            DispatchQueue.main.async {
                let image = UIImage.init(data: data)
                self.backgroundIV.image = image
            }
          
        }
    }
    
    func nonEscape(_ closure: (String) -> String) -> String {
        return closure("hello xian")
    }

}


