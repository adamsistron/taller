<script type="text/javascript">
Ext.ns("J002tUsuarioFiltro");
J002tUsuarioFiltro.main = {
init:function(){

//<Stores de fk>
this.storeCO_DIVISION = this.getStoreCO_DIVISION();
//<Stores de fk>
//<Stores de fk>
this.storeCO_ROL = this.getStoreCO_ROL();
//<Stores de fk>
//<Stores de fk>
this.storeCO_REGION = this.getStoreCO_REGION();
//<Stores de fk>
//<Stores de fk>
this.storeCO_NEGOCIO = this.getStoreCO_NEGOCIO();
//<Stores de fk>



this.tx_indicador = new Ext.form.TextField({
	fieldLabel:'Tx indicador',
	name:'tx_indicador',
	value:''
});

this.nb_empleado = new Ext.form.TextField({
	fieldLabel:'Nb empleado',
	name:'nb_empleado',
	value:''
});

this.ap_empleado = new Ext.form.TextField({
	fieldLabel:'Ap empleado',
	name:'ap_empleado',
	value:''
});

this.co_division = new Ext.form.ComboBox({
	fieldLabel:'Co division',
	store: this.storeCO_DIVISION,
	typeAhead: true,
	valueField: 'co_division',
	displayField:'tx_division',
	hiddenName:'co_division',
	//readOnly:(this.OBJ.co_division!='')?true:false,
	//style:(this.main.OBJ.co_division!='')?'background:#c9c9c9;':'',
	forceSelection:true,
	resizable:true,
	triggerAction: 'all',
	emptyText:'Seleccione co_division',
	selectOnFocus: true,
	mode: 'local',
	width:200,
	resizable:true,
	allowBlank:false
});
this.storeCO_DIVISION.load();

this.co_rol = new Ext.form.ComboBox({
	fieldLabel:'Co rol',
	store: this.storeCO_ROL,
	typeAhead: true,
	valueField: 'co_rol',
	displayField:'tx_rol',
	hiddenName:'co_rol',
	//readOnly:(this.OBJ.co_rol!='')?true:false,
	//style:(this.main.OBJ.co_rol!='')?'background:#c9c9c9;':'',
	forceSelection:true,
	resizable:true,
	triggerAction: 'all',
	emptyText:'Seleccione co_rol',
	selectOnFocus: true,
	mode: 'local',
	width:200,
	resizable:true,
	allowBlank:false
});
this.storeCO_ROL.load();

this.co_region = new Ext.form.ComboBox({
	fieldLabel:'Co region',
	store: this.storeCO_REGION,
	typeAhead: true,
	valueField: 'co_region',
	displayField:'tx_region',
	hiddenName:'co_region',
	//readOnly:(this.OBJ.co_region!='')?true:false,
	//style:(this.main.OBJ.co_region!='')?'background:#c9c9c9;':'',
	forceSelection:true,
	resizable:true,
	triggerAction: 'all',
	emptyText:'Seleccione co_region',
	selectOnFocus: true,
	mode: 'local',
	width:200,
	resizable:true,
	allowBlank:false,
        listeners:{
            select: function(){
                J002tUsuarioFiltro.main.storeCO_NEGOCIO.removeAll();
                J002tUsuarioFiltro.main.co_negocio.setValue('');        
                J002tUsuarioFiltro.main.storeCO_DIVISION.removeAll();
                J002tUsuarioFiltro.main.co_division.setValue('');
                J002tUsuarioFiltro.main.storeCO_NEGOCIO.load({
                    params:{
                        co_region:this.getValue()
                    }
                });
            }
        }
});
this.storeCO_REGION.load();

this.co_negocio = new Ext.form.ComboBox({
	fieldLabel:'Co negocio',
	store: this.storeCO_NEGOCIO,
	typeAhead: true,
	valueField: 'co_negocio',
	displayField:'tx_negocio',
	hiddenName:'co_negocio',
	//readOnly:(this.OBJ.co_negocio!='')?true:false,
	//style:(this.main.OBJ.co_negocio!='')?'background:#c9c9c9;':'',
	forceSelection:true,
	resizable:true,
	triggerAction: 'all',
	emptyText:'Seleccione co_negocio',
	selectOnFocus: true,
	mode: 'local',
	width:200,
	resizable:true,
	allowBlank:false,
        listeners:{
            select: function(){
                J002tUsuarioFiltro.main.storeCO_DIVISION.removeAll();
                J002tUsuarioFiltro.main.co_division.setValue('');
                
                J002tUsuarioFiltro.main.storeCO_DIVISION.load({
                params:{
                        co_negocio:this.getValue(),
                        co_region:J002tUsuarioFiltro.main.co_region.getValue()
                        
                    }    
                });
            }
        }
});
//this.storeCO_NEGOCIO.load();

    this.tabpanelfiltro = new Ext.TabPanel({
       activeTab:0,
       defaults:{layout:'form',bodyStyle:'padding:7px;',height:135,autoScroll:true},
       items:[
               {
                   title:'Información general',
                   items:[
                                                                                                            this.tx_indicador,
                                                                                this.nb_empleado,
                                                                                this.ap_empleado,
                                                                                this.co_rol,
                                                                                this.co_region,
                                                                                this.co_negocio,
                                                                                this.co_division
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
                     J002tUsuarioFiltro.main.aplicarFiltroByFormulario();
                }
            },
            {
                text:'Limpiar',
                handler:function(){
                    J002tUsuarioFiltro.main.limpiarCamposByFormFiltro();
                }
            },
            {
                text:'Cerrar',
                handler:function(){
                    J002tUsuarioFiltro.main.win.close();
                    J002tUsuarioLista.main.filtro.setDisabled(false);
                }
            }
        ]
    });
    this.win.show();
    J002tUsuarioLista.main.mascara.hide();
},
limpiarCamposByFormFiltro: function(){
    J002tUsuarioFiltro.main.panelfiltro.getForm().reset();
    J002tUsuarioLista.main.store_lista.baseParams={}
    J002tUsuarioLista.main.store_lista.baseParams.paginar = 'si';
    J002tUsuarioLista.main.gridPanel_.store.load();
},
aplicarFiltroByFormulario: function(){
    //Capturamos los campos con su value para posteriormente verificar cual
    //esta lleno y trabajar en base a ese.
    var campo = J002tUsuarioFiltro.main.panelfiltro.getForm().getValues();
    J002tUsuarioLista.main.store_lista.baseParams={};

    var swfiltrar = false;
    for(campName in campo){
        if(campo[campName]!=''){
            swfiltrar = true;
            eval("J002tUsuarioLista.main.store_lista.baseParams."+campName+" = '"+campo[campName]+"';");
        }
    }

        J002tUsuarioLista.main.store_lista.baseParams.paginar = 'si';
        J002tUsuarioLista.main.store_lista.baseParams.BuscarBy = true;
        J002tUsuarioLista.main.store_lista.load();


}
,getStoreCO_DIVISION:function(){
    this.store = new Ext.data.JsonStore({
        url:'<?php echo $_SERVER["SCRIPT_NAME"] ?>/J002tUsuario/storefkcodivision',
        root:'data',
        fields:[
            {name: 'co_division'},
            {name: 'tx_division'}
            ]
    });
    return this.store;
}
,getStoreCO_ROL:function(){
    this.store = new Ext.data.JsonStore({
        url:'<?php echo $_SERVER["SCRIPT_NAME"] ?>/J002tUsuario/storefkcorol',
        root:'data',
        fields:[
            {name: 'co_rol'},
            {name: 'tx_rol'}
            ]
    });
    return this.store;
}
,getStoreCO_REGION:function(){
    this.store = new Ext.data.JsonStore({
        url:'<?php echo $_SERVER["SCRIPT_NAME"] ?>/J002tUsuario/storefkcoregion',
        root:'data',
        fields:[
            {name: 'co_region'},
            {name: 'tx_region'}
            ]
    });
    return this.store;
}
,getStoreCO_NEGOCIO:function(){
    this.store = new Ext.data.JsonStore({
        url:'<?php echo $_SERVER["SCRIPT_NAME"] ?>/J002tUsuario/storefkconegocio',
        root:'data',
        fields:[
            {name: 'co_negocio'},
            {name: 'tx_negocio'}
            ]
    });
    return this.store;
}

};

Ext.onReady(J002tUsuarioFiltro.main.init,J002tUsuarioFiltro.main);
</script>