//
//  ViewController.swift
//  MonsterHunterTalismanScanner
//
//  Created by Alex Pendleton on 12/31/15.
//  Copyright © 2015 Alex Pendleton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var output: UITextView!
    
    @IBAction func runSignaled(sender: AnyObject?) {
        run()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        run()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func run() {
        let originalImage = UIImage(named: "SamplePhotos/TalismanDemo03.JPG")
        let scaledSource = originalImage! // scaleImage(originalImage!, maxDimension: 640)
        performImageRecognition(scaledSource)
    }
    
    func scaleImage(image: UIImage, maxDimension: CGFloat) -> UIImage {
        
        var scaledSize = CGSize(width: maxDimension, height: maxDimension)
        var scaleFactor: CGFloat
        
        if image.size.width > image.size.height {
            scaleFactor = image.size.height / image.size.width
            scaledSize.width = maxDimension
            scaledSize.height = scaledSize.width * scaleFactor
        } else {
            scaleFactor = image.size.width / image.size.height
            scaledSize.height = maxDimension
            scaledSize.width = scaledSize.height * scaleFactor
        }
        
        UIGraphicsBeginImageContext(scaledSize)
        image.drawInRect(CGRectMake(0, 0, scaledSize.width, scaledSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    func performImageRecognition(image: UIImage) {
        // 1
        let tesseract = G8Tesseract(language: "jpn")
        
        // 2
        //tesseract.language = "jpn"
        
        // 3
        //tesseract.engineMode = .TesseractCubeCombined
        tesseract.engineMode = .TesseractOnly
        // 4
        tesseract.pageSegmentationMode = .Auto
        
        // 5
        tesseract.maximumRecognitionTime = 60.0
        
        // 6
        tesseract.image = image.g8_blackAndWhite()
        tesseract.recognize()
        
        // 7
        let results = tesseract.recognizedText
        //textView.editable = true
        print("#####Printing results#####")
        print(results)
        print("#####end printed results#####")
        output.text = results
        // 8
        //removeActivityIndicator()
    }
}

