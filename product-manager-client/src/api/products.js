import axios from 'axios';
// Use environment variable or fallback to localhost for development
const BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:3000';
const API_URL = `${BASE_URL}/products`;

export const getProducts = (available) =>
  axios.get(API_URL, { params: available !== undefined ? { available } : {} });

export const getProduct = (id) => axios.get(`${API_URL}/${id}`);
export const createProduct = (data) => axios.post(API_URL, { product: data });
export const updateProduct = (id, data) => axios.put(`${API_URL}/${id}`, { product: data });
export const deleteProduct = (id) => axios.delete(`${API_URL}/${id}`);
// (No changes needed if API_URL is correct and used everywhere.)
