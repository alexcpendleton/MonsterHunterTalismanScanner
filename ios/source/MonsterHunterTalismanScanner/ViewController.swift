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
        let originalImage = UIImage(named: "SamplePhotos/SingleTalisman03.JPG")
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
        let tesseract = G8Tesseract(language: "jpn")
        
        // 2
        //tesseract.language = "jpn"
        
        // 3
        //tesseract.engineMode = .TesseractCubeCombined
        tesseract.engineMode = .TesseractOnly
        // 4
        tesseract.pageSegmentationMode = .SparseTextOSD
        
        // 5
        tesseract.maximumRecognitionTime = 60.0

        // 6
        tesseract.image = image.g8_blackAndWhite()

        tesseract.charWhitelist = "弾薬節約盗み無効砲術攻撃ベルナ細菌学黒炎王爆破瓶追加裂傷属性耐性鈍器爆弾強化泡沫接撃瓶追加肉食剥ぎ取りチャンス護石王拡散弾追加耐寒寒冷適応調合数調合成功率連撃体術榴弾追加紅兜抜刀会心属性会心特殊会心会心強化だるま射法対防御DOWN防御重撃龍属性攻撃龍耐性食事属性攻撃属強瓶追加回避距離回避性能減気瓶追加達人溜め短縮運気剣術火属性攻撃火耐性狂撃耐性採取本気食いしん坊金雷公ガード性能ガード強化根性匠体力聴覚保護耐暑炎熱適応大雪主重撃弾強化野草知識英雄の盾ハチミツ腹減り氷属性攻撃氷耐性燼滅刃変則射撃KOココット効果持続跳躍節食装填数無心笛乗り茸食通常弾追加通常弾強化隻眼麻痺瓶追加麻痺散弾追加散弾強化観察眼貫通弾追加貫通弾強化毒毒瓶追加ポッケ研磨術底力強撃瓶追加精密射撃加護千里眼抜刀減気狩人速射逆上回復量回復速度反動装填速度岩穿荒鉤爪気配研ぎ師斬れ味納刀睡眠睡眠瓶追加矛砕高速設置闘魂減気攻撃気力回復スタミナ特殊攻撃気絶逆境号令采配痛撃雷属性攻撃雷耐性窮地捕獲運搬宝纏耐震無傷紫毒姫水属性攻撃水耐性気まぐれ白疾風広域風圧ユクモ1234567890+"
        
        
        tesseract.recognize()
        
        // 7
        let results = tesseract.recognizedText
        //textView.editable = true
        print("#####Printing results#####")
        print(results)
        print("#####end printed results#####")
        output.text = results
        withBoxes.image = tesseract.imageWithBlocks(nil, drawText: true, thresholded: false)
        // 8
        //removeActivityIndicator()
        
        
        //imageWithBlocks
        //sourceResolution
        //charWhitelist
    }
}

