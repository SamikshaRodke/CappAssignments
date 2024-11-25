const fetchButton = document.getElementById('fetch');
const userList = document.getElementById('userList');

async function fetchUserData() {
    try {
        
        const response = await fetch('https://fakestoreapi.com/products?limit=5');
        
        
        if (!response.ok) {
            throw new Error('Failed to fetch data');
        }

       
        const products = await response.json();

       
        userList.innerHTML = '';


        products.forEach(product => {
            const tr = document.createElement('tr');
            

            const tdId = document.createElement('td');
            tdId.textContent = product.id;
            tr.appendChild(tdId);

            const tdTitle = document.createElement('td');
            tdTitle.textContent = product.title;
            tr.appendChild(tdTitle);
    
            userList.appendChild(tr);
        });
    } catch (error) {
       
        userList.innerHTML = `<tr><td colspan="4">Error: ${error.message}</td></tr>`;
    }
}

fetchButton.addEventListener('click', fetchUserData);
