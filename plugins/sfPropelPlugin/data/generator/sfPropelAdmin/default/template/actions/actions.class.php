[?php

/**
 * <?php echo $this->getGeneratedModuleName() ?> actions.
 * NombreClaseModel(<?php echo $this->getClassName() ?>)
 * NombreTabla(<?php echo $this->getSingularName() ?>)
 * @package    ##PROJECT_NAME##
 * @subpackage <?php echo $this->getGeneratedModuleName()."\n" ?>
 * @author     ##AUTHOR_NAME##
 * @version    SVN: $Id: actions.class.php 16948 2009-04-03 15:52:30Z fabien $
 */
class <?php echo $this->getGeneratedModuleName() ?>Actions extends sfActions
{

  public function executeIndex(sfWebRequest $request)
  {
    $this->forward('<?php echo $this->getModuleName() ?>', 'lista');
  }

  public function executeNuevo(sfWebRequest $request)
  {
    $this->forward('<?php echo $this->getModuleName() ?>', 'editar');
  }

  public function executeFiltro(sfWebRequest $request)
  {

  }

  public function executeEditar(sfWebRequest $request)
  {
    $codigo = $this->getRequestParameter("codigo");
    if($codigo!=''||$codigo!=null){
        $c = new Criteria();
        <?php foreach ($this->getPrimaryKey() as $pk): ?>
        $c->add(<?= $this->getClassName() ?>Peer::<?= $pk->getName()?>,$codigo);
        <?php endforeach; ?>

        $stmt = <?= $this->getClassName() ?>Peer::doSelectStmt($c);
        $campos = $stmt->fetch(PDO::FETCH_ASSOC);
        $this->data = json_encode(array(
            <?php foreach ($this->getAllColumns() as $name => $column): ?>
                "<?= $column->getName() ?>"     => $campos["<?= $column->getName() ?>"],
            <?php endforeach; ?>
        ));
    }else{
        $this->data = json_encode(array(
            <?php foreach ($this->getAllColumns() as $name => $column): ?>
                "<?= $column->getName() ?>"     => "",
            <?php endforeach; ?>
        ));
    }

  }

  public function executeGuardar(sfWebRequest $request)
  {

    <?php foreach ($this->getPrimaryKey() as $pk): ?>
        $codigo = $this->getRequestParameter("<?= strtolower($pk->getName()) ?>");
    <?php endforeach; ?>
    
     $con = Propel::getConnection();
     if($codigo!=''||$codigo!=null){
         $<?= $this->getSingularName() ?> = <?= $this->getClassName() ?>Peer::retrieveByPk($codigo);
     }else{
         $<?= $this->getSingularName() ?> = new <?= $this->getClassName() ?>();
     }
     try
      { 
        $con->beginTransaction();
       
        $<?= $this->getSingularName() ?>Form = $this->getRequestParameter('<?= $this->getSingularName() ?>');
/*CAMPOS*/
        <?php foreach ($this->getAllColumns() as $name => $column): ?>
        <?php if ($column->isPrimaryKey()) continue ?>
        <?php $type = $column->getType(); ?>
        <?php if ($type == PropelColumnTypes::DATE){ ?>
        
        /*Campo tipo <?= $type ?> */
        list($dia, $mes, $anio) = explode("/",$<?= $this->getSingularName() ?>Form["<?= $column->getName() ?>"]);
        $fecha = $anio."-".$mes."-".$dia;
        $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>($fecha);
                <?php }else if ($type == PropelColumnTypes::TIMESTAMP){ ?>

        /*Campo tipo <?= $type ?> */
        list($dia, $mes, $anio) = explode("/",$<?= $this->getSingularName() ?>Form["<?= $column->getName() ?>"]);
        $fecha = $anio."-".$mes."-".$dia;
        $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>($fecha);
                <?php }else if ($type == PropelColumnTypes::BOOLEAN){ ?>

        /*Campo tipo <?= $type ?> */
        if (array_key_exists("<?= $column->getName() ?>", $<?= $this->getSingularName() ?>Form)){
            $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>(false);
        }else{
            $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>(true);
        }
                <?php }else if ($type == PropelColumnTypes::CHAR || $type == PropelColumnTypes::VARCHAR){ ?>

        /*Campo tipo <?= $type ?> */
        $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>($<?= $this->getSingularName() ?>Form["<?= $column->getName() ?>"]);
                <?php }else if ($type == PropelColumnTypes::INTEGER || $type == PropelColumnTypes::TINYINT || $type == PropelColumnTypes::SMALLINT || $type == PropelColumnTypes::BIGINT){ ?>

        /*Campo tipo <?= $type ?> */
        $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>($<?= $this->getSingularName() ?>Form["<?= $column->getName() ?>"]);
                <?php }else if ($type == PropelColumnTypes::FLOAT || $type == PropelColumnTypes::DOUBLE || $type == PropelColumnTypes::DECIMAL || $type == PropelColumnTypes::NUMERIC || $type == PropelColumnTypes::REAL){ ?>

        /*Campo tipo <?= $type ?> */
        $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>($<?= $this->getSingularName() ?>Form["<?= $column->getName() ?>"]);
                <?php }else if ($type == PropelColumnTypes::LONGVARCHAR || $type == PropelColumnTypes::CLOB){ ?>

        /*Campo tipo <?= $type ?> */
        $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>($<?= $this->getSingularName() ?>Form["<?= $column->getName() ?>"]);
                <?php }else{ ?>

        /*Campo tipo <?= $type ?> */
        $<?= $this->getSingularName() ?>->set<?= $column->getPhpName() ?>($<?= $this->getSingularName() ?>Form["<?= $column->getName() ?>"]);
                <?php } ?>
                <?php endforeach; ?>

        /*CAMPOS*/
        $<?= $this->getSingularName() ?>->save($con);
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
	$codigo = $this->getRequestParameter("<?= strtolower($pk->getName()) ?>");
	$con = Propel::getConnection();
	try
	{ 
	$con->beginTransaction();
	/*CAMPOS*/
	$<?= $this->getSingularName() ?> = <?= $this->getClassName() ?>Peer::retrieveByPk($codigo);			
	$<?= $this->getSingularName() ?>->delete($con);
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
    <?php foreach ($this->getAllColumns() as $name => $column): ?>
    <?php if ($column->isPrimaryKey()) continue ?>
    $<?= $column->getName() ?>      =   $this->getRequestParameter("<?= $column->getName()?>");
    <?php endforeach; ?>

    
    $c = new Criteria();

    if($paginar=='si') $c->setLimit($limit)->setOffset($start);
    <?php foreach ($this->getPrimaryKey() as $pk): ?>
    $c->addAscendingOrderByColumn(<?= $this->getClassName() ?>Peer::<?= $pk->getName() ?>);
    <?php endforeach; ?>

    if($this->getRequestParameter("BuscarBy")=="true"){
    <?php foreach ($this->getAllColumns() as $name => $column): ?>
    <?php if ($column->isPrimaryKey()) continue ?>
    <?php $campoPeer = strtoupper($column->getName()); ?>
    <?php if($column->getName()!='in_delete'): ?>
    <?if($column->isText()==true): ?>
        if($<?= $column->getName() ?>!=""){$c->add(<?= $this->getClassName() ?>Peer::<?=$campoPeer?>,'%'.$<?= $column->getName() ?>.'%',Criteria::LIKE);}
    <?php endif; ?>
    <?if($column->isNumeric()==true): ?>
        if($<?= $column->getName() ?>!=""){$c->add(<?= $this->getClassName() ?>Peer::<?=$campoPeer?>,$<?= $column->getName() ?>);}
    <?php endif; ?>

    <?if($column->isTemporal()==true): ?>
    if($<?= $column->getName() ?>!=""){
    list($dia, $mes,$anio) = explode("/",$<?= $column->getName() ?>);
    $fecha = $anio."-".$mes."-".$dia;
    $c->add(<?= $this->getClassName() ?>Peer::<?=$campoPeer?>,$fecha);
    }
    <?php endif; ?>
    <?php endif; ?>
    <?php if($column->getName()=='in_delete'): ?>
    $c->add(<?= $this->getClassName() ?>Peer::IN_DELETE,($in_delete=="on")?0:1);
    $c->addOr(<?= $this->getClassName() ?>Peer::IN_DELETE,($in_delete=="on")?'0':'1');
    $c->addOr(<?= $this->getClassName() ?>Peer::IN_DELETE,($in_delete=="on")?'':'1');
    <?php endif; ?>
    <?php endforeach; ?>
    }
    $c->setIgnoreCase(true);
    $cantidadTotal = <?= $this->getClassName() ?>Peer::doCount($c);
    
    $stmt = <?= $this->getClassName() ?>Peer::doSelectStmt($c);
    $registros = "";
    while($res = $stmt->fetch(PDO::FETCH_ASSOC)){
    $registros[] = array(
    <?php foreach ($this->getAllColumns() as $name => $column): ?>
        "<?= $column->getName() ?>"     => trim($res["<?= $column->getName() ?>"]),
    <?php endforeach; ?>
    );
    }

    $this->data = json_encode(array(
        "success"   =>  true,
        "total"     =>  $cantidadTotal,
        "data"      =>  $registros
        ));
    }

    <?php foreach ($this->getAllColumns() as $name => $column): ?>
    <?php if ($column->isPrimaryKey()) continue ?>
    <?php if($column->isForeignKey()): ?>
    //modelo fk <?= $column->getRelatedName()."\n" ?>
    public function executeStorefk<?= strtolower($column->getPhpName())?>(sfWebRequest $request){
        $c = new Criteria();
        $stmt = <?= InterpretePropelModel::formaterNbCampo($column->getRelatedTableName()) ?>Peer::doSelectStmt($c);
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
    <?php endif; ?>
    <?php endforeach; ?>



}