<?php

/**
 * autoJ001tMenu actions.
 * NombreClaseModel(J001tMenu)
 * NombreTabla(j001t_menu)
 * @package    ##PROJECT_NAME##
 * @subpackage autoJ001tMenu
 * @author     ##AUTHOR_NAME##
 * @version    SVN: $Id: actions.class.php 16948 2009-04-03 15:52:30Z fabien $
 */
//class autoJ001tMenuActions extends sfActions
class J001tMenuActions extends autoJ001tMenuActions

{

  public function executeIndex(sfWebRequest $request)
  {
    $this->forward('J001tMenu', 'lista');
  }

  public function executeNuevo(sfWebRequest $request)
  {
    $this->forward('J001tMenu', 'editar');
  }

  public function executeFiltro(sfWebRequest $request)
  {

  }

  public function executeEditar(sfWebRequest $request)
  {
    $codigo = $this->getRequestParameter("codigo");
    if($codigo!=''||$codigo!=null){
        $c = new Criteria();
                $c->add(J001tMenuPeer::CO_MENU,$codigo);
        
        $stmt = J001tMenuPeer::doSelectStmt($c);
        $campos = $stmt->fetch(PDO::FETCH_ASSOC);
        $this->data = json_encode(array(
                            "co_menu"     => $campos["co_menu"],
                            "tx_menu"     => $campos["tx_menu"],
                            "co_padre"     => $campos["co_padre"],
                            "tx_href"     => $campos["tx_href"],
                            "tx_icono"     => $campos["tx_icono"],
                            "nu_orden"     => $campos["nu_orden"],
                            "tx_sigla"     => $campos["tx_sigla"],
                    ));
    }else{
        $this->data = json_encode(array(
                            "co_menu"     => "",
                            "tx_menu"     => "",
                            "co_padre"     => "",
                            "tx_href"     => "",
                            "tx_icono"     => "",
                            "nu_orden"     => "",
                            "tx_sigla"     => "",
                    ));
    }

  }

  public function executeGuardar(sfWebRequest $request)
  {

            $codigo = $this->getRequestParameter("co_menu");
        
     $con = Propel::getConnection();
     if($codigo!=''||$codigo!=null){
         $j001t_menu = J001tMenuPeer::retrieveByPk($codigo);
     }else{
         $j001t_menu = new J001tMenu();
     }
     try
      { 
        $con->beginTransaction();
       
        $j001t_menuForm = $this->getRequestParameter('j001t_menu');
/*CAMPOS*/
                                        
        /*Campo tipo VARCHAR */
        $j001t_menu->setTxMenu($j001t_menuForm["tx_menu"]);
                                                        
        /*Campo tipo BIGINT */
        $j001t_menu->setCoPadre($j001t_menuForm["co_padre"]);
                                                        
        /*Campo tipo VARCHAR */
        $j001t_menu->setTxHref($j001t_menuForm["tx_href"]);
                                                        
        /*Campo tipo VARCHAR */
        $j001t_menu->setTxIcono($j001t_menuForm["tx_icono"]);
                                                        
        /*Campo tipo BIGINT */
        $j001t_menu->setNuOrden($j001t_menuForm["nu_orden"]);
                                                        
        /*Campo tipo VARCHAR */
        $j001t_menu->setTxSigla($j001t_menuForm["tx_sigla"]);
                                
        /*CAMPOS*/
        $j001t_menu->save($con);
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
	$codigo = $this->getRequestParameter("co_menu");
	$con = Propel::getConnection();
	try
	{ 
	$con->beginTransaction();
	/*CAMPOS*/
	$j001t_menu = J001tMenuPeer::retrieveByPk($codigo);			
	$j001t_menu->delete($con);
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
                $tx_menu      =   $this->getRequestParameter("tx_menu");
            $co_padre      =   $this->getRequestParameter("co_padre");
            $tx_href      =   $this->getRequestParameter("tx_href");
            $tx_icono      =   $this->getRequestParameter("tx_icono");
            $nu_orden      =   $this->getRequestParameter("nu_orden");
            $tx_sigla      =   $this->getRequestParameter("tx_sigla");
    
    
    $c = new Criteria();

    if($paginar=='si') $c->setLimit($limit)->setOffset($start);
        $c->addAscendingOrderByColumn(J001tMenuPeer::CO_MENU);
    
    if($this->getRequestParameter("BuscarBy")=="true"){
                                if($tx_menu!=""){$c->add(J001tMenuPeer::TX_MENU,'%'.$tx_menu.'%',Criteria::LIKE);}
        
                                            if($co_padre!=""){$c->add(J001tMenuPeer::CO_PADRE,$co_padre);}
    
                                        if($tx_href!=""){$c->add(J001tMenuPeer::TX_HREF,'%'.$tx_href.'%',Criteria::LIKE);}
        
                                        if($tx_icono!=""){$c->add(J001tMenuPeer::TX_ICONO,'%'.$tx_icono.'%',Criteria::LIKE);}
        
                                            if($nu_orden!=""){$c->add(J001tMenuPeer::NU_ORDEN,$nu_orden);}
    
                                        if($tx_sigla!=""){$c->add(J001tMenuPeer::TX_SIGLA,'%'.$tx_sigla.'%',Criteria::LIKE);}
        
                    }
    $c->setIgnoreCase(true);
    $cantidadTotal = J001tMenuPeer::doCount($c);
    
    $stmt = J001tMenuPeer::doSelectStmt($c);
    $registros = "";
    while($res = $stmt->fetch(PDO::FETCH_ASSOC)){
    $registros[] = array(
            "co_menu"     => trim($res["co_menu"]),
            "tx_menu"     => trim($res["tx_menu"]),
            "co_padre"     => trim($res["co_padre"]),
            "tx_href"     => trim($res["tx_href"]),
            "tx_icono"     => trim($res["tx_icono"]),
            "nu_orden"     => trim($res["nu_orden"]),
            "tx_sigla"     => trim($res["tx_sigla"]),
        );
    }

    $this->data = json_encode(array(
        "success"   =>  true,
        "total"     =>  $cantidadTotal,
        "data"      =>  $registros
        ));
    }

                                //modelo fk j001t_menu.CO_MENU
    public function executeStorefkcopadre(sfWebRequest $request){
        $c = new Criteria();
        $stmt = J001tMenuPeer::doSelectStmt($c);
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