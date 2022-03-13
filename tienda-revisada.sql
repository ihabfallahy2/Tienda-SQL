-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-02-2022 a las 11:39:25
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `tlf` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `dni` varchar(55) NOT NULL,
  `direccion` varchar(55) NOT NULL,
  `tienda` int(11) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `tienda` (`tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

DROP TABLE IF EXISTS `familia`;
CREATE TABLE IF NOT EXISTS `familia` (
  `cod` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`cod`, `nombre`) VALUES
('CAMARA', 'Cámaras digitales'),
('CONSOL', 'Consolas'),
('EBOOK', 'Libros electrónicos'),
('IMPRES', 'Impresoras'),
('MEMFLA', 'Memorias flash'),
('MP3', 'Reproductores MP3'),
('MULTIF', 'Equipos multifunción'),
('NETBOK', 'Netbooks'),
('ORDENA', 'Ordenadores'),
('PORTAT', 'Ordenadores portátiles'),
('ROUTER', 'Routers'),
('SAI', 'Sistemas de alimentación ininterrumpida'),
('SOFTWA', 'Software'),
('TV', 'Televisores'),
('VIDEOC', 'Videocámaras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineapedido`
--

DROP TABLE IF EXISTS `lineapedido`;
CREATE TABLE IF NOT EXISTS `lineapedido` (
  `id` int(55) NOT NULL,
  `producto` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(10) NOT NULL,
  KEY `id` (`id`),
  KEY `producto` (`producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ordenado`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `ordenado`;
CREATE TABLE IF NOT EXISTS `ordenado` (
`cod` varchar(12)
,`nombre_corto` varchar(50)
,`tienda` int(11)
,`unidades` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(55) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cliente` varchar(55) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente` (`cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `cod` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_corto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  `PVP` decimal(10,2) NOT NULL,
  `familia` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `nombre_corto` (`nombre_corto`),
  KEY `familia` (`familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`cod`, `nombre`, `nombre_corto`, `descripcion`, `PVP`, `familia`) VALUES
('3DSNG', NULL, 'Nintendo 3DS negro', 'Consola portátil de Nintendo que permitirá disfrutar de efectos 3D sin necesidad de gafas especiales, e incluirá retrocompatibilidad con el software de DS y de DSi.', '275.00', 'CONSOL'),
('ACERAX3950', NULL, 'Acer AX3950 I5-650 4GB 1TB W7HP', 'Características:Sistema Operativo : Windows® 7 Home Premium OriginalProcesador / ChipsetNúmero de Ranuras PCI: 1Fabricante de Procesador: IntelTipo de Procesador: Core i5Modelo de Procesador: i5-650Núcleo de Procesador: Dual-coreVelocidad de Procesador: 3,20 GHzCaché: 4 MBVelocidad de Bus: No aplicableVelocidad HyperTransport: No aplicableInterconexión QuickPathNo aplicableProcesamiento de 64 bits: SíHyperThreadingSíFabricante de Chipset: IntelModelo de Chipset: H57 ExpressMemoriaMemoria Estándar: 4 GBMemoria Máxima: 8 GBTecnología de la Memoria: DDR3 SDRAMEstándar de Memoria: DDR3-1333/PC3-10600Número de Ranuras de Memoria (Total): 4Lector de tarjeta memoria: SíSoporte de Tarjeta de Memoria: Tarjeta CompactFlash (CF)Soporte de Tarjeta de Memoria: MultiMediaCard (MMC)Soporte de Tarjeta de Memoria: Micro DriveSoporte de Tarjeta de Memoria: Memory Stick PROSoporte de Tarjeta de Memoria: Memory StickSoporte de Tarjeta de Memoria: CF+Soporte de Tarjeta de Memoria: Tarjeta Secure Digital (SD)StorageCapcidad Total del Disco Duro: 1 TBRPM de Disco Duro: 5400Tipo de Unidad Óptica: Grabadora DVDCompatibilidad de Dispositivo Óptico: DVD-RAM/±R/±RWCompatibilidad de Medios de Doble Capa: Sí', '410.00', 'ORDENA'),
('ARCLPMP32GBN', NULL, 'Archos Clipper MP3 2GB negro', 'Características:Almacenamiento Interno Disponible en 2 GB*Compatibilidad Windows o Mac y Linux (con soporte para almacenamiento masivo)Interfaz para ordenador USB 2.0 de alta velocidadBattería2 11 horas músicaReproducción Música3 MP3Medidas Dimensiones: 52mm x 27mm x 12mm, Peso: 14 Gr', '26.70', 'MP3'),
('BRAVIA2BX400', NULL, 'Sony Bravia 32IN FULLHD KDL-32BX400', 'Características:Full HD: Vea deportes películas y juegos con magníficos detalles en alta resolución gracias a la resolución 1920x1080.HDMI®: 4 entradas (3 en la parte posterior, 1 en el lateral)USB Media Player: Disfrute de películas, fotos y música en el televisor.Sintonizador de TV HD MPEG-4 AVC integrado: olvídese del codificador y acceda a servicios de TV que incluyen canales HD con el sintonizador DVB-T y DVB-C integrado con decodificador MPEG4 AVC (dependiendo del país y sólo con operadores compatibles)Sensor de luz: ajusta automáticamente el brillo según el nivel de la iluminación ambiental para que pueda disfrutar de una calidad de imagen óptima sin consumo innecesario de energía.BRAVIA Sync: controle su sistema de ocio doméstico entero con un mismo mando a distancia universal que le permite reproducir contenidos o ajustar la configuración de los dispositivos compatibles con un solo botón.BRAVIA ENGINE 2: experimente colores y detalles de imagen increíblemente nítidos y definidos. Live Colour™: seleccione entre cuatro modos: desactivado, bajo, medio y alto, para ajustar el color y obtener imágenes vivas y una calidad óptima. 24p True Cinema™: reproduzca una auténtica experiencia cinemática y disfrute de películas exactamente como el director las concibió a 24 fotogramas por segundo.', '356.90', 'TV'),
('EEEPC1005PXD', NULL, 'Asus EEEPC 1005PXD N455 1 250 BL', 'Características:Procesador: 1660 MHz, N455, Intel Atom, 0.5 MB. Memoria: 1024 MB, 2 GB, DDR3, SO-DIMM, 1 x 1024 MB. Accionamiento de disco: 2.5 \", 250 GB, 5400 RPM, Serial ATA, Serial ATA II, 250 GB. Medios de almacenaje: MMC, SD, SDHC. Exhibición: 10.1 \", 1024 x 600 Pixeles, LCD TFT. Cámara fotográfica: 0.3 MP. Red: 802.11 b/g/n, 10, 100 Mbit/s, Fast Ethernet. Audio: HD. Sistema operativo/software: Windows 7 Starter. Color: Blanco. Contro de energía: 8 MB/s, Litio-Ion, 6 piezas, 2200 mAh, 48 W. Peso y dimensiones: 1270 g, 178 mm, 262 mm, 25.9 mm, 36.5 mm', '245.40', 'NETBOK'),
('HPMIN1103120', NULL, 'HP Mini 110-3120 10.1LED N455 1GB 250GB W7S negro', 'Características:Sistema operativo instalado Windows® 7 Starter original 32 bits Procesador Procesador Intel® Atom™ N4551,66 GHz, Cache de nivel 2, 512 KB Chipset NM10 Intel® + ICH8m Memoria DDR2 de 1 GB (1 x 1024 MB) Memoria máxima Admite un máximo de 2 GB de memoria DDR2 Ranuras de memoria 1 ranura de memoria accesible de usuario Unidades internas Disco duro SATA de 250 GB (5400 rpm) Gráficos Tamaño de pantalla (diagonal) Pantalla WSVGA LED HP Antirreflejos de 25,6 cm (10,1\") en diagonal Resolución de la pantalla 1024 x 600 ', '270.00', 'NETBOK'),
('IXUS115HSAZ', NULL, 'Canon Ixus 115HS azul', 'Características:HS System (12,1 MP) Zoom 4x, 28 mm. IS Óptico Cuerpo metálico estilizado Pantalla LCD PureColor II G de 7,6 cm (3,0\") Full HD. IS Dinámico. HDMI Modo Smart Auto (32 escenas) ', '196.70', 'CAMARA'),
('KSTDT101G2', NULL, 'Kingston DataTraveler 16GB DT101G2 USB2.0 negro', 'Características:Capacidades — 16GBDimensiones — 2.19\" x 0.68\" x 0.36\" (55.65mm x 17.3mm x 9.05mm)Temperatura de Operación — 0° hasta 60° C / 32° hasta 140° FTemperatura de Almacenamiento — -20° hasta 85° C / -4° hasta 185° FSimple — Solo debe conectarlo a un puerto USB y está listo para ser utilizadoPractico — Su diseño sin tapa giratorio, protege el conector USB; sin tapa que perderGarantizado — Cinco años de garantía', '19.20', 'MEMFLA'),
('KSTDTG332GBR', NULL, 'Kingston DataTraveler G3 32GB rojo', 'Características:Tipo de producto Unidad flash USBCapacidad almacenamiento32GBAnchura 58.3 mmProfundidad 23.6 mmAltura 9.0 mmPeso 12 gColor incluido REDTipo de interfaz USB', '40.00', 'MEMFLA'),
('KSTMSDHC8GB', NULL, 'Kingston MicroSDHC 8GB', 'Kingston tarjeta de memoria flash 8 GB microSDHCÍndice de velocidad    Class 4Capacidad almacenamiento    8 GBFactor de forma  MicroSDHCAdaptador de memoria incluido   Adaptador microSDHC a SDGarantía del fabricante   Garantía limitada de por vida', '10.20', 'MEMFLA'),
('LEGRIAFS306', NULL, 'Canon Legria FS306 plata', 'Características:Grabación en tarjeta de memoria SD/SDHC La cámara de vídeo digital de Canon más pequeña nunca vista Instantánea de Vídeo (Video Snapshot) Zoom Avanzado de 41x Grabación Dual (Dual Shot) Estabilizador de la Imagen con Modo Dinámico Pre grabación (Pre REC) Sistema 16:9 de alta resolución realmente panorámico Batería inteligente y Carga Rápida Compatible con grabador de DVD DW-100 SISTEMA DE VÍDEOSoporte de grabación: Tarjeta de memoria extraíble (SD/SDHC)Tiempo máximo de grabación: Variable, dependiendo del tamaño de la tarjeta de memoria.Tarjeta SDHC de 32 GB: 20 horas 50 minutos', '175.00', 'VIDEOC'),
('LGM237WDP', NULL, 'LG TDT HD 23 M237WDP-PC FULL HD', 'Características:GeneralTamaño (pulgadas): 23Pantalla LCD: SíFormato:16:9Resolución: 1920 x 1080Full HD: SíBrillo (cd/m2): 300Ratio Contraste: 50.000:1Tiempo Respuesta (ms): 5Ángulo Visión (°): 170Número Colores (Millones): 16.7TVTDT: TDT HDConexionesD-Sub: SíDVI-D: SíHDMI: SíEuroconector: SíSalida auriculares: SíEntrada audio: SíUSB Servicio: SíRS-232C Servicio: SíPCMCIA: SíSalida óptico: Sí', '186.00', 'TV'),
('LJPROP1102W', NULL, 'HP Laserjet Pro Wifi P1102W', 'Impesora laserjet P1102W es facil de instalar y usar, ademas de que te ayudara a ahorrar energia y recursos. Olviadte de los cables y disfura de la libertad que te proporcina su tecnologia WIFI, imprime facilmente desdes cualquier de tu oficina. Formato máximo aceptado A4 A2 NoA3 NoA4 SiA5 SiA6 SiB5 SiB6 SiSobres C5 (162 x 229 mm) SiSobres C6 (114 x 162 mm) Si', '99.90', 'IMPRES'),
('OPTIOLS1100', NULL, 'Pentax Optio LS1100', 'La LS1100 con funda de transporte y tarjeta de memoria de 2GB incluidas es la compacta digital que te llevarás a todas partes. Esta cámara diseñada por Pentax incorpora un sensor CCD de 14,1 megapíxeles y un objetivo gran angular de 28 mm.', '104.80', 'CAMARA'),
('PAPYRE62GB', NULL, 'Lector ebooks Papyre6 con SD2GB + 500 ebooks', 'Marca Papyre Modelo Papyre 6.1 Uso Lector de libros electrónicos Tecnología e-ink (tinta electrónica, Vizplez) CPU Samsung Am9 200MHz Memoria - Interna: 512MB - Externa: SD/SDHC (hasta 32GB) Formatos PDF, RTF, TXT, DOC, HTML, MP3, CHM, ZIP, FB2, Formatos de imagen Pantalla 6\" (600x800px), blanco y negro, 4 niveles de grises ', '205.50', 'EBOOK'),
('PBELLI810323', NULL, 'Packard Bell I8103 23 I3-550 4G 640GB NVIDIAG210', 'Características:CPU CHIPSETProcesador : Ci3-550NorthBridge : Intel H57MEMORIAMemoria Rma : Ddr3 4096 MBDISPOSITIVOS DE ALMACENAMIENTODisco Duro: 640Gb 7200 rpmÓptico : Slot Load siper multi DvdrwLector de Tarjetas: 4 in 1 (XD, SD, HC, MS, MS PRO, MMC)dispositivos gráficosMonitor: 23 fHDTarjeta Gráfica: Nvidia G210M D3 512MbMemoria Máxima: Hasta 1918MbAUDIOAudio Out: 5.1 Audio OutAudio In: 1 jackHeasphone in: 1x jackAltavoces: StereoACCESORIOSTeclado: Teclado y ratón inalámbricoMando a distancia: EMEA Win7 WMCCOMUNICACIONESWireless: 802.11 b/g/n mini card Tarjeta de Red: 10/100/1000 MbpsBluetooth: BluethootWebcam: 1Mpixel Hd (1280x720)Tv tuner: mCARD/SW/ DVB-TMONITORTamaño: 23\"contraste: 1000:1Tiempo de respuesta: 5MSResolución: 1920 X 1080PUERTOS E/SUsb 2.0 : 6Mini Pci-e : 2Esata: 1SISTEMA OPERATIVOO.S: Microsoft Windows 7 Premium', '761.80', 'ORDENA'),
('PIXMAIP4850', NULL, 'Canon Pixma IP4850', 'Características:Tipo: chorro de tinta cartuchos independientesConexión: Hi-Speed USBPuerto de impresión directa desde camarasResolución máxima: 9600x2400 pppVelocidad impresión: 11 ipm (negro) / 9.3 ipm (color)Tamaño máximo papel: A4Bandeja entrada: 150 hojasDimensiones: 43.1 cm x 29.7 cm x 15.3 cm', '97.30', 'IMPRES'),
('PIXMAMP252', NULL, 'Canon Pixma MP252', 'Características:Funciones: Impresora, Escáner , CopiadoraConexión: USB 2.0Dimensiones:444 x 331 x 155 mmPeso: 5,8 KgIMPRESORAResolución máxima: 4800 x 1200 pppVelocidad de impresión:Negro/color: 7,0 ipm / 4,8 ipmTamaño máximo papel: A4CARTUCHOSNegro: PG-510 / PG-512Color: CL-511 / CL-513ESCANERResolución máxima: 600 x 1200 ppp (digital: 19200 x 19200)Profundidad de color: 48/24 bitsArea máxima de escaneado: A4COPIATiempo salida 1ª copia: aprox 39 seg.', '41.60', 'MULTIF'),
('PS3320GB', NULL, 'PS3 con disco duro de 320GB', 'Este Pack Incluye:- La consola Playstation 3 Slim Negra 320GB- El juego Killzone 3', '380.00', 'CONSOL'),
('PWSHTA3100PT', NULL, 'Canon Powershot A3100 plata', 'La cámara PowerShot A3100 IS, inteligente y compacta, presenta la calidad de imagen de Canon en un cuerpocompacto y ligero para capturar fotografías sin esfuerzo; es tan fácil como apuntar y disparar.Características:12,1 MP Zoom óptico 4x con IS Pantalla LCD de 6,7 cm (2,7\") ', '101.40', 'CAMARA'),
('SMSGCLX3175', NULL, 'Samsung CLX3175', 'Características:Función: Impresión color, copiadora, escánerImpresión Velocidad (Mono)Hasta 16 ppm en A4 (17 ppm en Carta)Velocidad (Color)Hasta 4 ppm en A4 (4 ppm en Carta)Salida de la Primer Página (Mono)Menos de 14 segundos (Desde el Modo Listo)ResoluciónHasta 2400 x 600 dpi de salida efectivaSalida de la Primer Página (Color)Menos de 26 segundos (Dese el Modo Listo)DuplexManualEmulaciónSPL-C (Lenguaje de color de impresión SAMSUNG)Copiado Salida de la Primer Página (Mono)18 segundosMulticopiado1 ~ 99Zoom25 ~ 400 %Funciones de CopiadoCopia ID, Clonar Copia, Copia N-UP, Copiar PosterResoluciónTexto, Texto / Foto, Modo Revista: hasta 600 x 600 ppp, Modo Foto: Hasta 1200 x 1200 pppVelocidad (Mono)Hasta 17 ppm en Carta (16 ppm en A4)Velocidad (Color)Hasta 4 ppm en Carta (4 ppm en A4 )Salida de la Primer Página (Color)45 segundosEscaneado CompatibilidadNorma TWAIN, Norma WIA (Windows2003 / XP / Vista)MétodoEscáner plano colorResolución (Óptica)1200 x 1200 dpiResolución (Mejorada)4800 x 4800 dpiEscaneado a Escanear a USB / Carpeta', '190.00', 'MULTIF'),
('SMSN150101LD', NULL, 'Samsung N150 10.1LED N450 1GB 250GB BAT6 BT W7 R', 'Características:Sistema Operativo Genuine Windows® 7 Starter Procesador Intel® ATOM Processor N450 (1.66GHz, 667MHz, 512KB) Chipset Intel® NM10Memoria del Sistema 1GB (DDR2 / 1GB x 1) Ranura de Memoria 1 x SODIMM Pantalla LCD 10.1\" WSVGA (1024 x 600), Non-Gloss, LED Back Light Gráficos Procesador Gráfico Intel® GMA 3150 DVMT Memoria Gráfica Shared Memory (Int. Grahpic) Multimedia Sonido HD (High Definition) Audio Características de Sonido SRS 3D Sound Effect Altavoces 3W Stereo Speakers (1.5W x 2) Cámara Integrada Web Camera Almacenamiento Disco duro 250GB SATA (5400 rpm S-ATA) ConectividadWired Ethernet LAN (RJ45) 10/100 LAN Wireless LAN 802.11 b/g/NBluetooth Bluetooth 3.0 High Speed I/O Port VGA Headphone-outMic-inInternal MicUSB (Chargable USB included) 3 x USB 2.0 Multi Card Slot 4-in-1 (SD, SDHC, SDXC, MMC)DC-in (Power Port)Tipo de Teclado 84 keys Touch Pad, Touch Screen Touch Pad (Scroll Scope, Flat Type) SeguridadRecovery Samsung Recovery Solution Virus McAfee Virus Scan (trial version) Seguridad BIOS Boot Up Password / HDD Password Bloqueo Kensington Lock Port Batería Adaptador 40 Watt Batería 6 Cell Dimensiones ', '260.60', 'NETBOK'),
('SMSSMXC200PB', NULL, 'Samsung SMX-C200PB EDC ZOOM 10X', 'Características:Sensor de Imagen Tipo 1 / 6” 800K pixel CCDLente Zoom Óptico 10 x opticoCaracterísticas Grabación Vídeo Estabilizador de Imagen Hiper estabilizador de imagen digitalInterfaz Tarjeta de Memoria Ranura de Tarjeta SDHC / SD', '127.20', 'VIDEOC'),
('STYLUSSX515W', NULL, 'Epson Stylus SX515W', 'Características:Resolución máxima5760 x 1440 DPIVelocidad de la impresiónVelocidad de impresión (negro, calidad normal, A4)36 ppmVelocidad de impresión (color, calidad normal, A4)36 ppmTecnología de la impresiónTecnología de impresión inyección de tintaNúmero de cartuchos de impresión4 piezasCabeza de impresoraMicro PiezoExploraciónResolución máxima de escaneado2400 x 2400 DPIEscaner color: siTipo de digitalización Escáner planoEscanaer integrado: siTecnología de exploración CISWLAN, conexión: si', '77.50', 'MULTIF'),
('TSSD16GBC10J', NULL, 'Toshiba SD16GB Class10 Jewel Case', 'Características:Densidad: 16 GBPINs de conexión: 9 pinsInterfaz: Tarjeta de memoria SD standard compatibleVelocidad de Escritura: 20 MBytes/s* Velocidad de Lectura: 20 MBytes/s*Dimensiones: 32.0 mm (L) × 24.0 mm (W) × 2.1 mm (H)Peso: 2gTemperatura: 25°C a +85°C (Recomendada)Humedad: 30% to 80% RH (sin condensación)', '32.60', 'MEMFLA'),
('ZENMP48GB300', NULL, 'Creative Zen MP4 8GB Style 300', 'Características:8 GB de capacidadAutonomía: 32 horas con archivos MP3 a 128 kbpsPantalla TFT de 1,8 pulgadas y 64.000 coloresFormatos de audio compatibles: MP3, WMA (DRM9), formato Audible 4Formatos de foto compatibles: JPEG (BMP, TIFF, GIF y PNGFormatos de vídeo compatibles: AVI transcodificado (Motion JPEG)Ecualizador de 5 bandas con 8 preajustesMicrófono integrado para grabar vozAltavoz y radio FM incorporada', '58.90', 'MP3');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pst`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `pst`;
CREATE TABLE IF NOT EXISTS `pst` (
`cod` varchar(12)
,`nombre_corto` varchar(50)
,`nombre` varchar(100)
,`unidades` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `producto` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `tienda` int(11) NOT NULL,
  `unidades` int(11) NOT NULL,
  PRIMARY KEY (`producto`,`tienda`),
  KEY `stock_ibfk_2` (`tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`producto`, `tienda`, `unidades`) VALUES
('3DSNG', 1, 2),
('3DSNG', 2, 1),
('ACERAX3950', 1, 1),
('ARCLPMP32GBN', 2, 1),
('ARCLPMP32GBN', 3, 2),
('BRAVIA2BX400', 3, 1),
('EEEPC1005PXD', 1, 2),
('EEEPC1005PXD', 2, 1),
('HPMIN1103120', 2, 1),
('HPMIN1103120', 3, 2),
('IXUS115HSAZ', 2, 2),
('KSTDT101G2', 3, 1),
('KSTDTG332GBR', 2, 2),
('KSTMSDHC8GB', 1, 1),
('KSTMSDHC8GB', 2, 2),
('KSTMSDHC8GB', 3, 2),
('LEGRIAFS306', 2, 1),
('LGM237WDP', 1, 1),
('LJPROP1102W', 2, 2),
('OPTIOLS1100', 1, 3),
('OPTIOLS1100', 2, 1),
('PAPYRE62GB', 1, 2),
('PAPYRE62GB', 3, 1),
('PBELLI810323', 2, 1),
('PIXMAIP4850', 2, 1),
('PIXMAIP4850', 3, 2),
('PIXMAMP252', 2, 1),
('PS3320GB', 1, 1),
('PWSHTA3100PT', 2, 2),
('PWSHTA3100PT', 3, 2),
('SMSGCLX3175', 2, 1),
('SMSN150101LD', 3, 1),
('SMSSMXC200PB', 2, 1),
('STYLUSSX515W', 1, 1),
('TSSD16GBC10J', 3, 2),
('ZENMP48GB300', 1, 3),
('ZENMP48GB300', 2, 2),
('ZENMP48GB300', 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

DROP TABLE IF EXISTS `tienda`;
CREATE TABLE IF NOT EXISTS `tienda` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tlf` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`cod`, `nombre`, `tlf`) VALUES
(1, 'CENTRAL', '600100100'),
(2, 'SUCURSAL1', '600100200'),
(3, 'SUCURSAL2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `user` varchar(55) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `identidad` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`user`, `email`, `password`, `estado`, `identidad`, `token`) VALUES
('Admin', 'ihabfallahy@gmail.com', 'admin', '1', 'admin', ''),
('Ihab', 'ihabfallahy@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1', 'usuario', '3db4cdb811ae405a908b41f1a306f769'),
('Isma', 'ihabfallahy@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '4', 'usuario', 'a8edd958a3f5479ebe1db76075c9ab72'),
('Pedro', 'ihabfallahy@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '3', 'usuario', '109f1d861ff456ee58bc11ceb4dbb65e');

-- --------------------------------------------------------

--
-- Estructura para la vista `ordenado`
--
DROP TABLE IF EXISTS `ordenado`;

DROP VIEW IF EXISTS `ordenado`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordenado`  AS SELECT `p`.`cod` AS `cod`, `p`.`nombre_corto` AS `nombre_corto`, `s`.`tienda` AS `tienda`, `s`.`unidades` AS `unidades` FROM (`producto` `p` join `stock` `s`) WHERE (`p`.`cod` = `s`.`producto`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pst`
--
DROP TABLE IF EXISTS `pst`;

DROP VIEW IF EXISTS `pst`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pst`  AS SELECT `p`.`cod` AS `cod`, `p`.`nombre_corto` AS `nombre_corto`, `t`.`nombre` AS `nombre`, `s`.`unidades` AS `unidades` FROM ((`producto` `p` join `stock` `s` on((`p`.`cod` = `s`.`producto`))) join `tienda` `t` on((`s`.`tienda` = `t`.`cod`))) ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`tienda`) REFERENCES `tienda` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD CONSTRAINT `lineapedido_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pedido` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lineapedido_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `producto` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `usuarios` (`user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`familia`) REFERENCES `familia` (`cod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`producto`) REFERENCES `producto` (`cod`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`tienda`) REFERENCES `tienda` (`cod`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
