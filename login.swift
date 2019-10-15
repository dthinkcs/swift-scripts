    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: usernameEditField.text!, password: passwordEditField.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Login Successul")
                self.userId = (Auth.auth().currentUser?.uid)!
                let labTechniciansDB = Database.database().reference(withPath: "lab_technicians/\(self.userId)")
                
                labTechniciansDB.observeSingleEvent(of: .value, with: {
                    (snapshot) in
                    if snapshot.exists() {
                        print("Lab Tech")
                        self.performSegue(withIdentifier: "labTechnicianDashboard", sender: self)
                        
                    } else {
                        
                        print("User")
                        self.performSegue(withIdentifier: "patientDashboard", sender: self)
                    }
                 })
                
            }
        }
    }
