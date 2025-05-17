import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import ProductList from './components/ProductList';
import ProductDetail from './components/ProductDetail';
import ProductForm from './components/ProductForm';

function App() {
  return (
    <div className="App">
      <Router>
        <Routes>
          <Route path="/" element={<ProductList />} />
          <Route path="/products/:id" element={<ProductDetail />} />
          <Route path="/add" element={<ProductForm />} />
          <Route path="/edit/:id" element={<ProductForm />} />
        </Routes>
      </Router>
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
