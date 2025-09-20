const express = require('express');
const router = express.Router();
const db = require('../db/connection');

// Get all products
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM Products');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Get product by ID
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await db.query('SELECT * FROM Products WHERE ProductID = ?', [id]);
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Create new product
router.post('/', async (req, res) => {
  const { Name, Description, Price, StockQuantity } = req.body;
  try {
    const [result] = await db.query(
      'INSERT INTO Products (Name, Description, Price, StockQuantity) VALUES (?, ?, ?, ?)',
      [Name, Description, Price, StockQuantity]
    );
    res.json({ ProductID: result.insertId, message: 'Product created successfully' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Update product
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { Name, Description, Price, StockQuantity } = req.body;
  try {
    await db.query(
      'UPDATE Products SET Name=?, Description=?, Price=?, StockQuantity=? WHERE ProductID=?',
      [Name, Description, Price, StockQuantity, id]
    );
    res.json({ message: 'Product updated successfully' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Delete product
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    await db.query('DELETE FROM Products WHERE ProductID=?', [id]);
    res.json({ message: 'Product deleted successfully' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
