//
//  BigViewController.swift
//  SlideshowApp
//
//  Created by kuroda tatsuaki on 2018/01/24.
//  Copyright © 2018年 tatsuaki.kuroda. All rights reserved.
//

import UIKit

class BigViewController: UIViewController {
    var fileName:String = ""
    var imageView:UIImageView!
    var scale:CGFloat = 1.0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    var startPoint:CGPoint!
    var endPoint:CGPoint!
    // タッチ開始時のUIViewのorigin
    var orgOrigin: CGPoint!
    // タッチ開始時の親ビュー上のタッチ位置
    var orgParentPoint : CGPoint!
  
 
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
  
        switch sender.state {
        case UIGestureRecognizerState.began:
            // タッチ開始:タッチされたビューのoriginと親ビュー上のタッチ位置を記録しておく
            orgOrigin = sender.view?.frame.origin
            orgParentPoint = sender.translation(in: self.view)
            break
        case UIGestureRecognizerState.changed:
            // 現在の親ビュー上でのタッチ位置を求める
            let newParentPoint = sender.translation(in: self.view)
            // パンジャスチャの継続:タッチ開始時のビューのoriginにタッチ開始からの移動量を加算する
            sender.view?.frame.origin.x = orgOrigin.x + newParentPoint.x - orgParentPoint.x
            sender.view?.frame.origin.y = orgOrigin.y + newParentPoint.y - orgParentPoint.y
            break
        default:
            break
        }
  }
 
    func dispBigview(_ fn:String){
        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // UIImage インスタンスの生成
        let image = UIImage(named:fn)!
        
        // 画像の幅・高さの取得
        width = image.size.width
        height = image.size.height
        
        // UIImageView インスタンス生成
        imageView = UIImageView(image:image)
        
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
        
        //       initImageView()
        // Do any additional setup after loading the view, typically from a nib.

    }
    func initImageView(_ fn:String){
        // UIImage インスタンスの生成
        // 画像はAssetsに入れてないのとjpgなので拡張子を入れます
        let image1:UIImage = UIImage(named:fn)!
        
        // UIImageView 初期化
        let imageView = UIImageView(image:image1)
        // 画像の幅・高さの取得
        let width = image1.size.width
        let height = image1.size.height
        
        // 画面の横幅を取得
   //     let screenWidth:CGFloat = view.frame.size.width
   //     let screenHeight:CGFloat = view.frame.size.height
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        // 画像サイズをスクリーン幅の３倍に合わせる
        scale = 2*screenWidth / width
        //        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        imageView.center = CGPoint(x:205,y:255)
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       // print(fileName1)
       //dispBigview(fileName)
        initImageView(fileName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
