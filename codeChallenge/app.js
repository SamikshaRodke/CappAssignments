const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const productRoutes = require('./routes/productRoutes');

const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');

// In-memory data to simulate a database
const users = {
    admin: { username: 'admin', password: 'admin123', role: 'admin' },
    user: { username: 'user', password: 'user123', role: 'user' }
};

const products = [];

// Routes
app.use((req, res, next) => {
    req.users = users;
    req.products = products;
    next();
});

// Render homepage (index) with login options
app.get('/', (req, res) => {
    res.render('index', { error: null }); // No error message on initial load
});

// Render login page (admin or user)
app.get('/login/:role', (req, res) => {
    const { role } = req.params; // 'admin' or 'user'
    res.render('login', { error: null, role: role }); // No error message on initial page load
});


app.post('/login/admin', (req, res) => {
    const { username, password } = req.body;
    const user = req.users[username];

    if (user && user.password === password && user.role === 'admin') {
        return res.redirect('/admin/dashboard');
    } else {
        
        return res.render('login', { error: 'Invalid admin credentials', role: 'ADMIN' });
    }
});


app.post('/login/user', (req, res) => {
    const { username, password } = req.body;
    const user = req.users[username];

    
    if (user && user.password === password && user.role === 'user') {
        return res.redirect('/user/search');
    } else {
       
        return res.render('login', { error: 'Invalid user credentials', role: 'user' });
    }
});

app.use('/admin', productRoutes);
app.use('/user', productRoutes);

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
