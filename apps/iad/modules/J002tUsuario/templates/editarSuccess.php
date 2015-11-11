<script type="text/javascript">
Ext.ns("J002tUsuarioEditar");
J002tUsuarioEditar.main = {
init:function(){

this.OBJ = paqueteComunJS.funcion.doJSON({stringData:'<?php echo $data ?>'});
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

//<ClavePrimaria>
this.co_usuario = new Ext.form.Hidden({
    name:'co_usuario',
    value:this.OBJ.co_usuario});
//</ClavePrimaria>


this.tx_indicador = new Ext.form.TextField({
	fieldLabel:'Tx indicador',
	name:'j002t_usuario[tx_indicador]',
	value:this.OBJ.tx_indicador,
	allowBlank:false,
	width:200
});

this.nb_empleado = new Ext.form.TextField({
//	fieldLabel:'Nb empleado',
	name:'j002t_usuario[nb_empleado]',
	value:this.OBJ.nb_empleado,
	allowBlank:false,
	width:200
});

this.ap_empleado = new Ext.form.TextField({
	fieldLabel:'Ap empleado',
	name:'j002t_usuario[ap_empleado]',
	value:this.OBJ.ap_empleado,
	allowBlank:false,
	width:200
});

this.co_division = new Ext.form.ComboBox({
	fieldLabel:'Co division',
	store: this.storeCO_DIVISION,
	typeAhead: true,
	valueField: 'co_division',
	displayField:'tx_division',
	hiddenName:'j002t_usuario[co_division]',
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
//this.storeCO_DIVISION.load();
	paqueteComunJS.funcion.seleccionarComboByCo({
	objCMB: this.co_division,
	value:  this.OBJ.co_division,
	objStore: this.storeCO_DIVISION
});

this.co_rol = new Ext.form.ComboBox({
	fieldLabel:'Co rol',
	store: this.storeCO_ROL,
	typeAhead: true,
	valueField: 'co_rol',
	displayField:'tx_rol',
	hiddenName:'j002t_usuario[co_rol]',
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
	paqueteComunJS.funcion.seleccionarComboByCo({
	objCMB: this.co_rol,
	value:  this.OBJ.co_rol,
	objStore: this.storeCO_ROL
});

this.co_region = new Ext.form.ComboBox({
	fieldLabel:'Co region',
	store: this.storeCO_REGION,
	typeAhead: true,
	valueField: 'co_region',
	displayField:'tx_region',
	hiddenName:'j002t_usuario[co_region]',
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
                J002tUsuarioEditar.main.storeCO_NEGOCIO.removeAll();
                J002tUsuarioEditar.main.co_negocio.setValue('');        
                J002tUsuarioEditar.main.storeCO_DIVISION.removeAll();
                J002tUsuarioEditar.main.co_division.setValue('');
                J002tUsuarioEditar.main.storeCO_NEGOCIO.load({
                    params:{
                        co_region:this.getValue()
                    }
                });
            }
        }
});
this.storeCO_REGION.load();
	paqueteComunJS.funcion.seleccionarComboByCo({
	objCMB: this.co_region,
	value:  this.OBJ.co_region,
	objStore: this.storeCO_REGION,
});

if(this.OBJ.co_region!=''){
    J002tUsuarioEditar.main.storeCO_NEGOCIO.load({
                    params:{
                        co_region:J002tUsuarioEditar.main.OBJ.co_region
                    }
                });
}

this.co_negocio = new Ext.form.ComboBox({
	fieldLabel:'Co negocio',
	store: this.storeCO_NEGOCIO,
	typeAhead: true,
	valueField: 'co_negocio',
	displayField:'tx_negocio',
	hiddenName:'j002t_usuario[co_negocio]',
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
                J002tUsuarioEditar.main.storeCO_DIVISION.removeAll();
                J002tUsuarioEditar.main.co_division.setValue('');
                
                J002tUsuarioEditar.main.storeCO_DIVISION.load({
                params:{
                        co_negocio:this.getValue(),
                        co_region:J002tUsuarioEditar.main.co_region.getValue()
                        
                    }
                });
            }
        }
});
//this.storeCO_NEGOCIO.load();
	paqueteComunJS.funcion.seleccionarComboByCo({
	objCMB: this.co_negocio,
	value:  this.OBJ.co_negocio,
	objStore: this.storeCO_NEGOCIO
});


if(this.OBJ.co_negocio!=''){
    J002tUsuarioEditar.main.storeCO_DIVISION.load({
                    params:{
                        co_region:J002tUsuarioEditar.main.OBJ.co_region,
                        co_negocio:J002tUsuarioEditar.main.OBJ.co_negocio
                    }
                });
}

this.guardar = new Ext.Button({
    text:'Guardar',
    iconCls: 'icon-guardar',
    handler:function(){

        if(!J002tUsuarioEditar.main.formPanel_.getForm().isValid()){
            Ext.Msg.alert("Alerta","Debe ingresar los campos en rojo");
            return false;
        }
        J002tUsuarioEditar.main.formPanel_.getForm().submit({
            method:'POST',
            url:'/taller/web/index.php/J002tUsuario/guardar',
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
                 J002tUsuarioLista.main.store_lista.load();
                 J002tUsuarioEditar.main.winformPanel_.hide();
             }
        });

   
    }
});

this.salir = new Ext.Button({
    text:'Salir',
//    iconCls: 'icon-cancelar',
    handler:function(){
        J002tUsuarioEditar.main.winformPanel_.close();
    }
});
this.fielset1 = new Ext.form.FieldSet({

            title: 'Datos de Usuario',
            items: [
                {
                    xtype: 'compositefield',
                    fieldLabel:'Datos Usuario',
                    items: [                    
                    
                    {
                        xtype: 'displayfield',
                        value: 'Indicador'
                    },this.tx_indicador,
                    {
                        xtype: 'displayfield',
                        value: 'Nombre'
                    },this.nb_empleado,
                    {
                        xtype: 'displayfield',
                        value: 'Apellido'
                    },this.ap_empleado,
                    {
                        xtype: 'displayfield',
                        value: 'Rol'
                    },this.co_rol,
                ]}
            ]
        });
this.fielset2 = new Ext.form.FieldSet({
            title: 'Ubicación de Usuario',
            items: [
                {
                    xtype: 'compositefield',
                    fieldLabel:'Datos Ubicación',
                        items: [
                        {
                            xtype: 'displayfield',
                            value: 'División'
                        },this.co_division,
                        {
                            xtype: 'displayfield',
                            value: 'Región'
                        },this.co_region,
                        {
                            xtype: 'displayfield',
                            value: 'Negocio'
                        },this.co_negocio,
                        {
                            xtype: 'displayfield',
                            value: 'División'
                        },this.co_division,
                    ]
            }
                     
            ],
                 
        });
     
        
this.formPanel_ = new Ext.form.FormPanel({
    
    
    frame:true,
    width:1400,
//autoHeight:true,  
    autoScroll:true,
    bodyStyle:'padding:10px;',

            items:[
                this.co_usuario,
                this.fielset1,
                this.fielset2
            ]
    
});

this.winformPanel_ = new Ext.Window({
    title:'Formulario: J002tUsuario',
    modal:true,
    constrain:true,
    width:1400,
//autoWidth:true,
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
J002tUsuarioLista.main.mascara.hide();
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
Ext.onReady(J002tUsuarioEditar.main.init, J002tUsuarioEditar.main);
</script>
