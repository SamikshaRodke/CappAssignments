const express = require('express');
const router = express.Router();

router.get('/dashboard', (req, res) => {
    res.render('dashboard');
});

router.get('/register', (req, res) => {
    res.render('registerProduct');
});

router.post('/register', (req, res) => {
    const { name, id, price, category, manufacturingDate, expirationDate } = req.body;
    req.products.push({ name, id, price, category, manufacturingDate, expirationDate });
    res.redirect('/admin/product-list');
});

router.get('/product-list', (req, res) => {
    res.render('productList', { products: req.products });
});

router.get('/search', (req, res) => {
    res.render('searchProduct');
});

router.post('/search', (req, res) => {
    const { name, category } = req.body;
    const results = req.products.filter(product => 
        (name && product.name.toLowerCase().includes(name.toLowerCase())) ||
        (category && product.category.toLowerCase().includes(category.toLowerCase()))
    );
    res.render('productList', { products: results });
});

module.exports = router;
