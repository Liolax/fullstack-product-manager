import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import ProductList from './components/ProductList';
import ProductDetail from './components/ProductDetail';
import ProductForm from './components/ProductForm';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <div className="App-header-content">
          <img src={logo} className="App-logo" alt="logo" />
          <h1>Cloud Application Development Project</h1>
          <p>
            This full-stack web application demonstrates product management using Ruby on Rails (API) and React.<br />
            Features include CRUD operations, filtering, validation, and testing.<br />
            The project is deployed to a public cloud and follows professional design and testing practices.
          </p>
        </div>
      </header>
      <Router>
        <main>
          <Routes>
            <Route path="/" element={<ProductList />} />
            <Route path="/products/:id" element={<ProductDetail />} />
            <Route path="/add" element={<ProductForm />} />
            <Route path="/edit/:id" element={<ProductForm />} />
          </Routes>
        </main>
      </Router>
    </div>
  );
}

export default App;
