//
//  ViewController.swift
//  SlideshowApp
//
//  Created by kuroda tatsuaki on 2018/01/21.
//  Copyright © 2018年 tatsuaki.kuroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
//    class ViewController: UIViewController,UIGestureRecognizerDelegate  {
    var fileName:String = ""
    var fileNames = [String]()
    var fileNumber = 0
    var fileCnt = 0
    var playF:Bool=false//初期停止
    // タイマー用の時間のための変数
    var timer_sec: Float = 0

    @IBOutlet weak var smallView: UIImageView!
    func setFilenames(){
       //プロジェクトに追加されたファイルを自動的に登録したいが、解らない
    fileNames=["IMG_1448.jpg","IMG_1454.jpg","IMG_1469.jpg","IMG_2461.jpg"]
        fileCnt = fileNames.count
 
    }
    
    // selector: #selector(updatetimer) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(timer: Timer) {
        if playF {
//          nextPhoto(Int())//ok
//          nextPhoto(fileNumber)//ok
//          nextPhoto(fileNumber)//ok
            nextPhoto(!)
      }
    }
    func dispSmallview(_ fn:String){
        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
 //       smallView.image = fileNames[0]
         smallView.image = #imageLiteral(resourceName: fn)
  /*      // UIImage インスタンスの生成
 //       let image = UIImage(named:fn)!
        
        // 画像の幅・高さの取得
        width = (smallView.image?.size.width)!
        height = (smallView.image?.size.height)!
        
        // UIImageView インスタンス生成
  //      imageView = UIImageView(image:image)
        
        // 画像サイズをスクリーン幅に合わせる
        scale = screenWidth / width
        //        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // 画像の中心をスクリーンの中心位置に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // view に ImageView を追加する
        self.view.addSubview(imageView)
    */
    }
   
    @IBOutlet weak var nextB: UIButton!
    @IBOutlet weak var lastB: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playPhoto(_ sender: Any) {
        if playF {
            playF=false;
            nextB.isEnabled = true
            lastB.isEnabled = true
            playButton.setTitle("再生", for: UIControlState.normal)
            
        }else{
            playF=true;
            nextB.isEnabled = false
            lastB.isEnabled = false
            playButton.setTitle("停止", for: UIControlState.normal)
            
        }
    }
    @IBAction func lastPhoto(_ sender: Any) {
        fileNumber -= 1
        if fileNumber < 0 {
            fileNumber = fileCnt-1
        }
        dispSmallview(fileNames[fileNumber])
    }
    @IBAction func nextPhoto(_ sender: Any) {
        fileNumber += 1
        if fileNumber > fileCnt-1{
            fileNumber = 0
        }
        dispSmallview(fileNames[fileNumber])
    }
    var imageView:UIImageView!
    var scale:CGFloat = 1.0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
 //       smallView.image = #imageLiteral(resourceName: "IMG_1448.jpg")
        
        setFilenames()
        dispSmallview(fileNames[fileNumber])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let bBigViewController:BigViewController = segue.destination as! BigViewController
        bBigViewController.fileName = fileNames[fileNumber]
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    /*
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }*/
}

