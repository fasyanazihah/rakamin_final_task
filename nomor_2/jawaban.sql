ALTER TABLE Products ADD FOREIGN KEY (Category) REFERENCES ProductCategories(CategoryID);
ALTER TABLE Orders ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
ALTER TABLE Orders ADD FOREIGN KEY (ProdNumber) REFERENCES Products(ProdNumber);