<script type="text/javascript">
Ext.ns("J002tUsuarioLista");
J002tUsuarioLista.main = {
condicion:function(codigo){
    return (codigo=='0')?'NO':'SI';
},
init:function(){
//Mascara general del modulo
this.mascara = new Ext.LoadMask(Ext.getBody(), {msg:"Cargando..."});

//objeto store
this.store_lista = this.getLista();

//Agregar un registro
this.nuevo = new Ext.Button({
    text:'Nuevo',
    iconCls: 'icon-nuevo',
    handler:function(){
        J002tUsuarioLista.main.mascara.show();
        this.msg = Ext.get('formularioJ002tUsuario');
        this.msg.load({
         url:"/taller/web/index.php/J002tUsuario/editar",
         scripts: true,
         text: "Cargando.."
        });
    }
});

//Editar un registro
this.editar= new Ext.Button({
    text:'Editar',
    iconCls: 'icon-editar',
    handler:function(){
	this.codigo  = J002tUsuarioLista.main.gridPanel_.getSelectionModel().getSelected().get('co_usuario');
	J002tUsuarioLista.main.mascara.show();
        this.msg = Ext.get('formularioJ002tUsuario');
        this.msg.load({
         url:"/taller/web/index.php/J002tUsuario/editar/codigo/"+this.codigo,
         scripts: true,
         text: "Cargando.."
        });
    }
});

//Eliminar un registro
this.eliminar= new Ext.Button({
    text:'Eliminar',
    iconCls: 'icon-eliminar',
    handler:function(){
	this.codigo  = J002tUsuarioLista.main.gridPanel_.getSelectionModel().getSelected().get('co_usuario');
	Ext.MessageBox.confirm('Confirmación', '¿Realmente desea eliminar este registro?', function(boton){
	if(boton=="yes"){
        Ext.Ajax.request({
            method:'POST',
            url:'/taller/web/index.php/J002tUsuario/eliminar',
            params:{
                co_usuario:J002tUsuarioLista.main.gridPanel_.getSelectionModel().getSelected().get('co_usuario')
            },
            success:function(result, request ) {
                obj = Ext.util.JSON.decode(result.responseText);
                if(obj.success==true){
		    J002tUsuarioLista.main.store_lista.load();
                    Ext.Msg.alert("Notificación",obj.msg);
                }else{
                    Ext.Msg.alert("Notificación",obj.msg);
                }
                J002tUsuarioLista.main.mascara.hide();
            }});
	}});
    }
});

//filtro
this.filtro = new Ext.Button({
    text:'Filtro',
    iconCls: 'icon-buscar',
    handler:function(){
        this.msg = Ext.get('filtroJ002tUsuario');
        J002tUsuarioLista.main.mascara.show();
        J002tUsuarioLista.main.filtro.setDisabled(true);
        this.msg.load({
             url: '/taller/web/index.php/J002tUsuario/filtro',
             scripts: true
        });
    }
});

this.editar.disable();
this.eliminar.disable();

//Grid principal
this.gridPanel_ = new Ext.grid.GridPanel({
    title:'Lista de J002tUsuario',
    iconCls: 'icon-libro',
    store: this.store_lista,
    loadMask:true,
//    frame:true,
    height:550,
    tbar:[
        this.nuevo,'-',this.editar,'-',this.eliminar,'-',this.filtro
    ],
    columns: [
    new Ext.grid.RowNumberer(),
    {header: 'co_usuario',hidden:true, menuDisabled:true,dataIndex: 'co_usuario'},
    {header: 'Tx indicador', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_indicador'},
    {header: 'Nb empleado', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'nb_empleado'},
    {header: 'Ap empleado', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'ap_empleado'},
    //{header: 'Co division', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'co_division'},
    {header: 'Tx division', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_division'},
    //{header: 'Co rol', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'co_rol'},
    {header: 'Tx rol', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_rol'},
    //{header: 'Co region', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'co_region'},
    {header: 'Tx region', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_region'},
    //{header: 'Co negocio', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'co_negocio'},
    {header: 'Tx negocio', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_negocio'},
    ],
    stripeRows: true,
    autoScroll:true,
    stateful: true,
    listeners:{cellclick:function(Grid, rowIndex, columnIndex,e ){J002tUsuarioLista.main.editar.enable();J002tUsuarioLista.main.eliminar.enable();}},
    bbar: new Ext.PagingToolbar({
        pageSize: 20,
        store: this.store_lista,
        displayInfo: true,
        displayMsg: '<span style="color:white">Registros: {0} - {1} de {2}</span>',
        emptyMsg: "<span style=\"color:white\">No se encontraron registros</span>"
    })
});


this.tab1 = new Ext.TabPanel({
        renderTo: contenedorJ002tUsuarioLista,
        activeTab: 0,
        width:950,
        heigth: 600,
        plain:true,
        defaults:{autoScroll: true},
        items:[
        
        //Llamadas a Otros TAB        
        {
            title: 'Menu',
            autoLoad:{
                url: '<?= $_SERVER["SCRIPT_NAME"]?>/J001tMenu/index',
                scripts: true,
                /*
                params:{

                }*/
            }
        },
            //TAB que llama a la Lista Local        
        {
            title: 'Datos del Usuario',
            items: this.gridPanel_
        }
                
    ]
});


//this.gridPanel_.render("contenedorJ002tUsuarioLista");

//Cargar el grid
this.store_lista.baseParams.paginar = 'si';
this.store_lista.load();
},
getLista: function(){
    this.store = new Ext.data.JsonStore({
    url:'/taller/web/index.php/J002tUsuario/storelista',
    root:'data',
    fields:[
    {name: 'co_usuario'},
    {name: 'tx_indicador'},
    {name: 'nb_empleado'},
    {name: 'ap_empleado'},
    {name: 'co_division'},
    {name: 'tx_division'},
    {name: 'co_rol'},
    {name: 'tx_rol'},
    {name: 'co_region'},
    {name: 'tx_region'},
    {name: 'co_negocio'},
    {name: 'tx_negocio'},
           ]
    });
    return this.store;
}
};
Ext.onReady(J002tUsuarioLista.main.init, J002tUsuarioLista.main);
</script>
<div id="contenedorJ002tUsuarioLista"></div>
<div id="formularioJ002tUsuario"></div>
<div id="filtroJ002tUsuario"></div>
