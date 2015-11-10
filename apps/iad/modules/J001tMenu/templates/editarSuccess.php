<script type="text/javascript">
Ext.ns("J001tMenuEditar");
J001tMenuEditar.main = {
init:function(){

this.OBJ = paqueteComunJS.funcion.doJSON({stringData:'<?php echo $data ?>'});
//<Stores de fk>
this.storeCO_MENU = this.getStoreCO_MENU();
//<Stores de fk>

//<ClavePrimaria>
this.co_menu = new Ext.form.Hidden({
    name:'co_menu',
    value:this.OBJ.co_menu});
//</ClavePrimaria>


this.tx_menu = new Ext.form.TextField({
	fieldLabel:'Tx menu',
	name:'j001t_menu[tx_menu]',
	value:this.OBJ.tx_menu,
	allowBlank:false,
	width:200
});

this.co_padre = new Ext.form.ComboBox({
	fieldLabel:'Padre',
	store: this.storeCO_MENU,
	typeAhead: true,
	valueField: 'co_menu',
	displayField:'tx_menu',
	hiddenName:'j001t_menu[co_padre]',
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
	paqueteComunJS.funcion.seleccionarComboByCo({
	objCMB: this.co_padre,
	value:  this.OBJ.co_padre,
	objStore: this.storeCO_MENU
});

this.tx_href = new Ext.form.TextField({
	fieldLabel:'Tx href',
	name:'j001t_menu[tx_href]',
	value:this.OBJ.tx_href,
	allowBlank:false,
	width:200
});

this.tx_icono = new Ext.form.TextField({
	fieldLabel:'Tx icono',
	name:'j001t_menu[tx_icono]',
	value:this.OBJ.tx_icono,
	allowBlank:false,
	width:200
});

this.nu_orden = new Ext.form.NumberField({
	fieldLabel:'Nu orden',
	name:'j001t_menu[nu_orden]',
	value:this.OBJ.nu_orden,
	allowBlank:false
});

this.tx_sigla = new Ext.form.TextField({
	fieldLabel:'Tx sigla',
	name:'j001t_menu[tx_sigla]',
	value:this.OBJ.tx_sigla,
	allowBlank:false,
	width:200
});

this.guardar = new Ext.Button({
    text:'Guardar',
    iconCls: 'icon-guardar',
    handler:function(){

        if(!J001tMenuEditar.main.formPanel_.getForm().isValid()){
            Ext.Msg.alert("Alerta","Debe ingresar los campos en rojo");
            return false;
        }
        J001tMenuEditar.main.formPanel_.getForm().submit({
            method:'POST',
            url:'/taller/web/index.php/J001tMenu/guardar',
            waitMsg: 'Enviando datos, por favor espere..',
            waitTitle:'Enviando',
            failure: function(form, action) {
                Ext.MessageBox.alert('Error en transacción', action.result.msg);
            },
            success: function(form, action) {
                 if(action.result.success){
                     Ext.MessageBox.show({
                         title: 'Mensaje',
                         msg: action.result.msg,
                         closable: false,
                         icon: Ext.MessageBox.INFO,
                         resizable: false,
			 animEl: document.body,
                         buttons: Ext.MessageBox.OK
                     });
                 }
                 J001tMenuLista.main.store_lista.load();
                 J001tMenuEditar.main.winformPanel_.hide();
             }
        });

   
    }
});

this.salir = new Ext.Button({
    text:'Salir',
//    iconCls: 'icon-cancelar',
    handler:function(){
        J001tMenuEditar.main.winformPanel_.close();
    }
});

this.formPanel_ = new Ext.form.FormPanel({
    frame:true,
    width:400,
autoHeight:true,  
    autoScroll:true,
    bodyStyle:'padding:10px;',
    items:[

                    this.co_menu,
                    this.tx_menu,
                    this.co_padre,
                    this.tx_href,
                    this.tx_icono,
                    this.nu_orden,
                    this.tx_sigla,
            ]
});

this.winformPanel_ = new Ext.Window({
    title:'Formulario: J001tMenu',
    modal:true,
    constrain:true,
width:400,
    frame:true,
    closabled:true,
    autoHeight:true,
    items:[
        this.formPanel_
    ],
    buttons:[
        this.guardar,
        this.salir
    ],
    buttonAlign:'center'
});
this.winformPanel_.show();
J001tMenuLista.main.mascara.hide();
}
,getStoreCO_MENU:function(){
    this.store = new Ext.data.JsonStore({
        url:'<?php echo $_SERVER["SCRIPT_NAME"] ?>/J001tMenu/storefkcopadre',
        root:'data',
        fields:[
            {name: 'co_menu'},
            {name: 'tx_menu'}
            
            ]
    });
    return this.store;
}
};
Ext.onReady(J001tMenuEditar.main.init, J001tMenuEditar.main);
</script>
