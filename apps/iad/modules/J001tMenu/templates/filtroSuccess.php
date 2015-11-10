<script type="text/javascript">
Ext.ns("J001tMenuFiltro");
J001tMenuFiltro.main = {
init:function(){

//<Stores de fk>
this.storeCO_MENU = this.getStoreCO_MENU();
//<Stores de fk>



this.tx_menu = new Ext.form.TextField({
	fieldLabel:'Tx menu',
	name:'tx_menu',
	value:''
});

this.co_padre = new Ext.form.ComboBox({
	fieldLabel:'Co padre',
	store: this.storeCO_MENU,
	typeAhead: true,
	valueField: 'co_menu',
	displayField:'co_menu',
	hiddenName:'co_padre',
	//readOnly:(this.OBJ.co_padre!='')?true:false,
	//style:(this.main.OBJ.co_padre!='')?'background:#c9c9c9;':'',
	forceSelection:true,
	resizable:true,
	triggerAction: 'all',
	emptyText:'Seleccione co_padre',
	selectOnFocus: true,
	mode: 'local',
	width:200,
	resizable:true,
	allowBlank:false
});
this.storeCO_MENU.load();

this.tx_href = new Ext.form.TextField({
	fieldLabel:'Tx href',
	name:'tx_href',
	value:''
});

this.tx_icono = new Ext.form.TextField({
	fieldLabel:'Tx icono',
	name:'tx_icono',
	value:''
});

this.nu_orden = new Ext.form.NumberField({
	fieldLabel:'Nu orden',
	name:'nu_orden',
	value:''
});

this.tx_sigla = new Ext.form.TextField({
	fieldLabel:'Tx sigla',
	name:'tx_sigla',
	value:''
});

    this.tabpanelfiltro = new Ext.TabPanel({
       activeTab:0,
       defaults:{layout:'form',bodyStyle:'padding:7px;',height:135,autoScroll:true},
       items:[
               {
                   title:'Información general',
                   items:[
                                                                                                            this.tx_menu,
                                                                                this.co_padre,
                                                                                this.tx_href,
                                                                                this.tx_icono,
                                                                                this.nu_orden,
                                                                                this.tx_sigla,
                                           ]
               }
            ]
    });

    this.panelfiltro = new Ext.form.FormPanel({
        frame:true,
        autoWidth:true,
        border:false,
        items:[
            this.tabpanelfiltro
        ]
    });

    this.win = new Ext.Window({
        title:'Parametros de busqueda',
        iconCls: 'icon-buscar',
        width:600,
        autoHeight:true,
        constrain:true,
        closable:false,
        buttonAlign:'center',
        items:[
            this.panelfiltro
        ],
        buttons:[
            {
                text:'Filtrar',
                handler:function(){
                     J001tMenuFiltro.main.aplicarFiltroByFormulario();
                }
            },
            {
                text:'Limpiar',
                handler:function(){
                    J001tMenuFiltro.main.limpiarCamposByFormFiltro();
                }
            },
            {
                text:'Cerrar',
                handler:function(){
                    J001tMenuFiltro.main.win.close();
                    J001tMenuLista.main.filtro.setDisabled(false);
                }
            }
        ]
    });
    this.win.show();
    J001tMenuLista.main.mascara.hide();
},
limpiarCamposByFormFiltro: function(){
    J001tMenuFiltro.main.panelfiltro.getForm().reset();
    J001tMenuLista.main.store_lista.baseParams={}
    J001tMenuLista.main.store_lista.baseParams.paginar = 'si';
    J001tMenuLista.main.gridPanel_.store.load();
},
aplicarFiltroByFormulario: function(){
    //Capturamos los campos con su value para posteriormente verificar cual
    //esta lleno y trabajar en base a ese.
    var campo = J001tMenuFiltro.main.panelfiltro.getForm().getValues();
    J001tMenuLista.main.store_lista.baseParams={};

    var swfiltrar = false;
    for(campName in campo){
        if(campo[campName]!=''){
            swfiltrar = true;
            eval("J001tMenuLista.main.store_lista.baseParams."+campName+" = '"+campo[campName]+"';");
        }
    }

        J001tMenuLista.main.store_lista.baseParams.paginar = 'si';
        J001tMenuLista.main.store_lista.baseParams.BuscarBy = true;
        J001tMenuLista.main.store_lista.load();


}
,getStoreCO_MENU:function(){
    this.store = new Ext.data.JsonStore({
        url:'<?php echo $_SERVER["SCRIPT_NAME"] ?>/J001tMenu/storefkcopadre',
        root:'data',
        fields:[
            {name: 'co_menu'}
            ]
    });
    return this.store;
}

};

Ext.onReady(J001tMenuFiltro.main.init,J001tMenuFiltro.main);
</script>