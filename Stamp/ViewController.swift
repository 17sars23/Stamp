//
//  ViewController.swift
//  Stamp
//
//  Created by kawagishi on 2018/02/13.
//  Copyright © 2018年 juna Kawagishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //-----------------------------------
    // Setting variable
    //-----------------------------------
    var imageNameArray: [String] = ["hana","hoshi","onpu","shitumon"]
    var imageIndex: Int = 0
    
    @IBOutlet var haikeiImageView: UIImageView!
    var imageView: UIImageView!

    //-----------------------------------
    // Setting function
    //-----------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        //variable
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        //push Stamp
        if imageIndex != 0{
            
            //Stamp_image square
            imageView = UIImageView(frame: CGRect(x:0, y:0, width:40, height:40))
            
            //setting stamp
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image = image
            
            imageView.center = CGPoint(x:location.x, y:location.y)
            
            self.view.addSubview(imageView)
        }
    }
    
    
    //-----------------------------------
    // Original function
    //-----------------------------------
    @IBAction func selectFirst(){
        imageIndex = 1
    }
    
    @IBAction func selectSecond(){
        imageIndex = 2
    }

    @IBAction func selectThird(){
        imageIndex = 3
    }
    
    @IBAction func selectFourth(){
        imageIndex = 4
    }
    
    @IBAction func back(){
        self.imageView.removeFromSuperview()
    }
    
    //Select Background
    @IBAction func selectBackground(){
        //instance
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    //Photo library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        haikeiImageView.image = image
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(){
        //screen shot
        let rect: CGRect = CGRect(x:0, y:0, width:320, height:380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
    }
}

