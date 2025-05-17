import React, { useEffect, useState } from 'react';
import { getProducts } from '../api/products';
import { Link } from 'react-router-dom';

function ProductList() {
  const [products, setProducts] = useState([]);
  const [filter, setFilter] = useState('all');

  useEffect(() => {
    let available;
    if (filter === 'available') available = true;
    else if (filter === 'unavailable') available = false;
    getProducts(available).then(res => setProducts(res.data));
  }, [filter]);

  return (
    <div>
      <h2>Products</h2>
      <Link to="/add">Add Product</Link>
      <div>
        <label>Filter: </label>
        <select value={filter} onChange={e => setFilter(e.target.value)}>
          <option value="all">All</option>
          <option value="available">Available</option>
          <option value="unavailable">Unavailable</option>
        </select>
      </div>
      <ul>
        {products.map(p => (
          <li key={p.id}>
            <Link to={`/products/${p.id}`}>{p.name}</Link>
            {p.available ? ' (Available)' : ' (Unavailable)'}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ProductList;
