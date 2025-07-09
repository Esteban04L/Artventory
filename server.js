const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const path = require('path');
const app = express();
const multer = require('multer');
const upload = multer({ dest: 'public/uploads/' });
require('dotenv').config();




const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.DB_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

module.exports = pool;



app.use(bodyParser.json());
app.use(express.static('public'));

app.post('/login', async (req, res) => {
  const { username, password } = req.body;
  try {
    const result = await pool.query(
      'SELECT * FROM usuarios WHERE username = $1 AND password = $2',
      [username, password]
    );
    if (result.rows.length > 0) {
      res.json({ 
        success: true,
        username: username 
      });
    } else {
      res.json({ success: false });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false });
  }
});

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.get('/productos.html', (req, res) => {
  res.sendFile(path.join(__dirname, 'productos.html'));
});

// Ruta GET para productos (con joins)
app.get('/api/productos', async (req, res) => {
  try {
    const query = `
      SELECT p.*, c.nombre as categoria_nombre, pr.nombre as proveedor_nombre 
      FROM productos p
      LEFT JOIN categorias c ON p.categoria_id = c.id
      LEFT JOIN proveedores pr ON p.proveedor_id = pr.id
    `;
    const result = await pool.query(query);
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener productos' });
  }
});

// Ruta POST para agregar productos (FALTA EN TU CÓDIGO ACTUAL)
app.post('/api/productos', async (req, res) => {
  const { nombre, descripcion, categoria_id, proveedor_id, cantidad, precio, estado, imagen } = req.body;

  try {
    await pool.query(
      `INSERT INTO productos (nombre, descripcion, categoria_id, proveedor_id, cantidad, precio, estado, imagen)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8)`,
      [nombre, descripcion, categoria_id, proveedor_id, cantidad, precio, estado, imagen]
    );
    res.status(201).json({ success: true, message: 'Producto agregado correctamente' });
  } catch (error) {
    console.error('Error al agregar producto:', error);
    res.status(500).json({ success: false, message: 'Error al agregar producto' });
  }
});

// Ruta POST para productos
app.post('/api/proveedores', async (req, res) => {
  const { nombre, contacto, telefono, correo, direccion } = req.body;
  try {
    await pool.query(
      'INSERT INTO proveedores(nombre, contacto, telefono, correo, direccion) VALUES($1, $2, $3, $4, $5)',
      [nombre, contacto, telefono, correo, direccion]
    );
    res.json({ success: true });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false });
  }
});


// Ruta PUT para actualizar productos
app.put('/api/productos/:id', async (req, res) => {
  const { id } = req.params;
  const { nombre, descripcion, categoria_id, proveedor_id, cantidad, precio, estado, imagen } = req.body;
  
  try {
    await pool.query(
      `UPDATE productos SET
        nombre=$1, descripcion=$2, categoria_id=$3, proveedor_id=$4,
        cantidad=$5, precio=$6, estado=$7, imagen=$8
      WHERE id=$9`,
      [nombre, descripcion, categoria_id, proveedor_id, cantidad, precio, estado, imagen, id]
    );
    res.json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false });
  }
});

// Ruta DELETE para productos
app.delete('/api/productos/:id', async (req, res) => {
  const { id } = req.params;
  try {
    await pool.query('DELETE FROM productos WHERE id = $1', [id]);
    res.json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false });
  }
});

app.get('/api/proveedores', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM proveedores');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener proveedores' });
  }
});

// Agregar estas rutas al final del archivo, antes del app.listen

// Rutas para Proveedores
app.post('/api/proveedores', async (req, res) => {
  const { nombre, contacto, telefono, correo, direccion } = req.body;
  try {
    await pool.query(
      'INSERT INTO proveedores(nombre, contacto, telefono, correo, direccion) VALUES($1, $2, $3, $4, $5)',
      [nombre, contacto, telefono, correo, direccion]
    );
    res.json({ success: true });
  } catch (error) {
    console.error(error); // Esto imprime el error real en la consola del servidor
    res.status(500).json({ success: false });
  }
});

app.put('/api/proveedores/:id', async (req, res) => {
  const { id } = req.params;
  const { nombre, contacto, telefono, correo, direccion } = req.body;
  try {
    await pool.query(
      'UPDATE proveedores SET nombre=$1, contacto=$2, telefono=$3, correo=$4, direccion=$5 WHERE id=$6',
      [nombre, contacto, telefono, correo, direccion, id]
    );
    res.json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false });
  }
});

app.delete('/api/proveedores/:id', async (req, res) => {
  const { id } = req.params;
  try {
    await pool.query('DELETE FROM proveedores WHERE id = $1', [id]);
    res.json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false });
  }
});

// En server.js
app.get('/api/categorias', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM categorias ORDER BY nombre');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener categorías' });
  }
});

app.get('/api/proveedores', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM proveedores ORDER BY nombre');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener proveedores' });
  }
});

app.use(express.static('public'));


const nodemailer = require('nodemailer');


// Configuración de Nodemailer para Hotmail
const mailTransporter = nodemailer.createTransport({
  host: "smtp-mail.outlook.com",
  port: 587,
  secure: false, // true para 465, false para otros puertos
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS
  },
  tls: {
    ciphers: "SSLv3",
    rejectUnauthorized: false // Solo para desarrollo
  }
});

// Verificar conexión SMTP al iniciar
mailTransporter.verify((error) => {
  if (error) {
    console.error('Error de conexión SMTP:', error);
  } else {
    console.log('Servidor SMTP configurado correctamente');
  }
});

const { Resend } = require('resend');
const resend = new Resend(process.env.RESEND_API_KEY);

app.post('/enviar-correo', async (req, res) => {
  const { para, asunto, mensaje } = req.body;

  if (!para || !asunto || !mensaje) {
    return res.status(400).json({
      success: false,
      message: 'Faltan campos requeridos'
    });
  }

  try {
    const data = await resend.emails.send({
      from: 'Artventory <noreply@resend.dev>', // puedes cambiarlo después
      to: [para],
      subject: asunto,
      html: `
        <div style="font-family: Arial, sans-serif; max-width: 600px;">
          <h2 style="color: #f59e0b;">${asunto}</h2>
          <div style="padding: 20px; background-color: #f9f9f9; border-radius: 8px;">
            ${mensaje.replace(/\n/g, '<br>')}
          </div>
          <p style="color: #888; font-size: 12px; margin-top: 20px;">
            Artventory - Sistema de Gestión de Inventario
          </p>
        </div>
      `
    });

    res.json({
      success: true,
      message: 'Correo enviado correctamente',
      resultado: data
    });

  } catch (error) {
    console.error('Error al enviar correo con Resend:', error);
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

app.listen(3000, () => {
  console.log('Servidor ejecutándose en http://localhost:3000');
});
