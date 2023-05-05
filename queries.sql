-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
select p.ProductName,c.CategoryName from Product as p
join Category as c 
on p.CategoryId = c.Id
-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
select c.CompanyName,o.Id as "Siparis id" from [Order] as o 
join Customer as c on o.CustomerId = c.Id where o.OrderDate < '2012-08-09'
-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
select p.ProductName, Count(o.ProductId) as 'Urun_Sayisi' from [OrderDetail] as o join Product as p on o.ProductId=p.Id where OrderId = 10251
group by o.ProductId
-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)
select o.Id, c.CompanyName, e.FirstName,e.LastName from [Order] as o 
join Employee as e on e.Id = o.EmployeeId 
join cUSTOMER as c on c.Id = o.CustomerId