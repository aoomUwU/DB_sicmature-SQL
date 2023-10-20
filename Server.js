const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2/promise');
const moment = require('moment');
const cors = require('cors');
const app = express();
const port = 8000;
const dbConfig = {
    host: '127.0.0.1', // โฮสต์ของ MySQL database server
    user: 'root', // ชื่อผู้ใช้ของฐานข้อมูล MySQL
    password: '', // รหัสผ่านของผู้ใช้ MySQL
    database: 'db_sicmature-sql' // ชื่อของฐานข้อมูล MySQL ที่ต้องการเชื่อมต่อ
};
app.use(cors());
app.use(bodyParser.json());

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
app.get('/accounts', async (req, res) => {
    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query("SELECT * FROM account");
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({"message": error.message});
    }
});

app.get('/chats', async (req, res) => {
    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`SELECT cr.Chat_id, cr.Chat_name, cr.User_id, cr.Store_ID, c.Person_id_send, c.Video, c.Text, c.Datetime, c.Photo
                                         FROM chat_room cr
                                         JOIN chat c ON cr.Chat_id = c.Chat_id;
                                        `);
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({"message": error.message});
    }
});
app.get('/chat_room', async (req, res) => {
    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`SELECT *
                                         FROM chat_room;
                                        `);
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({"message": error.message});
    }
});
app.get('/chat/:Chat_id', async (req, res) => {
    const Chat_id = req.params.Chat_id;
    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`
                                            SELECT cr.Chat_id, cr.Chat_name, cr.User_id, cr.Store_ID, c.Person_id_send, c.Video, c.Text, c.Datetime, c.Photo
                                            FROM chat_room cr
                                            JOIN chat c ON cr.Chat_id = c.Chat_id
                                            WHERE cr.Chat_id = ?;
                                        `, [Chat_id]);
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({ "message": error.message });
    }
});
app.post('/chat_room', async (req, res) => {
    const { Chat_name, User_id, Store_ID } = req.body;
    try {
        const conn = await mysql.createConnection(dbConfig);
        // Insert chat_room 
        const [chatRoomResult] = await conn.query('INSERT INTO chat_room (Chat_name, User_id, Store_ID) VALUES (?, ?, ?)', [Chat_name, User_id, Store_ID]);
        const Chat_id = chatRoomResult.insertId;

        conn.end();
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error creating chat room.' });
    }
});
app.post('/chat/:Chat_id', async (req, res) => {
    const Chat_id = req.params.Chat_id;
    const { Person_id_send, Video, Text, Datetime, Photo } = req.body;
    try {
        const conn = await mysql.createConnection(dbConfig);
        // Insert message
        await conn.query('INSERT INTO chat (Chat_id, Person_id_send, Video, Text, Datetime, Photo) VALUES (?, ?, ?, ?, ?, ?)', [Chat_id, Person_id_send, Video, Text, Datetime, Photo]);

        conn.end();
        res.status(200).json({ message: 'Message added successfully.' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error adding message.' });
    }
});


app.get('/products', async (req, res) => {
    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`SELECT p.Product_ID, p.Product_name, p.Category, p.Img, p.Description, p.Brand, ps.Size, ps.Price 
                                         FROM product p 
                                         JOIN price_size ps ON p.Product_ID = ps.Product_ID
                                        `);
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({"message": error.message});
    }
});
app.get('/products/:category', async (req, res) => {
    const category = req.params.category;

    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`
                                            SELECT p.Product_ID, p.Product_name, p.Category, p.Img, p.Description, p.Brand, ps.Size, MAX(ps.Price) as Price
                                            FROM product p 
                                            JOIN price_size ps ON p.Product_ID = ps.Product_ID 
                                            WHERE p.Category = ? 
                                            GROUP BY p.Product_ID, p.Product_name, p.Category, p.Img, p.Description, p.Brand
                                        `, [category]);    
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({ "message": error.message });
    }
});
app.get('/foodProducts', async (req, res) => {

    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`
            SELECT p.Product_ID, p.Product_name, p.Category, p.Img, p.Description, p.Brand, ps.Size, MAX(ps.Price) as Price 
            FROM product p 
            JOIN price_size ps ON p.Product_ID = ps.Product_ID 
            WHERE p.Category IN ('Food_Supply', 'Food_grain', 'Food_Wet') 
            GROUP BY p.Product_ID, p.Product_name, p.Category, p.Img, p.Description, p.Brand;
        `);  
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({ "message": error.message });
    }
});

app.get('/product/:Product_ID', async (req, res) => {
    const Product_ID = req.params.Product_ID;

    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`
                                            SELECT p.Product_ID, p.Product_name, p.Category, p.Img, p.Description, p.Brand, ps.Size, ps.Price
                                            FROM product p 
                                            JOIN price_size ps ON p.Product_ID = ps.Product_ID
                                            WHERE p.Product_ID = ?;
                                        `, [Product_ID]);
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({ "message": error.message });
    }
});
app.get('/product_name/:Product_name', async (req, res) => {
    const Product_name = req.params.Product_name;

    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`
                                            SELECT p.Product_ID, p.Product_name, p.Category, p.Img, p.Description, p.Brand, ps.Size, MAX(ps.Price) as Price
                                            FROM (
                                                SELECT * 
                                                FROM product 
                                                WHERE Product_name LIKE ?
                                            ) p
                                            JOIN price_size ps ON p.Product_ID = ps.Product_ID
                                            GROUP BY p.Product_ID, p.Product_name, p.Category, p.Img, p.Description, p.Brand
                                        `, [`%${Product_name}%`]);   
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({ "message": error.message });
    }
});
app.get('/shippings/:User_id', async (req, res) => {
    const User_id = req.params.User_id;
    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query(`SELECT * 
                                        FROM shipping
                                        WHERE User_id = ?;
                                        `, [User_id]);
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({"message": error.message});
    }
});
app.post('/shippings/:User_id', async (req, res) => {
    const User_id = req.params.User_id;
    const {Product_ID, Price, Amount} = req.body;
    try {
        const conn = await mysql.createConnection(dbConfig);
        await conn.query('INSERT INTO shipping (User_id, Product_ID, Price, Amount) VALUES (?, ?, ?, ?)', [User_id, Product_ID, Price, Amount]);
        conn.end();
        res.status(200).json({ message: 'Shipping information added successfully.' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error adding shipping information.' });
    }
});
app.delete('/shippings/:User_id&:Product_ID&:Price', async (req, res) => {
    const User_id = req.params.User_id;
    const Product_ID = req.params.Product_ID;
    const Price = req.params.Price;
    try {
        const conn = await mysql.createConnection(dbConfig);
        await conn.query("DELETE FROM shipping WHERE User_id = ? AND Product_ID = ? AND Price = ?", [User_id, Product_ID, Price]);
        conn.end();
        res.status(200).json({ message: 'successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error' });
    }
});

app.get('/statments', async (req, res) => {
    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query("SELECT * FROM statment");
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({"message": error.message});
    }
});
app.post('/statments' , async(req, res) => {
    try {
        const conn =  await mysql.createConnection(dbConfig);
        const [data] = await conn.query(
            "INSERT INTO statment (Order_ID, Order_Date, User_id, Product_ID, Price, Amount, Payment) VALUES (?, ?, ?, ?, ?, ?, ?);",
            [
                req.body.Order_ID,
                req.body.Order_Date,
                req.body.User_id,
                req.body.Product_ID,
                req.body.Price,
                req.body.Amount,
                req.body.Payment,
            ]
        );        
        conn.end(); 
        res.json(data);
    } catch (error) {
        res.status(500).json({"message: " :error.message});
    }
});

app.get('/stores', async (req, res) => {
    try {
        const conn = await mysql.createConnection(dbConfig);
        const [data] = await conn.query("SELECT * FROM store");
        conn.end();
        res.json(data);
    } catch (error) {
        res.status(500).json({"message": error.message});
    }
});
