const express = require('express');
const app = express();
const dotenv = require('dotenv');
dotenv.config();

const customerRoutes = require('./routes/customers');
const productRoutes = require('./routes/products');

app.use(express.json());

// Routes
app.use('/customers', customerRoutes);
app.use('/products', productRoutes);

// Test route
app.get('/', (req, res) => {
  res.send('E-Commerce CRUD API is running...');
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
