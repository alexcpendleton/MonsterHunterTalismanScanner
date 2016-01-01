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
    @IBOutlet weak var withBoxes: UIImageView!
    
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
        let imageName =
            "SamplePhotos/SingleTalismanInverted03.JPG"
//            "SamplePhotos/CroppedTalismans03 copy.JPG"
        let originalImage = UIImage(named: imageName)
        let scaledSource = scaleImage(originalImage!, maxDimension: 640)

        let use = originalImage
        performImageRecognition(use!)
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
        let tesseract = G8Tesseract(language: "mhxjpn")
        
        // 2
        //tesseract.language = "jpn"
        
        // 3
        //tesseract.engineMode = .TesseractCubeCombined
        tesseract.engineMode = .TesseractOnly
        // 4
        tesseract.pageSegmentationMode = .SparseText
        
        // 5
        tesseract.maximumRecognitionTime = 60.0

        tesseract.setVariableValue("", forKey: "bazaar")
        // 6
        //UIGraphicsBeginImageContextWithOptions(bounds, NO, 1.0f)

        //let img = invertImage(image.g8_blackAndWhite())
        let img = image.g8_blackAndWhite()
        tesseract.image = img

        let uniqueChars = Set<String>(arrayLiteral: "離笛覚調心れ採睡令里動加刀観ユ宝沫追適火広地射化ナKト2学対本盾上雷矛采黒砕龍度闘風撃N効力設細泡鈍則御重法野いめま1剣復金逆斬能刃窮ル5眼磨氷燼石取の岩爆盗躍熱捕術拡纏紫ガ白散疾3痺0ー搬圧無置ツ9節匠聴り瓶86殊タ納気坊ド水会精O師知肉填数炎避狂跳だミハ短榴弾回ん耐識研ポ運ぐ強功絶通痛紅獲姫茸公傷W約率護ベ+コ剥隻毒果破菌D装ケモ裂眠常速攻人ク鉤草接7体大スッ千成特腹麻雪応狩滅薬寒冷号震味配穿王察食ぎ量み暑減る続根底砲変荒性乗兜雄達縮主持属ャ高防抜ン保連事魂域境チ反英貫し距4合爪溜密器")
        tesseract.charWhitelist = uniqueChars.joinWithSeparator("")

        tesseract.recognize()
        
        // 7
        let results = tesseract.recognizedText
        //textView.editable = true
        print("#####Printing results#####")
        print(results)
        print("#####end printed results#####")
        output.text = results

        let characterBoxes = tesseract.recognizedBlocksByIteratorLevel(G8PageIteratorLevel.Symbol)
        withBoxes.image = tesseract.imageWithBlocks(characterBoxes, drawText: true, thresholded: false)
        // 8
        //removeActivityIndicator()
        
    }
    
    func invertImage(target: UIImage) -> UIImage {
        /*
        let coreImage = CIImage(CGImage: target.CGImage!)
        let filter = CIFilter(name: "CIColorInvert")
        filter?.setValue(coreImage, forKey: kCIInputImageKey)
        let result = filter?.valueForKey(kCIOutputImageKey) as! CIImage
*/
        
        let ci = target.toCIImage()
        let result = ci.imageByApplyingFilter(CIFilter(name: "CIColorInvert"))
        return UIImage(CIImage: result)
    }
}

