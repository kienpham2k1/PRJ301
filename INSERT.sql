USE SHOPPING
-----------------------------------------
INSERT INTO [dbo].[tblRoles] ([roleID] ,[roleName]) VALUES ('AD' ,'Admin')
INSERT INTO [dbo].[tblRoles] ([roleID] ,[roleName]) VALUES ('US' ,'User')
GO
-----------------------------------------
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('1' ,'Fresh Meat')
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('2' ,'Vegetables')
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('3' ,'Fruit & Nut Gifts')
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('4' ,'Fresh Berries')
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('5' ,'Ocean Foods')
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('6' ,'Butter & Eggs')
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('7' ,'Fastfood')
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('8' ,'Fresh Onion')
INSERT INTO [dbo].[tblCategory] ([catagoryID] ,[catagoryName]) VALUES ('9' ,'Oatmeal')
GO
-----------------------------------------
INSERT INTO [dbo].[tblUsers]
           ([userID]
           ,[fullName]
           ,[password]
           ,[roleID]
           ,[address]
           ,[birthday]
           ,[phone]
           ,[email]
           ,[status])
     VALUES
           ('admin'
           ,'SHOP ADMIN'
           ,'1'
           ,'AD'
           ,'666 - Quan 9 - HCM - VN'
           ,'1999-9-9'
           ,094888800
           ,'admin@gmail.com'
           ,'Approve')
GO

INSERT INTO [dbo].[tblUsers]
           ([userID]
           ,[fullName]
           ,[password]
           ,[roleID]
           ,[address]
           ,[birthday]
           ,[phone]
           ,[email]
           ,[status])
     VALUES
           ('user'
           ,'User'
           ,'1'
           ,'US'
           ,'763/2A - Thu DUC - TP.HCM - VN'
           ,'2000-02-25'
           ,076882377
           ,'user@gmail.com'
           ,'Approve')
GO
INSERT INTO [dbo].[tblUsers]
           ([userID]
           ,[fullName]
           ,[password]
           ,[roleID]
           ,[address]
           ,[birthday]
           ,[phone]
           ,[email]
           ,[status])
     VALUES
           ('user2'
           ,'User2'
           ,'1'
           ,'US'
           ,'763/2A - Binh Chanh - Phu Quoc'
           ,'2000-03-25'
           ,076882377
           ,'user2@gmail.com'
           ,'Approve')
GO
-----------------------------------------
INSERT INTO [dbo].[tblProduct]([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('1', N'BÒ KOBE NHẬT BẢN - KOBE STRIPLOIN', 
			'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR4qE0409lo0WnDHPeuFU9ryBdiecdFeWgk3pmSkXhK-XbVBVxYZJInLfI3_irrFiEtjTwmOQnXp6067boO3IqGx6KkFGFlaWAYlfZxbWU&usqp=CAc', 10500000
           , 25,  1, '2022-2-21', '2022-6-16', 'Approve')
INSERT INTO [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('2', N'Thịt gà', 
			'http://data.voh.com.vn/voh/Image/2019/01/21/thitga_20190121100307.jpg'
			, 60.000, 34,  1, '2022-3-5', '2022-6-23','Approve')
INSERT INTO [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('3', N'THỊT BA RỌI HEO RÚT SƯỜN FEDDY 300G', 
			'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR4qE0409lo0WnDHPeuFU9ryBdiecdFeWgk3pmSkXhK-XbVBVxYZJInLfI3_irrFiEtjTwmOQnXp6067boO3IqGx6KkFGFlaWAYlfZxbWU&usqp=CAc'
			, 126.500, 100,  1, '2021-12-12', '2022-4-16','Approve')

INSERT INTO [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('4', N'Cải chíp', 
			'https://vn-test-11.slatic.net/p/407b5d7577d2af349e47159725ad1550.png'
			, 25.000, 29,  2, '2022-2-7', '2022-3-1','Approve')

INSERT INTO [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('5', N'Rau cần', 
			'https://cdn.tgdd.vn/Products/Images/8820/252674/bhx/rau-can-nuoc-tui-300g-202110131400068638.jpeg'
			, 20.000, 10,  2, '2022-3-5', '2022-3-10','Approve')

INSERT INTO [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('33', N'Trái boom', 
			'https://ae01.alicdn.com/kf/HTB1s4OiasvrK1Rjy0Feq6ATmVXa6/Tr-Em-M-i-Gi-M-m-Qu-Bom-Ch-i-N-p-n-Th-C.jpg_Q90.jpg_.webp'
			, 2500000, 100,  3, '2000-3-5', '2030-3-8','Approve')

INSERT INTO [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('6', N'Trái bơ', 
			'https://cdn01.dienmaycholon.vn/filewebdmclnew/public//userupload/images/nhung-loai-trai-cay-rat-ghet-tu-lanh2.jpg'
			, 77000, 55,  3, '2019-3-5', '2020-3-8','Approve')

INSERT INTO [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('7', N'Bưởi 5 roi', 
			'https://vcdn-suckhoe.vnecdn.net/2019/02/11/ba-ba-u-a-n-bu-o-i-1549852744-8567-1549852913.png'
			, 100000, 0,  3, '2022-1-9', '2022-10-29','Approve')

INSERT INTO [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [status])
VALUES ('21', N'Sữa tươi có đường Vinamilk', 
			'https://cdn.tgdd.vn/Products/Images/2386/79312/bhx/sua-tuoi-co-duong-vinamilk-100-sua-tuoi-hop-1-lit-202104182331237143.jpg'
			, 2500000, 12,  4, '2023-1-1', '2023-10-8','Approve')
-----------------------------------------
-----------------------------------------

