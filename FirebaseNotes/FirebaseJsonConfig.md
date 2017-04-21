####- Connect to firebase project
####- Install/update pod file
####- Upload json
####- Create ui
####- Iboutlets
####- tableView Data source

####- Var products: [String]( )
####- Firebase ref variables, etc.

In viewdidload

```swift
self.signedInStatus(isSignedIn: true)
```

###Config:

```swift

    func configureDatabase() {
        // reference or route to the database
        ref = FIRDatabase.database().reference() // connects app to database.
    }
    
    func configureStorage() {
        // configure storage using your firebase storage
        storageRef = FIRStorage.storage().reference()
    }
```

###Stop listening...

```swift
   deinit {
       //set up what needs to be deinitialized when view is no longer being used
       ref.child(“products”).removeObserver(withHandle: _refHandle)
   }
```

###in cellforrowat

```swift
//unpack message from firebase data snapshot
       let productSnapshot: FIRDataSnapshot! = products[indexPath.row]
       let product = productSnapshot.value as! [String:String]

let name = message[Product.ProductKey.text] ?? “[name]”
```

###Product icon
info tab > URLtypes at botton
- paste URL scheme (get from the googleplist... ReversedClientID)

###Create Listeners

in configureDatabase function...


```swift
_refHandle = ref.child(“allProducts”).observe(.childAdded) { (snapshot: FIRDataSnapshot) in
           self.productsFromFirebase.append(snapshot)
           self.mainTableView.insertRows(at: [IndexPath(row: self.productsFromFirebase.count - 1, section: 0)], with: .automatic)

       }
```


###OAUTH










