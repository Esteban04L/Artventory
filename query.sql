SELECT * FROM usuarios;


SELECT * FROM productos;


SELECT * FROM proveedores;



SELECT * FROM categorias;



INSERT INTO proveedores (id, nombre, contacto, telefono, correo, direccion) VALUES
(1, 'Maderas Andinas', 'Carlos Ruiz', '0998432100', 'carlos@maderasandinas.ec', 'Av. América N32-56, Quito');
(2, 'Pinturas del Austro', 'Lucía Cordero', '0987114562', 'lucia@pinturaustro.com', 'Calle Loja y Tarqui, Cuenca'),
(3, 'ArteColor Ecuador', 'Miguel Vinueza', '0974432108', 'ventas@artecolor.ec', 'Av. de las Américas, Guayaquil'),
(4, 'Cedros y Nogales', 'Elena Salas', '0967330192', 'elena@cedrosnogales.ec', 'Via a Cumbayá km 3.5, Quito'),
(5, 'PincelArte', 'Andrés Jaramillo', '0951208765', 'a.jaramillo@pincelarte.com', 'Calle Manuelita Sáenz, Loja'),
(6, 'Barnices Quito', 'Paola Espinoza', '0998876532', 'paola@barnicesquito.ec', 'Av. Colón y 6 de Diciembre, Quito'),
(7, 'La Maderera', 'Fernando Mena', '0982114567', 'contacto@lamaderera.ec', 'Av. Circunvalación Sur, Ambato'),
(8, 'ColorEcuador', 'Jorge Almeida', '0960101234', 'jorge@colorecuador.com', 'Calle Bolívar 103 y Rocafuerte, Riobamba'),
(9, 'Tintes y Barnices Zhumir', 'Tatiana Ortiz', '0958833001', 'tatiana@zhumir.ec', 'Av. España y Juan León Mera, Cuenca'),
(10, 'Finos Acabados', 'Marcos Narváez', '0942231980', 'marcos@finosacabados.ec', 'Panamericana Norte km 9, Ibarra');



INSERT INTO productos (
  id, nombre, descripcion, categoria_id, proveedor_id, cantidad, precio, estado, imagen
) VALUES (
  1,
  'Colibrí tallado en madera',
  'Figura decorativa artesanal pintada a mano, elaborada con madera de balsa y detalles en acrílico. Ideal para decoración de interiores.',
  1,
  1,
  25,
  12.50,
  'disponible',
  'colibri_madera.jpg'
);







INSERT INTO productos (id, nombre, descripcion, categoria_id, proveedor_id, cantidad, precio, estado, imagen) VALUES
(1, 'Colibrí tallado en madera', 'Figura decorativa pintada a mano, elaborada en madera balsa con detalles acrílicos.', 1, 1, 25, 12.50, 'disponible', 'https://cdn.pixabay.com/photo/2017/09/01/19/05/wood-carving-2706845_960_720.jpg'),
(2, 'Porta llaves rústico', 'Base de madera con diseño floral pintado a mano. Incluye ganchos metálicos para llaves.', 2, 3, 15, 9.99, 'disponible', 'https://cdn.pixabay.com/photo/2017/09/25/13/12/key-board-2785681_960_720.jpg'),
(3, 'Caja de joyas artesanal', 'Caja de madera con bisagras, tallada y decorada con pintura acrílica brillante.', 4, 4, 10, 14.75, 'disponible', 'https://cdn.pixabay.com/photo/2016/03/27/20/59/wooden-box-1285156_960_720.jpg'),
(4, 'Cuadro de mariposa', 'Obra decorativa en tabla de madera, con mariposa pintada a mano en tonos vivos.', 3, 2, 18, 17.90, 'disponible', 'https://cdn.pixabay.com/photo/2020/09/04/17/13/butterfly-5542943_960_720.jpg'),
(5, 'Llaveros personalizados', 'Llaveros de madera con nombres grabados y pintados artesanalmente.', 2, 5, 50, 3.50, 'disponible', 'https://cdn.pixabay.com/photo/2018/06/11/14/02/keychain-3468815_960_720.jpg'),
(6, 'Árbol de la vida en madera', 'Figura circular tallada y pintada con temática espiritual. Ideal para salas.', 1, 6, 12, 20.00, 'disponible', 'https://cdn.pixabay.com/photo/2015/09/16/20/08/tree-of-life-942057_960_720.jpg'),
(7, 'Cucharas decorativas', 'Set de cucharas de madera pintadas a mano con diseños coloridos. Solo uso decorativo.', 5, 7, 30, 8.20, 'disponible', 'https://cdn.pixabay.com/photo/2020/08/10/08/30/wooden-spoons-5477472_960_720.jpg'),
(8, 'Nombre infantil en madera', 'Letras personalizadas para pared, ideales para habitaciones de niños.', 2, 8, 22, 11.00, 'disponible', 'https://cdn.pixabay.com/photo/2016/03/27/20/59/letters-1285155_960_720.jpg'),
(9, 'Mandala en tabla', 'Mandala artesanal pintado con acrílicos sobre fondo de madera rústica.', 3, 9, 14, 13.60, 'disponible', 'https://cdn.pixabay.com/photo/2017/08/09/00/25/mandala-2612420_960_720.jpg'),
(10, 'Cofre de madera vintage', 'Cofre envejecido pintado con técnica rústica, ideal para guardar objetos personales.', 4, 10, 7, 19.95, 'disponible', 'https://cdn.pixabay.com/photo/2016/02/19/11/53/box-1209965_960_720.jpg');

-- Crear la secuencia si no existe
CREATE SEQUENCE IF NOT EXISTS proveedores_id_seq;

-- Establecer la secuencia como valor por defecto para la columna id
ALTER TABLE proveedores
ALTER COLUMN id SET DEFAULT nextval('proveedores_id_seq');

-- Asociar la secuencia a la columna id (buenas prácticas)
ALTER SEQUENCE proveedores_id_seq OWNED BY proveedores.id;



INSERT INTO usuarios (username, password) VALUES (
  'jose',
  'jose123'
);



