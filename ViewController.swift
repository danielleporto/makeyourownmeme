//
//  ViewController.swift
//  Make Your Own Meme 2.0
//
//  Created by Admin on 2018-01-16.
//  Copyright © 2018 admin. All rights reserved.
//  This app is used to generate memes. How it worrks is that the user can scroll through the different picture options, which are numbered, and then the user can choose which picture they want in the picker and press the button when they've found the right one. The user can then type in whatever they want their caption to be in the textfield, and hit the bottom button to create their meme.

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // Those extra data types are needed for the picker view.
   
    @IBOutlet weak var pictureGallery: UIScrollView! //The variable for the scroll view.
    
     var images : [UIImage] = [#imageLiteral(resourceName: "dissapointedbutnotsurprised3"),#imageLiteral(resourceName: "confused3"),#imageLiteral(resourceName: "uhuhhhhh2"),#imageLiteral(resourceName: "aaaaaahhhhhh2"),#imageLiteral(resourceName: "noyoudidnt2"),#imageLiteral(resourceName: "lovekermit2"),#imageLiteral(resourceName: "wendywilliams2"),#imageLiteral(resourceName: "winona2"),#imageLiteral(resourceName: "questionable2"),#imageLiteral(resourceName: "why2"),#imageLiteral(resourceName: "blank")] // The array of images filling the scroll view
    
    
    @IBOutlet weak var photoPicker: UIPickerView! //The variable for the scroll view.
    
    let picNumbers = [ "1", "2","3","4","5","6","7","8","9","10"] //Array for numbers within the picker
    
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var selectBtn: UIButton! //This button chooses the value of the picker
    
  
    
    override func viewDidLoad() {
       
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
       
        for i in 0..<images.count{
            let imageView = UIImageView()
            imageView.image = images[i]
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.pictureGallery.frame.width, height: self.pictureGallery.frame.width)
            pictureGallery.contentSize.width = pictureGallery.frame.width * CGFloat(i + 1)
            pictureGallery.addSubview(imageView)
        }
       // This for loop dictates how the scroll view works. Basically what it does is for every picture in the images array it places it within the frame of the scroll view, giving it the appropriate height and width.
    
        
    
    }
    var selectedPic : String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // This function determines how many columns there are within the picker. My picker only has one.
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picNumbers.count
    }
    
    // This function determines how many values are held in the picker. For mine it is the number of values in the numbers array.
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picNumbers[row]
    }
    
    // This fucntion determines what each value will be. In this case it is the values held in the numbers array.
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectBtn.setTitle(picNumbers[row], for: .normal)
        selectedPic = picNumbers[row]
    }
    
    // This function allows you to identify which value is currently selected in the row. I assigned this indentified value to another vaiable for use in the button function below.
    
    
    var chosenPic : String = ""
    @IBAction func choosePic(_ sender: UIButton) {
        chosenPic = selectedPic
    }
    
    // This function is used to identify the value within the picker when the button was pressed. This identified value is next used in the function below
    
    
    @IBAction func createButton(_ sender: UIButton) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var connectedPic : UIImage?
    func connection(){
        if chosenPic == "1"{
            connectedPic = #imageLiteral(resourceName: "dissapointedbutnotsurprised")
        }else if chosenPic == "2"{
            connectedPic = #imageLiteral(resourceName: "confused")
        }else if chosenPic == "3"{
            connectedPic = #imageLiteral(resourceName: "uhuhhhhh")
        }else if chosenPic == "4"{
            connectedPic = #imageLiteral(resourceName: "aaaaaahhhhhh")
        }else if chosenPic == "5"{
            connectedPic = #imageLiteral(resourceName: "noyoudidnt")
        }else if chosenPic == "6"{
            connectedPic = #imageLiteral(resourceName: "lovekermit")
        }else if chosenPic == "7"{
            connectedPic = #imageLiteral(resourceName: "wendywilliams")
        }else if chosenPic == "8"{
            connectedPic = #imageLiteral(resourceName: "winona")
        }else if chosenPic == "9"{
            connectedPic = #imageLiteral(resourceName: "questionable")
        }else if chosenPic == "10"{
            connectedPic = #imageLiteral(resourceName: "why")
        }
    }
    
    // This function determines which picture should be assigned to the connectedPic variable based on which value has been chosen.
    
    @IBOutlet weak var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newView = segue.destination as! secondController
        if (segue.identifier == "btn1"){
            newView.text = textField.text!
            connection()
            newView.endMeme = connectedPic
        }
    }
    
    // This function is used to transfer the data of which picture has been chosen as well which text has been entered into the textfield into the second view where they are combined to form the meme.
    

    

}

