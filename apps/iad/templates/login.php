<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>Sistema de Gestion STI</title>
	<link rel="shortcut icon" href="http://intranet.pdvsa.com/favicon.ico" /> 
        <?php echo use_stylesheet("ext/ext-all.css") ?>
        <?php echo use_stylesheet("ext/xtheme-pdvsa.css") ?>
        <?php echo use_stylesheet("iconos.css") ?>
</head>
  <body background="#FFFFFF" >
    <style type="text/css">
        h1 {font: normal 60px tahoma, arial, verdana;color: #E1E1E1;}
        h2 {font: normal 20px tahoma, arial, verdana;color: #E1E1E1;}
        h2 a {text-decoration: none;color: #E1E1E1;}
        .x-window-mc {background-color : #F4F4F4 !important;}
    </style>
    <h1>Sistema de GestiÃ³n</h1>
	<div id="loading-mask" style=""></div>
  	<div id="loading">
		<div class="loading-indicator">
                <img src="/sgsti/web/images/32x32/blue-loading.gif" width="32" height="32" style="margin-right:8px; padding-left:120px; float:left;vertical-align:top;"/>
                 ..::Sistema de Gestion de STI::..<br />
                <span id="loading-msg">Cargando...</span>
            </div>
        </div>
   <!-- <img src="../images/banner.gif" align="bottom" width="100%" height="110"/>-->
<script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Cargando el Componente Central ...';</script>
<?php echo javascript_include_tag('ext-3.2.1/adapter/ext/ext-base.js'); ?>
<script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Cargando la Interfaz Grafica...';</script>
<?php echo javascript_include_tag('ext-3.2.1/ext-all.js'); ?>
<script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Cargando el idioma...';</script>
<?php echo javascript_include_tag('ext-3.2.1/locale/ext-lang-es.js'); ?>
<script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Cargando Esquema General...';</script>
<?php echo javascript_include_tag('funciones_comunes/paqueteComun.js'); ?>
<script type="text/javascript">document.getElementById('loading-msg').innerHTML = 'Cargando Login...';</script> 
<?php echo javascript_include_tag('util.js'); ?>
          
       <div id="winValidar">
          <div id="msgValidar" style="margin-bottom: 20px; font-size: 12px; font-weight: bold; color:#444; display: none">
            Acceso para usuarios registrados
          </div>
           <div id="principal" align="center" style="padding-bottom: 1%">
                     <?php echo $sf_content ?>
            </div>         
       </div>  	
  </body>
 </html>
