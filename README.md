# GCDPractice

## Semaphore ##

1. Declare a constant `dispatchGroup` conform to `DispatchGroup()`


    let dispatchGroup = DispatchGroup()



2. Set a `run` function to define the performance time.



    func run(after seconds: Int, completion: @escaping () -> Void) {

        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }

    }


3. Apply to each group to control the interval time.
   As there are three groups in total, set the 2, 4, 6 seconds for each segement.
   Meanwhile, do not forget to `reloadData` in the function.


    self.run(after: 2, completion: {
        ...
        self.tableView.reloadData()
    })


- - -

* ref :

 - Grand Central Dispatch in Swift
https://medium.com/@nimjea/grand-central-dispatch-in-swift-fdfdd8b22d52

 - DispatchGroup: Waiting for Data | Swift 4, Xcode 9
http://kiloloco.com/courses/196880/lectures/3505854
