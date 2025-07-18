PGDMP  2            	        }         
   Artventory    17.5    17.5 %    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            G           1262    16388 
   Artventory    DATABASE     �   CREATE DATABASE "Artventory" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE "Artventory";
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            H           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16399 
   categorias    TABLE     g   CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.categorias;
       public         heap r       postgres    false    4            �            1259    16398    categorias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categorias_id_seq;
       public               postgres    false    4    220            I           0    0    categorias_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;
          public               postgres    false    219            �            1259    16415 	   productos    TABLE     .  CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    categoria_id integer,
    proveedor_id integer,
    cantidad integer DEFAULT 0 NOT NULL,
    precio numeric(10,2) DEFAULT 0.00 NOT NULL,
    estado character varying(20) DEFAULT 'disponible'::character varying,
    imagen character varying(255),
    CONSTRAINT productos_estado_check CHECK (((estado)::text = ANY ((ARRAY['disponible'::character varying, 'agotado'::character varying, 'reservado'::character varying])::text[])))
);
    DROP TABLE public.productos;
       public         heap r       postgres    false    4            �            1259    16414    productos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.productos_id_seq;
       public               postgres    false    224    4            J           0    0    productos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;
          public               postgres    false    223            �            1259    16406    proveedores    TABLE     �   CREATE TABLE public.proveedores (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    contacto character varying(100),
    telefono character varying(20),
    correo character varying(100),
    direccion text
);
    DROP TABLE public.proveedores;
       public         heap r       postgres    false    4            �            1259    16405    proveedores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.proveedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.proveedores_id_seq;
       public               postgres    false    4    222            K           0    0    proveedores_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;
          public               postgres    false    221            �            1259    16390    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false    4            �            1259    16389    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public               postgres    false    218    4            L           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public               postgres    false    217            �           2604    16402    categorias id    DEFAULT     n   ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);
 <   ALTER TABLE public.categorias ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    16418    productos id    DEFAULT     l   ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);
 ;   ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    16437    proveedores id    DEFAULT     p   ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);
 =   ALTER TABLE public.proveedores ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    16393    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            =          0    16399 
   categorias 
   TABLE DATA           0   COPY public.categorias (id, nombre) FROM stdin;
    public               postgres    false    220   *       A          0    16415 	   productos 
   TABLE DATA           z   COPY public.productos (id, nombre, descripcion, categoria_id, proveedor_id, cantidad, precio, estado, imagen) FROM stdin;
    public               postgres    false    224   �*       ?          0    16406    proveedores 
   TABLE DATA           X   COPY public.proveedores (id, nombre, contacto, telefono, correo, direccion) FROM stdin;
    public               postgres    false    222   //       ;          0    16390    usuarios 
   TABLE DATA           :   COPY public.usuarios (id, username, password) FROM stdin;
    public               postgres    false    218   �1       M           0    0    categorias_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categorias_id_seq', 5, true);
          public               postgres    false    219            N           0    0    productos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.productos_id_seq', 16, true);
          public               postgres    false    223            O           0    0    proveedores_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.proveedores_id_seq', 14, true);
          public               postgres    false    221            P           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 2, true);
          public               postgres    false    217            �           2606    16404    categorias categorias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public                 postgres    false    220            �           2606    16426    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public                 postgres    false    224            �           2606    16413    proveedores proveedores_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pkey;
       public                 postgres    false    222            �           2606    16395    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    218            �           2606    16397    usuarios usuarios_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_username_key;
       public                 postgres    false    218            �           2606    16427 %   productos productos_categoria_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);
 O   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_categoria_id_fkey;
       public               postgres    false    224    220    4770            �           2606    16432 %   productos productos_proveedor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);
 O   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_proveedor_id_fkey;
       public               postgres    false    4772    222    224            =   w   x�M���@Ek{�� )HC�X>Y�sd;��Y�#U����{\��8E�����YZyQ'<��,a�ek��U�-7�<%�Ox�������?�VN���7R�[�D��t/�      A   |  x��UMo7=�~Şr�~��m�����0f��+����d�֟�c=�ګ�X���%'PZ��9oޛ7�w!`�Z��(	��N�c�Cj𙒾T�V�����o�%�v|m� �@i1�R�����Bzt�,��@on��<���ezJ��dd�j�\���t}�0���`�M�2и\��3:���^$e��i�,���gI��q�7U�d�;;�4y9K��J[��K��w�˙�^����R޸�G��P���G���M2�ڢ?�ds*���e��	�p�+E�%�ׄM�X)x��l�J#dj%Y��uQF:�"*��>JJ\�eS�_	q��1~��_�A�5�[��Q�Z��{���8�����}�F�~�$-�1U	B��xI�%YX>J��H7�H:ЌΟ.T!�Yt�%�D��PЙ(��,��(-�t�=��W���r͗ʀ���:dD���#�c�g#��&p0Q5�W�Э�Z"���K��y�f�	��9�Zm�#��?O����dq|G�O��͘���I���O�r�\���z�v���78\+�| �Vs�9�\N�$&vªxTh0t�\l�%�z#}|�j!��������7�g�:�7�A���k����R&/�]�+|�r0�%�[��m�+hMK�{'i�(�����"�ٜ�Ü0j�+���v(�ĥ9�yҙ�~Por2�п�We��X�	U^{u�>J�WVi����{1��Q7I�%Y���+���2<Ʈ{�6#ץ��S�J��I�kލR���^��QǸf+���Z2���7�j>�%�ܮ@��t�Zֹ�SI8�J/I�4� �S�bQ�U~aA�%�@ޗ�+�Y�wT1�U��m�g]6b�����}.{␋$hE������3��|q�͡�WG^%w�9_��b� ����͇�z8��N��hL�"I�5ƹ���ů]���(�x�������/�˽N��І莸T�ړ9�llF������{��eQVuR�WA[�,�g��Q{��uz;�#_	��%[���~�މ�>4�3�{����߂0� Dw&�w$�č��'%�ۥ�.�������C���g����e׼f��}X\��������l�C�>���䗷����_<1�?��l��      ?   �  x�m�Mn�0���)� ��K�vRܤh`�ndQt3��)E��h �M�YdQ��X���E���{�9[Iͅj� X�[���-vR)��*OҸ�9����w�� �sӱ*%`��	%����л��=F;C�%=|ur0l�F!��T��ZT�o���������W�g�v3��4<B����Kѭ�jFS6G�VXd�jԭ��оA�&�$/��= L��;�_H˝ޢB.}�kgG�tk��%��ƞs�����؍�FuB��|'q�fv�j��}��6x٢�$�h�+���	B8�+i�H����H=�Gx����e78H�_� wޗ�̲8N�p8�wAwZ����7R�K���ﴠ}G0sBs�xad���ӜV��\hP��,M����j<�O}�n�l%GXf釼8���X�Wo�����5l����KkE�e|I�r\�O�������7h)o���D�s\�ֱ���H���8��$M��*cօ��������u�/@h��܀�T#�L)�e�?������P��VR�C�����d[A��k�0B
N�(�ʃ>��G���#�>*J�aE�cϜ�=$�TL�������C�#_~����Q�V����A���d�P{E������_���v4a3�Z㓹4T�g�^\Ӌ�cS�cR�L��5j}�z�4 Y�(��'O9秸|GQ���H      ;   $   x�3�LL����4426�2���/N@>W� ��     