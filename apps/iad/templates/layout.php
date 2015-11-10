<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <?php include_http_metas() ?>
    <?php include_metas() ?>
    <?php include_title() ?>
    
    <!--Estilos-->    
    <?php echo  use_stylesheet("ext/ext-all.css") ?>
    <?php echo use_stylesheet("ext/xtheme-slate.css") ?>
    
    <!--javascript-->
    <?php echo  javascript_include_tag('ext-3.2.1/adapter/ext/ext-base.js'); ?>
    <?php echo  javascript_include_tag('ext-3.2.1/ext-all.js'); ?>
    <?php echo  javascript_include_tag('ext-3.2.1/locale/ext-lang-es.js'); ?>
    <?php echo  javascript_include_tag('funciones_comunes/paqueteComun.js'); ?>
      
    <link rel="shortcut icon" href="/favicon.ico" />
  </head>
  <body>
    <?php echo $sf_content ?>
  </body>
</html>
