// Array to store available bakery items
const bakeryItems = [
  { id: 1, name: 'Chocolate Cake', price: 25.0, weight: '500g' },
  { id: 2, name: 'Blueberry Pastry', price: 5.5, weight: '150g' },
  { id: 3, name: 'Butter Croissant', price: 3.0, weight: '120g' },
  { id: 4, name: 'Strawberry Tart', price: 6.0, weight: '170g' }
];
 
// Cart array to store selected items
let cart = [];
 
// Function to render bakery items on the page
function renderItems() {
  const itemList = document.getElementById('item-list');
  itemList.innerHTML = ''; // Clear previous items
  
  bakeryItems.forEach(item => {
    const itemDiv = document.createElement('div');
    itemDiv.classList.add('item');
    itemDiv.innerHTML = `
${item.name}</h3>
      <p>Price: $${item.price.toFixed(2)}</p>
      <p>Weight: ${item.weight}</p>
<button onclick="addToCart(${item.id})">Add to Cart</button>
    `;
    itemList.appendChild(itemDiv);
  });
}
 
// Function to add item to the cart
function addToCart(itemId) {
const selectedItem = bakeryItems.find(item => item.id === itemId);
  cart.push(selectedItem);
  updateCart();
}
 
// Function to render the cart content on the page
function updateCart() {
  const cartDiv = document.getElementById('cart');
  const totalPriceDiv = document.getElementById('total-price');
  cartDiv.innerHTML = ''; // Clear previous cart content
 
  // Iterate over the cart items
  cart.forEach((item, index) => {
    const cartItemDiv = document.createElement('div');
    cartItemDiv.classList.add('cart-item');
    cartItemDiv.innerHTML = `
${item.name} - $${item.price.toFixed(2)}</p>
      <button onclick="removeFromCart(${index})">Remove</button>
    `;
    cartDiv.appendChild(cartItemDiv);
  });
 
  // Calculate total price
  const totalPrice = cart.reduce((sum, item) => sum + item.price, 0);
  totalPriceDiv.textContent = totalPrice.toFixed(2);
}
 
// Function to remove an item from the cart
function removeFromCart(index) {
  cart.splice(index, 1); // Remove item by index
  updateCart(); // Update the cart view
}
 
// Initialize the item list on page load
document.addEventListener('DOMContentLoaded', renderItems);