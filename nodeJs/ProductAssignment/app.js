const express = require('express');
const bodyParser = require('body-parser');

const app = express();

// Middleware
app.set('view engine', 'pug');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

// In-memory product stores
let adminProducts = [
  { id: 1, name: 'Product 1', description: 'Admin product description', price: 10, availability: true },
];
let userProducts = [];

// Routes

// Home page - View all products (Admin + User)
app.get('/', (req, res) => {
  res.render('index', { adminProducts, userProducts });
});

// Admin page - Add products
app.get('/admin', (req, res) => {
  res.render('admin');
});

// Handle Admin adding a product
app.post('/admin/add-product', (req, res) => {
  const { name, description, price } = req.body;
  const newProduct = {
    id: adminProducts.length + 1,
    name,
    description,
    price: parseFloat(price),
    availability: true,
  };
  adminProducts.push(newProduct);
  res.redirect('/');
});

// User page - Add products
app.get('/user', (req, res) => {
  res.render('user');
});

// Handle User adding a product
app.post('/user/add-product', (req, res) => {
  const { name, description, price } = req.body;
  const newProduct = {
    id: userProducts.length + 1,
    name,
    description,
    price: parseFloat(price),
    availability: true,
  };
  userProducts.push(newProduct);
  res.redirect('/');
});

// User's own products page
app.get('/user-products', (req, res) => {
  res.render('user-products', { userProducts });
});

// Start the server
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
