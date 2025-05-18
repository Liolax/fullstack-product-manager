# Product Management System – Design & Implementation Report

## 1. Application Design

### Backend (Ruby on Rails)
- **MVC Pattern:** Used for separation of concerns.
- **API-Only:** Rails configured as API-only for frontend integration.
- **Validation:** Model-level validations for data integrity.
- **Testing:** Unit and integration tests for models and controllers.

### React Client
- **Component-Based:** Each feature is a separate React component.
- **API Integration:** Uses fetch/axios to communicate with Rails API.
- **Validation:** Form validation on the client side.
- **Testing:** Jest and React Testing Library for unit/component tests.

### HTML+JS Client
- **Simple HTML/JS:** Standalone HTML file using fetch for CRUD.
- **Validation:** Basic JS validation.
- **Testing:** Jest/Mocha for JS unit tests.

### Deployment
- **Docker:** Backend Dockerfile for containerization.
- **CORS:** Configured for cross-origin requests.
- **Scripts:** Provided for deployment automation.

## 2. Screenshots

> _Add screenshots of the UI, tests, and deployment here._

## 3. Design Patterns & Decisions

- **MVC (Rails):** For backend structure.
- **Componentization (React):** For maintainable UI.
- **API-First:** Decouples frontend and backend.
- **Validation:** Both backend and frontend.
- **Testing:** Comprehensive coverage.
- **Responsive Design:** CSS media queries.

## 4. GitHub Repository

> _Add your GitHub repository link here._

---
