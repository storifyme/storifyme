//
//  WithCodeInitViewController.swift
//  StorifyMe  Samples
//
//  Created by Stefan Djordjevic on 8/24/22.
//

import UIKit
import StorifyMe
class WithCodeInitViewController: UIViewController {
    
    @IBOutlet weak var stackVoew: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Add parent view on view
        
        let widgetIdS = ["6824","6825","6826","6827","6828"]
        for i in 0..<widgetIdS.count
        {
            let storyView = StoryView()
            let settings = StorifyMeSettings(accountId: "mobile-native-test-4200158", accessToken: "cc9052ba-18f2-4906-8e51-be8adb6e89d5", usetWidgetId: widgetIdS[i])
            if i == 0
            {
                storyView.setStoryImageStyle(imageStyle: StoryImageStyle.init(imageShape: .square))

                storyView.setWidgetBackgroundColor(color: .blue)

                storyView.setWidgetBorderWidth(dimension: 8)

                storyView.setWidgetBorderColor(color: .red)

                storyView.setWidgetBorderRadius(dimension: 10)

                storyView.setWidgetTitleStyle(widgetTitleStyle: WidgetTitleStyle(titleIsVisible: true, titleFont: .systemFont(ofSize: 20), titleSize: 20, titleColor: .brown, titleAlign: .right))

                storyView.setWidgetTitleBorderWidth(dimension: 15)

                storyView.setWidgetTitleBorderColor(color: .green)

                storyView.setItemTextStyle(textStyle: StoryTextStyle(titleIsVisible: true, titleFont: .systemFont(ofSize: 10), titleSize: 10, titleColor: .purple))
            }
            else if i == 1
            {
                var conf = WidgetConfig()
                conf.setSegments(tags: ["vip","men"])
                storyView.setWidgetConfig(config: conf)
            }
            else if i == 2
            {
                var conf = WidgetConfig()
                conf.setQueryParameter(name: "cid", value: "1")
                storyView.setWidgetConfig(config: conf)
            }
            else if i == 3
            {
                var conf = WidgetConfig()
                conf.setQueryParameter(name: "cid", value: "2")
                storyView.setWidgetConfig(config: conf)
            }
            storyView.setSettings(settings: settings)
            storyView.load()
            stackVoew.addArrangedSubview(storyView)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WithCodeInitViewController : StoryEventProtocol
{
    func onAction(type: String, data: [String : Any]?) {
        print("On action \(type), with data \(data)")
    }
    
    func onEvent(type: String, data: [String : Any]?) {
        print("On event \(type), with data \(data)")
    }
    
    func onLoad(stories: [StoryModel]) {
        print("On load call \(stories)")
    }
    
    func onFail(error: Error) {
        print("On Fail call \(error)")
    }
    
    func onStoryOpened(story: StoryModel, index: Int) {
        print(" Open story  \(story)")
    }
    
    func onStoryClose(story: StoryModel) {
        print("On story close \(story)")
    }
    
    
}
