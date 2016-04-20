<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<title>Sistema de Gestion STI</title>
  <head>
	<?php echo include_http_metas() ?>
	<?php echo include_metas() ?>
	<?php echo include_title() ?>

<?php echo  use_stylesheet("ext/ext-all.css") ?>
<?php echo use_stylesheet("ext/xtheme-pdvsa.css") ?>
<?php echo  use_stylesheet("iconos.css") ?>
<?php echo  use_stylesheet("ext/fileuploadfield.css") ?>
<?php echo  javascript_include_tag('ext-3.2.1/adapter/ext/ext-base.js'); ?>
<?php echo  javascript_include_tag('ext-3.2.1/ext-all.js'); ?>
<?php echo  javascript_include_tag('ext-3.2.1/locale/ext-lang-es.js'); ?>
<?php echo  javascript_include_tag('funciones_comunes/paqueteComun.js'); ?>
<?php echo  javascript_include_tag('open/js/swfobject.js'); ?>
<?php echo  javascript_include_tag('ventana_grafico.js'); ?>
<?php echo  javascript_include_tag('ext-3.2.1/ux/fileuploadfield/FileUploadField.js'); ?>

<link rel="shortcut icon" href="http://intranet.pdvsa.com/favicon.ico" />
<div id="header" class="x-panel-header" style="margin:0px 0px 0px 0px; padding: 2px 2px 2px 10px;"> 
	<div style="float:left; width:500px; font-size:18px; line-height:22px; ">
		..::Sistema de Gestion STI PDVSA::..
	</div>	
    <div id="usuarioConectado" style="float:right; padding:2px 20px 2px 20px; border:1px solid #AABBCC; background: #E8E8E8">
        <div style="float:left; margin-right: 20px; vertical-align: bottom; font-size: 11px; color:#444 ">
         <img src="../images/user.gif" align="bottom" style="margin-right: 5px;"/> <?php echo $sf_request->getAttribute('titulo'); ?> </div>
         <div id="btnSalir" style="float:left; margin-left: 20px">
        </div>
    </div>
</div>
  </head>
<script type="text/javascript">
        this.panel_detalle =  new Ext.Panel({
                region: 'east', // a center region is ALWAYS required for border layout
                title: 'Detalles del Documento',
                id: 'detalle_registro',
                collapsible: true,
                collapseMode: 'mini',
                collapsed:true,
                split: true,
                autoScroll: true,
                titleCollapse: true,
                deferredRender: false,
                width:450,
                script:true,
		iconCls: 'icon-reporteest',
                items:[
			new Ext.Panel({
				id: 'detalle'
			})
                ]
	});

Ext.onReady(function(){

	    var arbol = new Ext.tree.TreePanel({
                    id:'im-tree',
                    loader: new Ext.tree.TreeLoader(),
                    rootVisible:false,
                    lines:true,
                    autoScroll:true,
                    border: false,
                    autoHeight:true,
                    width:550,
                    iconCls:'nav',
                    root: new Ext.tree.AsyncTreeNode({
                        text:'Inicio',
			 expanded: true,
                        children:[<?php  echo $sf_request->getAttribute('menu'); ?>]

                    })
            });  

        Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
	// Start a simple clock task that updates a div once per second
	this.updateClock = function(){
		Ext.getCmp('clock').setText(new Date().format('g:i:s A'));
	} 
	//Configuration object for the task
	this.task = {
		run: this.updateClock, //the function to run
	   	interval: 1000 //every second
	} 
	//creates a new manager
	this.runner = new Ext.util.TaskRunner();
	this.runner.start(this.task); //start runing the task every one second
	this.clock = new Ext.Toolbar.TextItem({id:'clock',text: '00:00:00 AM'});
        this.statusbar = new Ext.Toolbar({
	items:['Sesion Iniciada','->',this.clock]
	}); 
        var viewport = new Ext.Viewport({
	layout: 'border',
	items: [
		    // create instance immediately
		    new Ext.BoxComponent({
		        region: 'north',
		        height: 33, // give north and south regions a height
		 	contentEl:'header'
		    }),{
		        region: 'west',
		        id: 'west-panel', // see Ext.getCmp() below
		        title: 'Menu del Sistema',
			iconCls: 'icon-navegacion',
		        split: true,
		        width: 230,
		        minSize: 175,
		        maxSize: 400,
			autoScroll:true,
		        collapsible: true,
			animCollapse: true,
		        margins: '0 0 0 0',
			bbar: this.statusbar,
		        items: [arbol]
		    },
			new Ext.Panel({
			region: 'center',
			deferredRender: false,
			border:false,
			autoScroll: true,
			items: [
				new Ext.Panel({
					id: 'tabPrincipal',
					border:true,
					title: 'Inicio',
                                        autoScroll:true,
					iconCls:'icon-inicio',
					contentEl:'centro'
				})
			]
			}),
            	    this.panel_detalle
           ]
         });
    });

	new Ext.Button({
                id:'btnSalir',
                text: 'Cerrar sesi&oacute;n',
                handler: logOut,
                iconCls:'icon-salir2',
                renderTo:'btnSalir'
        });

	function logOut(){
		Ext.MessageBox.confirm('Confirmar', 'Seguro que desea salir de la Aplicaci&oacute;n?', showResult);
		}

	function showResult(btn){
	if(btn=="yes"){
	Ext.MessageBox.show({title: 'Cerrando sesi&oacute;n', msg: '<br>Por favor  Espere...',width:300,closable:false,icon:Ext.MessageBox.INFO});
		location.href='<?php echo  $_SERVER['SCRIPT_NAME']; ?>/login/limpiar';
		}
	}
</script>
	<body style="background: #FFFFFF">
		<div id="centro" align="center" style="padding-bottom: 1%;width:100%;height:600px;">     
		</div>
		<div id="centro" class="x-hide-display"><?php  echo $sf_content ?></div>
		<div id="props-panel" class="x-hide-display" style="width:200px;height:200px;overflow:hidden;"></div> 
	</body>
</html>
