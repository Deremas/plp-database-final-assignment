const express = require('express');
const router = express.Router();
const db = require('../db/connection');

// Get all customers
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM Customers');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Get customer by ID
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await db.query('SELECT * FROM Customers WHERE CustomerID = ?', [id]);
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Create new customer
router.post('/', async (req, res) => {
  const { FirstName, LastName, Email, PhoneNumber } = req.body;
  try {
    const [result] = await db.query(
      'INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber) VALUES (?, ?, ?, ?)',
      [FirstName, LastName, Email, PhoneNumber]
    );
    res.json({ CustomerID: result.insertId, message: 'Customer created successfully' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Update customer
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { FirstName, LastName, Email, PhoneNumber } = req.body;
  try {
    await db.query(
      'UPDATE Customers SET FirstName=?, LastName=?, Email=?, PhoneNumber=? WHERE CustomerID=?',
      [FirstName, LastName, Email, PhoneNumber, id]
    );
    res.json({ message: 'Customer updated successfully' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Delete customer
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    await db.query('DELETE FROM Customers WHERE CustomerID=?', [id]);
    res.json({ message: 'Customer deleted successfully' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
