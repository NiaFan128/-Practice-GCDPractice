# GCDPractice

To make application more smooth and responsive, we use **GCD** (Grand Central Dispatch) to manage concurrent operations.

In this practice, will demo two ways of showing data, including **Semaphore** and **Group**.

* **Async** : Execute asynchronously with the ***async*** function, the method returns immediately. For instance, we apply the code when call the `api` function.

* **Main Queue** : To update the UI after completing work in a task on a concurrent Queue. It is important that we need to update the tableView after retrieving the data.


    DispatchQueue.main.async {

        guard let data = data, error == nil else {
            return
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            return
        }

        if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {

            guard let returnData = String(data: data, encoding: .utf8) else {
                return
            }

            completion(returnData, nil)
            print(returnData)

        }
    }

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



--------


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
