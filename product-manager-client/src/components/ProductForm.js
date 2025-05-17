import React, { useState, useEffect } from 'react';
import { createProduct, updateProduct, getProduct } from '../api/products';
import { useNavigate, useParams } from 'react-router-dom';

function ProductForm() {
  const { id } = useParams();
  const navigate = useNavigate();
  const isEdit = !!id;
  const [form, setForm] = useState({
    name: '',
    description: '',
    price: '',
    available: true,
  });
  const [errors, setErrors] = useState([]);

  useEffect(() => {
    if (isEdit) {
      getProduct(id).then(res => {
        setForm({
          name: res.data.name,
          description: res.data.description,
          price: res.data.price,
          available: res.data.available,
        });
      });
    }
  }, [id, isEdit]);

  const handleChange = e => {
    const { name, value, type, checked } = e.target;
    setForm(f => ({
      ...f,
      [name]: type === 'checkbox' ? checked : value,
    }));
  };

  const handleSubmit = async e => {
    e.preventDefault();
    // Basic validation
    if (!form.name || !form.description || form.price === '' || isNaN(Number(form.price)) || Number(form.price) < 0) {
      setErrors(['Please fill all fields correctly.']);
      return;
    }
    try {
      if (isEdit) {
        await updateProduct(id, form);
      } else {
        await createProduct(form);
      }
      navigate('/');
    } catch (err) {
      setErrors(err.response?.data?.errors || ['Unknown error']);
    }
  };

  return (
    <div>
      <h2>{isEdit ? 'Edit Product' : 'Add Product'}</h2>
      {errors.length > 0 && (
        <div style={{ color: 'red' }}>
          {errors.map((e, i) => <div key={i}>{e}</div>)}
        </div>
      )}
      <form onSubmit={handleSubmit}>
        <div>
          <label>Name: <input name="name" value={form.name} onChange={handleChange} required /></label>
        </div>
        <div>
          <label>Description: <input name="description" value={form.description} onChange={handleChange} required /></label>
        </div>
        <div>
          <label>Price: <input name="price" type="number" min="0" step="0.01" value={form.price} onChange={handleChange} required /></label>
        </div>
        <div>
          <label>
            Available: <input name="available" type="checkbox" checked={form.available} onChange={handleChange} />
          </label>
        </div>
        <button type="submit">{isEdit ? 'Update' : 'Create'}</button>
      </form>
    </div>
  );
}

export default ProductForm;
