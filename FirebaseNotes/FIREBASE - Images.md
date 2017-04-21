# FIREBASE - Images

## gesture recognizer...
- way of making something thats not a button into a button
- Two ways:
	1. in storyboard, drag and drop onto UIIMAGE view
	or
	2. add tapgesture recognizer via view did load

##in Storyboard
- Add an imageView to storyboard & connect outlet to VC


##in ViewController

###in ViewDidLoad
// add tap gesture

```swift
profileImageView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView))
```
NOTE: 

- the handler will not autogen because it is a function to be created.
  - func handleSelectProfileImageView to be created in extension. 		- add print statement "Tap Gesture Working"

- Extend VC by adding extension outside the class

```swift
extension ViewController: UIImagePickerCOntrollerDelegate, UINavigationCOntrollerDelegate { 

// place gesture handler function here.
// set picker

}
```

##back in `viewDidLoad`

- add default image
- add tap gesutre ---> make sure to choose TAP!
- enable user interaction	
  
```swift
// enable user interaction
		profileImageView.isUserInteractionEnabled = true
```
##back in extension outside of the class
- methods to add
	- didFinishPickingMediaWithInfo... << sets up image picker function
		- 'info' is what we grab from the photo library
		- grabbing the keys and its values out of the dictionary
			- downcasting as an image because it is a string in the dictionary
	
	- imagePickerControllerDidCancel...
		- print("picker is canceled")
		- dismiss(animated: true, completion: nil)

##SUCCESS!! 
###User double taps the profile image >> photo gallery >> select image as profile image >> selected image populates as the user profile image.

## now to upload a new image to gallery!

in signUp function:

	- create alert	
	- create saveAction
	- createUser
	- create storageRef
	- create signIn

```swift
@IBAction func signup(_ sender: Any) {
       
       
       let alert = UIAlertController(title: "Signup", message: "Sign up", preferredStyle: .alert)
       
       let saveAction = UIAlertAction(title: "Save", style: .default) { action in
           let emailField = alert.textFields![0]
           let passwordField = alert.textFields![1]
           
           FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
               
               if error != nil {
                   print("no error")
                   return
               }
               
               guard let uid = user?.uid else { return }
               
               guard let email = user?.email else { return }
               
               // create reference to the firebase storage. 
             	// will need to update podfile with FireBase/Storage
               let storageRef = FIRStorage.storage().reference().child("profileImages").child("profileImageView.png")
             
               if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!) {
               
               storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
                   if error != nil {
                       print("print \(error)")
                   }
                   print("printing \(metadata) after put method")
                   
                   return
                   
               })
               }
               FIRAuth.auth()!.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!)
           }
           
       }
```


