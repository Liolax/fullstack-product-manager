import React, { useEffect, useState } from 'react';
import { getProduct, deleteProduct } from '../api/products';
import { useParams, useNavigate, Link } from 'react-router-dom';

function ProductDetail() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [product, setProduct] = useState(null);

  useEffect(() => {
    getProduct(id).then(res => setProduct(res.data));
  }, [id]);

  const handleDelete = async () => {
    await deleteProduct(id);
    navigate('/');
  };

  if (!product) return <div>Loading...</div>;

  return (
    <div>
      <h2>{product.name}</h2>
      <p>{product.description}</p>
      <p>Price: ${product.price}</p>
      <p>Status: {product.available ? 'Available' : 'Unavailable'}</p>
      <div className="product-detail-actions">
        <div className="action-group">
          <Link className="edit-btn" to={`/edit/${product.id}`}>Edit</Link>
          <button className="delete-btn" onClick={handleDelete}>Delete</button>
        </div>
        <Link className="back-to-list-btn" to="/">Back to list</Link>
      </div>
    </div>
  );
}

export default ProductDetail;
