// // Simulating a database with local storage
// const users = JSON.parse(localStorage.getItem('users')) || [];

// // Registration Form Logic
// document.getElementById('registrationForm').addEventListener('submit', function (e) {
//     e.preventDefault();
//     const name = document.getElementById('name').value;
//     const age = parseInt(document.getElementById('age').value);
//     const email = document.getElementById('email').value;
//     const categories = Array.from(document.getElementById('categories').selectedOptions).map(opt => opt.value);

//     // Age validation
//     if (age < 10 || age > 80) {
//         showMessage('registration-message', 'Age must be between 10 and 80.', 'alert-danger');
//         return;
//     }

//     // Check if email already exists
//     if (users.find(user => user.email === email)) {
//         showMessage('registration-message', 'Email is already registered.', 'alert-danger');
//         return;
//     }

//     // Register user
//     users.push({ name, age, email, categories });
//     localStorage.setItem('users', JSON.stringify(users));
//     showMessage('registration-message', 'Registration successful! You can now log in.', 'alert-success');

//     // // Switch to login form after registration
//     // document.getElementById('registration-section').style.display = 'none';
//     // document.getElementById('login-section').style.display = 'block';
// });

// // // Login Form Logic
// // document.getElementById('loginForm').addEventListener('submit', function (e) {
// //     e.preventDefault();
// //     const email = document.getElementById('login-email').value;

// //     // Validate user credentials
// //     const user = users.find(user => user.email === email);
// //     if (!user) {
// //         showMessage('login-message', 'Email not registered.', 'alert-danger');
// //         return;
// //     }

// //     // Display user's book categories
// //     document.getElementById('login-section').style.display = 'none';
// //     document.getElementById('book-section').style.display = 'block';
// //     displayBooks(user.categories);
// // });

// // Display books based on selected categories
// // function displayBooks(categories) {
// //     const bookList = document.getElementById('book-list');
// //     bookList.innerHTML = ''; // Clear previous content

// //     categories.forEach(category => {
// //         const bookCard = document.createElement('div');
// //         bookCard.className = 'col-md-4 book-card';
// //         bookCard.innerHTML = `
// //             <div class="card">
// //                 <div class="card-body">
// //                     <h5 class="card-title">${category}</h5>
// //                     <p class="card-text">Explore the best books in ${category}.</p>
// //                 </div>
// //             </div>
// //         `;
// //         bookList.appendChild(bookCard);
// //     });
// // }

// // Helper function to display messages
// function showMessage(elementId, message, className) {
//     const messageDiv = document.getElementById(elementId);
//     messageDiv.textContent = message;
//     messageDiv.className = `alert ${className}`;
//     messageDiv.style.display = 'block';
// }



// Simulating a database with local storage
const users = JSON.parse(localStorage.getItem('users')) || [];

// Registration Form Logic
document.getElementById('registrationForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const name = document.getElementById('name').value;
    const age = parseInt(document.getElementById('age').value);
    const email = document.getElementById('email').value;
    const categories = Array.from(document.getElementById('categories').selectedOptions).map(opt => opt.value);
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm-password').value;

    // Field Validation
    if (age < 10 || age > 80) {
        showMessage('registration-message', 'Age must be between 10 and 80.', 'alert-danger');
        return;
    }

    if (password !== confirmPassword) {
        showMessage('registration-message', 'Passwords do not match.', 'alert-danger');
        return;
    }

    // Check if email already exists
    if (users.find(user => user.email === email)) {
        showMessage('registration-message', 'Email is already registered.', 'alert-danger');
        return;
    }

    // Register user
    users.push({ name, age, email, categories, password });
    localStorage.setItem('users', JSON.stringify(users));

    // Show success popup
    $('#registrationSuccessModal').modal('show');
});

// Show success message function
function showMessage(elementId, message, className) {
    const messageDiv = document.getElementById(elementId);
    messageDiv.textContent = message;
    messageDiv.className = `alert ${className}`;
    messageDiv.style.display = 'block';
}

// Redirect to login page when "Yes" is clicked on the popup
document.getElementById('redirectToLoginBtn').addEventListener('click', function () {
    window.location.href = 'login.html';
});











// Optional: Hide the message after 5 seconds
setTimeout(() => {
    const messageDiv = document.getElementById('registration-message');
    messageDiv.style.display = 'none';
}, 5000);
