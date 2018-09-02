# GCDPractice


## Group ##

1. Declare a constant `dispatchGroup` conform to `DispatchGroup()`


    let dispatchGroup = DispatchGroup()



2. Set a `run` function to define the performance time.



    func run(after seconds: Int, completion: @escaping () -> Void) {

        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }

    }

3. To clarify each segement of showing data, organizing and dividing into three function `getGroupA()`, `getGroupB()`, `getGroupC()`.

4. Insert the `dispatchGroup.enter()` at the beginning of `getGroup()` function and `self.dispatchGroup.leave()` after appending the data.


    func getGroupA() {
        dispatchGroup.enter()
        api.getNameAPI { (data, error) in
            print(data!)
            self.run(after: 2, completion: {
                self.school = data!
                self.dispatchGroup.leave()
            })
        }
    }


5. Call the `dispatchGroup.notify(queue: .main)` function after executing the `getGroup()` function.


    dispatchGroup.notify(queue: .main) {
        print("reloading data")
        self.tableView.reloadData()
    }

- - -

* ref :

 - Grand Central Dispatch in Swift
https://medium.com/@nimjea/grand-central-dispatch-in-swift-fdfdd8b22d52

 - DispatchGroup: Waiting for Data | Swift 4, Xcode 9
http://kiloloco.com/courses/196880/lectures/3505854
