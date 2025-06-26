# E-Commerce Store Tables

## 1. Customers
- CustID
- CustName
- Email
- Address

## 2. Orders
- OrderID
- CustID
- OrderDate
- OrderStatus (Pending, Shipped, Delivered, Cancelled, Returned)

## 3. OrderDetails
- OrderDetID
- OrderID
- ProductID
- Quantity 
- Price
  
## 4. Products
- ProductID
- ProductName
- Price
- Stock

## 5. Category
- CategoryID
- CatName
- ProductID

## 6. Suppliers
- SupplierID
- SupplierName
- Mobile
- ProductID

## 7. Payments
- PaymentID
- OrderID
- Amount
- PaymentMethod (Credit Card, PayPal, Bank Transfer, Apple Pay)
- PaymentStatus (Pending, Completed, Failed,Refunded)
