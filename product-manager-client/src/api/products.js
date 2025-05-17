import axios from 'axios';
const API_URL = 'http://localhost:3000/products'; // Set to your Rails backend URL

export const getProducts = (available) =>
  axios.get(API_URL, { params: available !== undefined ? { available } : {} });

export const getProduct = (id) => axios.get(`${API_URL}/${id}`);
export const createProduct = (data) => axios.post(API_URL, { product: data });
export const updateProduct = (id, data) => axios.put(`${API_URL}/${id}`, { product: data });
export const deleteProduct = (id) => axios.delete(`${API_URL}/${id}`);
