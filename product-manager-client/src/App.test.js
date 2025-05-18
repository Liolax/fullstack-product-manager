import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import App from './App';
import ProductList from './components/ProductList';
import ProductDetail from './components/ProductDetail';
import ProductForm from './components/ProductForm';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});

test('renders ProductList and filters products', () => {
  // Mock products data
  const products = [
    { id: 1, name: 'Test Product', available: true },
    { id: 2, name: 'Unavailable Product', available: false }
  ];
  render(<ProductList products={products} />);
  expect(screen.getByText('Test Product')).toBeInTheDocument();
  // ...add filter interaction and assertions...
});

test('renders ProductDetail and handles delete', () => {
  // ...mock product and delete handler...
  // ...render and assert...
});

test('validates ProductForm input', () => {
  render(<ProductForm />);
  fireEvent.change(screen.getByLabelText(/Name/i), { target: { value: '' } });
  fireEvent.click(screen.getByText(/Submit/i));
  expect(screen.getByText(/Name is required/i)).toBeInTheDocument();
});
