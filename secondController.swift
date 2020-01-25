//
//  secondController.swift
//  Make Your Own Meme 2.0
//
//  Created by Admin on 2018-01-23.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class secondController: UIViewController {

    @IBOutlet weak var memePic: UIImageView!
   
    var text : String = ""  // This variabe is used during the transfer of data from the previous view
    @IBOutlet weak var label: UILabel!
    
    var endMeme : UIImage? // This variable is also used during the transfer of data.
    
    @IBOutlet weak var memeView: UIImageView! // The variable for the image view that contains the meme.
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = text
        
        memeView.image = endMeme 
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func savePhoto(_ sender: AnyObject) {
        let imageData = UIImagePNGRepresentation(memeView.image!)
        let compressedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
        let alert = UIAlertController(title: "Saved!", message: "Your image has been saved!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // This function alows the user to save the image within the memeView. Unfortunately I was unable to figure out how to combine the image and the caption for the meme into one entity, but I figured I would leave it in since I had already done it and it successfully saves the image itself.
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
