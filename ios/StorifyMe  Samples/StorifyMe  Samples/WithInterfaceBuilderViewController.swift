//
//  WithInterfaceBuilderViewController.swift
//  StorifyMe  Samples
//
//  Created by Stefan Djordjevic on 8/24/22.
//

import UIKit
import StorifyMe
class WithInterfaceBuilderViewController: UIViewController {

    @IBOutlet weak var storyView: StoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //add delegate (optional)
        storyView.eventDelegate = self
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
extension WithInterfaceBuilderViewController : StoryEventProtocol
{
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
