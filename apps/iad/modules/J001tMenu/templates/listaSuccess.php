<script type="text/javascript">
Ext.ns("J001tMenuLista");
J001tMenuLista.main = {
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
        J001tMenuLista.main.mascara.show();
        this.msg = Ext.get('formularioJ001tMenu');
        this.msg.load({
         url:"/taller/web/index.php/J001tMenu/editar",
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
	this.codigo  = J001tMenuLista.main.gridPanel_.getSelectionModel().getSelected().get('co_menu');
	J001tMenuLista.main.mascara.show();
        this.msg = Ext.get('formularioJ001tMenu');
        this.msg.load({
         url:"/taller/web/index.php/J001tMenu/editar/codigo/"+this.codigo,
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
	this.codigo  = J001tMenuLista.main.gridPanel_.getSelectionModel().getSelected().get('co_menu');
	Ext.MessageBox.confirm('Confirmación', '¿Realmente desea eliminar este registro?', function(boton){
	if(boton=="yes"){
        Ext.Ajax.request({
            method:'POST',
            url:'/taller/web/index.php/J001tMenu/eliminar',
            params:{
                co_menu:J001tMenuLista.main.gridPanel_.getSelectionModel().getSelected().get('co_menu')
            },
            success:function(result, request ) {
                obj = Ext.util.JSON.decode(result.responseText);
                if(obj.success==true){
		    J001tMenuLista.main.store_lista.load();
                    Ext.Msg.alert("Notificación",obj.msg);
                }else{
                    Ext.Msg.alert("Notificación",obj.msg);
                }
                J001tMenuLista.main.mascara.hide();
            }});
	}});
    }
});

//filtro
this.filtro = new Ext.Button({
    text:'Filtro',
    iconCls: 'icon-buscar',
    handler:function(){
        this.msg = Ext.get('filtroJ001tMenu');
        J001tMenuLista.main.mascara.show();
        J001tMenuLista.main.filtro.setDisabled(true);
        this.msg.load({
             url: '/taller/web/index.php/J001tMenu/filtro',
             scripts: true
        });
    }
});

this.editar.disable();
this.eliminar.disable();

//Grid principal
this.gridPanel_ = new Ext.grid.GridPanel({
    title:'Lista de J001tMenu',
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
    /*{header: 'co_menu',hidden:true, menuDisabled:true,dataIndex: 'co_menu'},
    {header: 'Tx menu', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_menu'},
    {header: 'Co padre', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'co_padre'},
    {header: 'Href', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_href'},
    {header: 'Tx icono', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_icono'},
    {header: 'Nu orden', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'nu_orden'},
    {header: 'Tx sigla', width:100,  menuDisabled:true, sortable: true,  dataIndex: 'tx_sigla'},*/
    {header: 'co_menu',hidden:false, menuDisabled:false,dataIndex: 'co_menu'},
    {header: 'Tx menu', width:100,  menuDisabled:false, sortable: true,  dataIndex: 'tx_menu'},
    {header: 'Co padre', width:100,  menuDisabled:false, sortable: true,  dataIndex: 'co_padre'},
    {header: 'Href', width:100,  menuDisabled:false, sortable: true,  dataIndex: 'tx_href'},
    {header: 'Tx icono', width:100,  menuDisabled:false, sortable: true,  dataIndex: 'tx_icono'},
    {header: 'Nu orden', width:100,  menuDisabled:false, sortable: true,  dataIndex: 'nu_orden'},
    {header: 'Tx sigla', width:100,  menuDisabled:false, sortable: true,  dataIndex: 'tx_sigla'},
    ],
    stripeRows: true,
    autoScroll:true,
    stateful: true,
    listeners:{cellclick:function(Grid, rowIndex, columnIndex,e ){J001tMenuLista.main.editar.enable();J001tMenuLista.main.eliminar.enable();}},
    bbar: new Ext.PagingToolbar({
        pageSize: 20,
        store: this.store_lista,
        displayInfo: true,
        displayMsg: '<span style="color:white">Registros: {0} - {1} de {2}</span>',
        emptyMsg: "<span style=\"color:white\">No se encontraron registros</span>"
    })
});

this.gridPanel_.render("contenedorJ001tMenuLista");

//Cargar el grid
this.store_lista.baseParams.paginar = 'si';
this.store_lista.load();
},
getLista: function(){
    this.store = new Ext.data.JsonStore({
    url:'/taller/web/index.php/J001tMenu/storelista',
    root:'data',
    fields:[
    {name: 'co_menu'},
    {name: 'tx_menu'},
    {name: 'co_padre'},
    {name: 'tx_href'},
    {name: 'tx_icono'},
    {name: 'nu_orden'},
    {name: 'tx_sigla'},
           ]
    });
    return this.store;
}
};
Ext.onReady(J001tMenuLista.main.init, J001tMenuLista.main);
</script>
<div id="contenedorJ001tMenuLista"></div>
<div id="formularioJ001tMenu"></div>
<div id="filtroJ001tMenu"></div>
