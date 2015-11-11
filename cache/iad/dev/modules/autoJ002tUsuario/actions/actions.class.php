<?php

/**
 * autoJ002tUsuario actions.
 * NombreClaseModel(J002tUsuario)
 * NombreTabla(j002t_usuario)
 * @package    ##PROJECT_NAME##
 * @subpackage autoJ002tUsuario
 * @author     ##AUTHOR_NAME##
 * @version    SVN: $Id: actions.class.php 16948 2009-04-03 15:52:30Z fabien $
 */
class autoJ002tUsuarioActions extends sfActions
{

  public function executeIndex(sfWebRequest $request)
  {
    $this->forward('J002tUsuario', 'lista');
  }

  public function executeNuevo(sfWebRequest $request)
  {
    $this->forward('J002tUsuario', 'editar');
  }

  public function executeFiltro(sfWebRequest $request)
  {

  }

  public function executeEditar(sfWebRequest $request)
  {
    $codigo = $this->getRequestParameter("codigo");
    if($codigo!=''||$codigo!=null){
        $c = new Criteria();
                $c->add(J002tUsuarioPeer::CO_USUARIO,$codigo);
        
        $stmt = J002tUsuarioPeer::doSelectStmt($c);
        $campos = $stmt->fetch(PDO::FETCH_ASSOC);
        $this->data = json_encode(array(
                            "co_usuario"     => $campos["co_usuario"],
                            "tx_indicador"     => $campos["tx_indicador"],
                            "nb_empleado"     => $campos["nb_empleado"],
                            "ap_empleado"     => $campos["ap_empleado"],
                            "co_division"     => $campos["co_division"],
                            "co_rol"     => $campos["co_rol"],
                            "co_region"     => $campos["co_region"],
                            "co_negocio"     => $campos["co_negocio"],
                    ));
    }else{
        $this->data = json_encode(array(
                            "co_usuario"     => "",
                            "tx_indicador"     => "",
                            "nb_empleado"     => "",
                            "ap_empleado"     => "",
                            "co_division"     => "",
                            "co_rol"     => "",
                            "co_region"     => "",
                            "co_negocio"     => "",
                    ));
    }

  }

  public function executeGuardar(sfWebRequest $request)
  {

            $codigo = $this->getRequestParameter("co_usuario");
        
     $con = Propel::getConnection();
     if($codigo!=''||$codigo!=null){
         $j002t_usuario = J002tUsuarioPeer::retrieveByPk($codigo);
     }else{
         $j002t_usuario = new J002tUsuario();
     }
     try
      { 
        $con->beginTransaction();
       
        $j002t_usuarioForm = $this->getRequestParameter('j002t_usuario');
/*CAMPOS*/
                                        
        /*Campo tipo VARCHAR */
        $j002t_usuario->setTxIndicador($j002t_usuarioForm["tx_indicador"]);
                                                        
        /*Campo tipo VARCHAR */
        $j002t_usuario->setNbEmpleado($j002t_usuarioForm["nb_empleado"]);
                                                        
        /*Campo tipo VARCHAR */
        $j002t_usuario->setApEmpleado($j002t_usuarioForm["ap_empleado"]);
                                                        
        /*Campo tipo BIGINT */
        $j002t_usuario->setCoDivision($j002t_usuarioForm["co_division"]);
                                                        
        /*Campo tipo BIGINT */
        $j002t_usuario->setCoRol($j002t_usuarioForm["co_rol"]);
                                                        
        /*Campo tipo BIGINT */
        $j002t_usuario->setCoRegion($j002t_usuarioForm["co_region"]);
                                                        
        /*Campo tipo BIGINT */
        $j002t_usuario->setCoNegocio($j002t_usuarioForm["co_negocio"]);
                                
        /*CAMPOS*/
        $j002t_usuario->save($con);
        $this->data = json_encode(array(
                    "success" => true,
                    "msg" => 'Modificación realizada exitosamente'
                ));
        $con->commit();
      }catch (PropelException $e)
      {
        $con->rollback();
        $this->data = json_encode(array(
            "success" => false,
            "msg" =>  $e->getMessage()
        ));
      }
    }
  

  public function executeEliminar(sfWebRequest $request)
  {
	$codigo = $this->getRequestParameter("co_usuario");
	$con = Propel::getConnection();
	try
	{ 
	$con->beginTransaction();
	/*CAMPOS*/
	$j002t_usuario = J002tUsuarioPeer::retrieveByPk($codigo);			
	$j002t_usuario->delete($con);
		$this->data = json_encode(array(
			    "success" => true,
			    "msg" => 'Registro Borrado con exito!'
		));
	$con->commit();
	}catch (PropelException $e)
	{
	$con->rollback();
		$this->data = json_encode(array(
		    "success" => false,
//		    "msg" =>  $e->getMessage()
		    "msg" => 'Este registro no se puede borrar porque <br>se encuentra asociado a otros registros'
		));
	}
  }

  public function executeLista(sfWebRequest $request)
  {

  }

  public function executeStorelista(sfWebRequest $request)
  {
    $paginar    =   $this->getRequestParameter("paginar");
    $limit      =   $this->getRequestParameter("limit",20);
    $start      =   $this->getRequestParameter("start",0);
                $tx_indicador      =   $this->getRequestParameter("tx_indicador");
            $nb_empleado      =   $this->getRequestParameter("nb_empleado");
            $ap_empleado      =   $this->getRequestParameter("ap_empleado");
            $co_division      =   $this->getRequestParameter("co_division");
            $co_rol      =   $this->getRequestParameter("co_rol");
            $co_region      =   $this->getRequestParameter("co_region");
            $co_negocio      =   $this->getRequestParameter("co_negocio");
    
    
    $c = new Criteria();

    if($paginar=='si') $c->setLimit($limit)->setOffset($start);
        $c->addAscendingOrderByColumn(J002tUsuarioPeer::CO_USUARIO);
    
    if($this->getRequestParameter("BuscarBy")=="true"){
                                if($tx_indicador!=""){$c->add(J002tUsuarioPeer::TX_INDICADOR,'%'.$tx_indicador.'%',Criteria::LIKE);}
        
                                        if($nb_empleado!=""){$c->add(J002tUsuarioPeer::NB_EMPLEADO,'%'.$nb_empleado.'%',Criteria::LIKE);}
        
                                        if($ap_empleado!=""){$c->add(J002tUsuarioPeer::AP_EMPLEADO,'%'.$ap_empleado.'%',Criteria::LIKE);}
        
                                            if($co_division!=""){$c->add(J002tUsuarioPeer::CO_DIVISION,$co_division);}
    
                                            if($co_rol!=""){$c->add(J002tUsuarioPeer::CO_ROL,$co_rol);}
    
                                            if($co_region!=""){$c->add(J002tUsuarioPeer::CO_REGION,$co_region);}
    
                                            if($co_negocio!=""){$c->add(J002tUsuarioPeer::CO_NEGOCIO,$co_negocio);}
    
                    }
    $c->setIgnoreCase(true);
    $cantidadTotal = J002tUsuarioPeer::doCount($c);
    
    $stmt = J002tUsuarioPeer::doSelectStmt($c);
    $registros = "";
    while($res = $stmt->fetch(PDO::FETCH_ASSOC)){
    $registros[] = array(
            "co_usuario"     => trim($res["co_usuario"]),
            "tx_indicador"     => trim($res["tx_indicador"]),
            "nb_empleado"     => trim($res["nb_empleado"]),
            "ap_empleado"     => trim($res["ap_empleado"]),
            "co_division"     => trim($res["co_division"]),
            "co_rol"     => trim($res["co_rol"]),
            "co_region"     => trim($res["co_region"]),
            "co_negocio"     => trim($res["co_negocio"]),
        );
    }

    $this->data = json_encode(array(
        "success"   =>  true,
        "total"     =>  $cantidadTotal,
        "data"      =>  $registros
        ));
    }

                                                        //modelo fk j008t_division.CO_DIVISION
    public function executeStorefkcodivision(sfWebRequest $request){
        $c = new Criteria();
        $stmt = J008tDivisionPeer::doSelectStmt($c);
        $registros = array();
        while($reg = $stmt->fetch(PDO::FETCH_ASSOC)){
            $registros[] = $reg;
        }

        $this->data = json_encode(array(
            "success"   =>  true,
            "total"     =>  count($registros),
            "data"      =>  $registros
            ));
        $this->setTemplate('store');
    }
                    //modelo fk j003t_rol.CO_ROL
    public function executeStorefkcorol(sfWebRequest $request){
        $c = new Criteria();
        $stmt = J003tRolPeer::doSelectStmt($c);
        $registros = array();
        while($reg = $stmt->fetch(PDO::FETCH_ASSOC)){
            $registros[] = $reg;
        }

        $this->data = json_encode(array(
            "success"   =>  true,
            "total"     =>  count($registros),
            "data"      =>  $registros
            ));
        $this->setTemplate('store');
    }
                    //modelo fk j007t_region.CO_REGION
    public function executeStorefkcoregion(sfWebRequest $request){
        $c = new Criteria();
        $stmt = J007tRegionPeer::doSelectStmt($c);
        $registros = array();
        while($reg = $stmt->fetch(PDO::FETCH_ASSOC)){
            $registros[] = $reg;
        }

        $this->data = json_encode(array(
            "success"   =>  true,
            "total"     =>  count($registros),
            "data"      =>  $registros
            ));
        $this->setTemplate('store');
    }
                    //modelo fk j014t_negocio.CO_NEGOCIO
    public function executeStorefkconegocio(sfWebRequest $request){
        $c = new Criteria();
        $stmt = J014tNegocioPeer::doSelectStmt($c);
        $registros = array();
        while($reg = $stmt->fetch(PDO::FETCH_ASSOC)){
            $registros[] = $reg;
        }

        $this->data = json_encode(array(
            "success"   =>  true,
            "total"     =>  count($registros),
            "data"      =>  $registros
            ));
        $this->setTemplate('store');
    }
        


}