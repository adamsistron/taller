<?php

class J002tUsuarioPeer extends BaseJ002tUsuarioPeer
{
    static public function getNegocios($codigo_region){
        
        $c = new Criteria();
        //Limpiar todas las columnas seleccionadas del Query
        $c->clearSelectColumns();
        //Selecciona los campos a retornar en el Query
        $c->setDistinct();
        $c->addSelectColumn(J014tNegocioPeer::CO_NEGOCIO);
        $c->addSelectColumn(J014tNegocioPeer::TX_NEGOCIO);
        //Agregar los Join
        $c->addJoin(J007tRegionPeer::CO_REGION, J015tRegionNegocioPeer::CO_REGION);
        $c->addJoin(J014tNegocioPeer::CO_NEGOCIO, J015tRegionNegocioPeer::CO_NEGOCIO);
        //Agregar el Where
        $c->add(J007tRegionPeer::CO_REGION,$codigo_region);
        $c->addAscendingOrderByColumn(J014tNegocioPeer::TX_NEGOCIO);
        /*
         SELECT 
            j014t_negocio.co_negocio, 
            j014t_negocio.tx_negocio
        FROM 
            public.j007t_region, 
            public.j014t_negocio, 
            public.j015t_region_negocio
        WHERE 
            j007t_region.co_region = j015t_region_negocio.co_region AND
            j014t_negocio.co_negocio = j015t_region_negocio.co_negocio AND
            j007t_region.co_region = 1; 
        */
        //Query simple "SELECT * FROM" de la Tabla J014tNegocioPeer
        $stmt = J014tNegocioPeer::doSelectStmt($c);
        $registros = array();
        while($reg = $stmt->fetch(PDO::FETCH_ASSOC)){
            $registros[] = $reg;
        }
        
        return $registros;
        
    }
}
