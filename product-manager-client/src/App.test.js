import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import App from './App';
import ProductList from './components/ProductList';
import ProductForm from './components/ProductForm';
import { getProducts } from './api/products';

jest.mock('react-router-dom', () => ({
  BrowserRouter: ({ children }) => <div>{children}</div>,
  Routes: ({ children }) => <div>{children}</div>,
  Route: () => null,
  Link: ({ children, ...props }) => <a {...props}>{children}</a>,
  useNavigate: () => jest.fn(),
  useParams: () => ({}),
}));
jest.mock('./api/products');

test('renders App header', () => {
  render(<App />);
  expect(screen.getByText(/Cloud Application Development Project/i)).toBeInTheDocument();
});

test('renders ProductList and shows filter options', async () => {
  getProducts.mockResolvedValueOnce({ data: [] });
  render(<ProductList />);
  expect(screen.getByText('Products')).toBeInTheDocument();
  // Wait for the filter select to appear (async)
  await screen.findByLabelText(/Filter/i);
});

test('validates ProductForm input', () => {
  render(<ProductForm />);
  fireEvent.change(screen.getByLabelText(/Name/i), { target: { value: '' } });
  fireEvent.change(screen.getByLabelText(/Description/i), { target: { value: '' } });
  fireEvent.change(screen.getByLabelText(/Price/i), { target: { value: '-1' } });
  fireEvent.click(screen.getByText(/Create/i));
  expect(screen.getByText(/Please fill all fields correctly/i)).toBeInTheDocument();
});
