-- Tx that already paid
SELECT t.*
FROM transactions t
JOIN TX_Invoice tx ON t.TxID = tx.TxID
WHERE tx.PaymentStatus = 'Paid';

-- Tx that in pending
SELECT t.*
FROM Transactions t
JOIN TX_Invoice tx ON t.TxID = tx.TxID
WHERE tx.PaymentStatus = 'Pending';

-- Tx that paid with Credit Card
SELECT t.*
FROM Transactions t
JOIN Invoice i ON t.InvoiceID = i.InvoiceID
WHERE i.PaymentMethod = 'Credit Card';

