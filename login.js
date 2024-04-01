document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault();
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
  
    // Example authentication - replace this with your actual authentication logic
    if (username === 'user' && password === 'password') {
      alert('Login successful!');
      // Redirect to another page or perform other actions upon successful login
    } else {
      document.getElementById('error-message').innerText = 'Invalid username or password';
    }
  });

  