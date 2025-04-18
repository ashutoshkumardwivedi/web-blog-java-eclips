<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style>



      /* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 2;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Fix Modal Width */
.modal-content {
    background: white;
    padding: 25px;
    border-radius: 12px;
    width: 90%; /* Set a relative width */
    max-width: 400px; /* Prevent it from stretching */
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    position: relative;
}

/* Close Button */
.close {
    color: red;
    font-size: 22px;
    cursor: pointer;
    position: absolute;
    top: 10px;
    right: 15px;
}

form {
    display: flex;
    flex-direction: column;
    gap: 5px; /* Adds space between input fields */
    align-items: center; /* Centers content */
}

input {
    width: 100%;
    padding: 12px;
    border: 2px solid black;
    border-radius: 8px;
    font-size: 16px;
    background: rgba(255, 255, 255, 0.2);
    color: #222;
    outline: none;
    transition: 0.3s ease-in-out;
}

input:focus {
    border-color: #007BFF;
    background: rgba(255, 255, 255, 0.3);
    box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
}

.submit-btn {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #007BFF, #0056b3);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    font-weight: bold;
    transition: 0.3s ease-in-out;
    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
}


/* Hover Effect */
.submit-btn:hover {
    background: linear-gradient(135deg, #0056b3, #003f80);
    box-shadow: 0 6px 12px rgba(0, 123, 255, 0.5);
}

/* Toggle Links */
.toggle-text {
    margin-top: 12px;
    font-size: 14px;
    color: #222; /* Changed from white to dark gray */
}

.toggle-text a {
    color: #FFD700;
    cursor: pointer;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s ease-in-out;
}

/* Hover effect */
.toggle-text a:hover {
    color: #FFA500;
    text-decoration: underline;
}


    </style>
</head>
<body>

  <!-- Login/Register Modal -->
    <div id="authModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>

			  <!-- Login Form -->
			<div id="loginForm">
			    <h2>Login</h2>
			    <form action="LoginServlet" method="post">
			        <input type="email" name="email" placeholder="Email Address" required><br>
			        <input type="password" name="password" placeholder="Password" required><br>
			        <button type="submit" class="submit-btn">Login</button>
			    </form>
			    <p class="toggle-text">If you have no account, 
			        <a href="javascript:void(0)" onclick="openModal('register')">Sign Up</a>
			    </p>
			</div>


			<!-- Register Form -->
			<div id="registerForm" style="display: none;">
			    <h2>Register</h2>
			    <form action="RegisterServlet" method="post">
			        <input type="text" name="fullName" placeholder="Full Name" required><br>
			        <input type="email" name="email" placeholder="Email Address" required><br>
			        <input type="password" name="password" placeholder="Password" required><br>
			        <input type="password" name="confirmPassword" placeholder="Confirm Password" required><br>
			        <button type="submit" class="submit-btn">Sign Up</button>
			    </form>
			    <p class="toggle-text">Already have an account? 
			        <a href="javascript:void(0)" onclick="openModal('login')">Login</a>
			    </p>
			</div>


        </div>
    </div>

<script>
    // Open the modal and show the specified form (login or register)
    function openModal(formType) {
        document.getElementById("authModal").style.display = "flex";

        if (formType === 'login') {
            document.getElementById("loginForm").style.display = "block";
            document.getElementById("registerForm").style.display = "none";s
        } else {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("registerForm").style.display = "block";
        }
    }

    // Close the modal
    function closeModal() {
        document.getElementById("authModal").style.display = "none";
    }
    // Check if there's an error message and open the register modal
 

    // Close modal if clicked outside the modal content
  //  window.onclick = function(event) {
      //  let modal = document.getElementById("authModal");
   //     if (event.target === modal) closeModal();
  //  }

    // Prevent form submission from refreshing the page
   // document.querySelectorAll("form").forEach(form => {
       // form.addEventListener("submit", function(event) {
            //event.preventDefault(); // Prevent default form submission
           // alert("Form submitted successfully!"); // For testing
      //  });
   // });

    // Ensure modal does NOT open on page load
    window.onload = function () {
        closeModal();
    };
</script>
</body>
</html>