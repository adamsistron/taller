<?php

/**
 * Base static class for performing query and update operations on the 'j029t_historico_evidencia' table.
 *
 * 
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Thu Nov 12 11:16:19 2015
 *
 * @package    lib.model.om
 */
abstract class BaseJ029tHistoricoEvidenciaPeer {

	/** the default database name for this class */
	const DATABASE_NAME = 'propel';

	/** the table name for this class */
	const TABLE_NAME = 'j029t_historico_evidencia';

	/** A class that can be returned by this peer. */
	const CLASS_DEFAULT = 'lib.model.J029tHistoricoEvidencia';

	/** The total number of columns. */
	const NUM_COLUMNS = 11;

	/** The number of lazy-loaded columns. */
	const NUM_LAZY_LOAD_COLUMNS = 0;

	/** the column name for the CO_HISTORICO_EVIDENCIA field */
	const CO_HISTORICO_EVIDENCIA = 'j029t_historico_evidencia.CO_HISTORICO_EVIDENCIA';

	/** the column name for the CO_EVIDENCIA field */
	const CO_EVIDENCIA = 'j029t_historico_evidencia.CO_EVIDENCIA';

	/** the column name for the FE_CAMBIO_ESTADO field */
	const FE_CAMBIO_ESTADO = 'j029t_historico_evidencia.FE_CAMBIO_ESTADO';

	/** the column name for the CO_CAMBIA_ESTADO field */
	const CO_CAMBIA_ESTADO = 'j029t_historico_evidencia.CO_CAMBIA_ESTADO';

	/** the column name for the TX_ESTADO_ANTERIOR field */
	const TX_ESTADO_ANTERIOR = 'j029t_historico_evidencia.TX_ESTADO_ANTERIOR';

	/** the column name for the TX_LUGAR_ANTERIOR field */
	const TX_LUGAR_ANTERIOR = 'j029t_historico_evidencia.TX_LUGAR_ANTERIOR';

	/** the column name for the TX_CUSTODIO_ANTERIOR field */
	const TX_CUSTODIO_ANTERIOR = 'j029t_historico_evidencia.TX_CUSTODIO_ANTERIOR';

	/** the column name for the TX_REPOSITORIO_ANTERIOR field */
	const TX_REPOSITORIO_ANTERIOR = 'j029t_historico_evidencia.TX_REPOSITORIO_ANTERIOR';

	/** the column name for the TX_OBSERVACIONES field */
	const TX_OBSERVACIONES = 'j029t_historico_evidencia.TX_OBSERVACIONES';

	/** the column name for the UPDATE_AT field */
	const UPDATE_AT = 'j029t_historico_evidencia.UPDATE_AT';

	/** the column name for the ID field */
	const ID = 'j029t_historico_evidencia.ID';

	/**
	 * An identiy map to hold any loaded instances of J029tHistoricoEvidencia objects.
	 * This must be public so that other peer classes can access this when hydrating from JOIN
	 * queries.
	 * @var        array J029tHistoricoEvidencia[]
	 */
	public static $instances = array();

	/**
	 * The MapBuilder instance for this peer.
	 * @var        MapBuilder
	 */
	private static $mapBuilder = null;

	/**
	 * holds an array of fieldnames
	 *
	 * first dimension keys are the type constants
	 * e.g. self::$fieldNames[self::TYPE_PHPNAME][0] = 'Id'
	 */
	private static $fieldNames = array (
		BasePeer::TYPE_PHPNAME => array ('CoHistoricoEvidencia', 'CoEvidencia', 'FeCambioEstado', 'CoCambiaEstado', 'TxEstadoAnterior', 'TxLugarAnterior', 'TxCustodioAnterior', 'TxRepositorioAnterior', 'TxObservaciones', 'UpdateAt', 'Id', ),
		BasePeer::TYPE_STUDLYPHPNAME => array ('coHistoricoEvidencia', 'coEvidencia', 'feCambioEstado', 'coCambiaEstado', 'txEstadoAnterior', 'txLugarAnterior', 'txCustodioAnterior', 'txRepositorioAnterior', 'txObservaciones', 'updateAt', 'id', ),
		BasePeer::TYPE_COLNAME => array (self::CO_HISTORICO_EVIDENCIA, self::CO_EVIDENCIA, self::FE_CAMBIO_ESTADO, self::CO_CAMBIA_ESTADO, self::TX_ESTADO_ANTERIOR, self::TX_LUGAR_ANTERIOR, self::TX_CUSTODIO_ANTERIOR, self::TX_REPOSITORIO_ANTERIOR, self::TX_OBSERVACIONES, self::UPDATE_AT, self::ID, ),
		BasePeer::TYPE_FIELDNAME => array ('co_historico_evidencia', 'co_evidencia', 'fe_cambio_estado', 'co_cambia_estado', 'tx_estado_anterior', 'tx_lugar_anterior', 'tx_custodio_anterior', 'tx_repositorio_anterior', 'tx_observaciones', 'update_at', 'id', ),
		BasePeer::TYPE_NUM => array (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, )
	);

	/**
	 * holds an array of keys for quick access to the fieldnames array
	 *
	 * first dimension keys are the type constants
	 * e.g. self::$fieldNames[BasePeer::TYPE_PHPNAME]['Id'] = 0
	 */
	private static $fieldKeys = array (
		BasePeer::TYPE_PHPNAME => array ('CoHistoricoEvidencia' => 0, 'CoEvidencia' => 1, 'FeCambioEstado' => 2, 'CoCambiaEstado' => 3, 'TxEstadoAnterior' => 4, 'TxLugarAnterior' => 5, 'TxCustodioAnterior' => 6, 'TxRepositorioAnterior' => 7, 'TxObservaciones' => 8, 'UpdateAt' => 9, 'Id' => 10, ),
		BasePeer::TYPE_STUDLYPHPNAME => array ('coHistoricoEvidencia' => 0, 'coEvidencia' => 1, 'feCambioEstado' => 2, 'coCambiaEstado' => 3, 'txEstadoAnterior' => 4, 'txLugarAnterior' => 5, 'txCustodioAnterior' => 6, 'txRepositorioAnterior' => 7, 'txObservaciones' => 8, 'updateAt' => 9, 'id' => 10, ),
		BasePeer::TYPE_COLNAME => array (self::CO_HISTORICO_EVIDENCIA => 0, self::CO_EVIDENCIA => 1, self::FE_CAMBIO_ESTADO => 2, self::CO_CAMBIA_ESTADO => 3, self::TX_ESTADO_ANTERIOR => 4, self::TX_LUGAR_ANTERIOR => 5, self::TX_CUSTODIO_ANTERIOR => 6, self::TX_REPOSITORIO_ANTERIOR => 7, self::TX_OBSERVACIONES => 8, self::UPDATE_AT => 9, self::ID => 10, ),
		BasePeer::TYPE_FIELDNAME => array ('co_historico_evidencia' => 0, 'co_evidencia' => 1, 'fe_cambio_estado' => 2, 'co_cambia_estado' => 3, 'tx_estado_anterior' => 4, 'tx_lugar_anterior' => 5, 'tx_custodio_anterior' => 6, 'tx_repositorio_anterior' => 7, 'tx_observaciones' => 8, 'update_at' => 9, 'id' => 10, ),
		BasePeer::TYPE_NUM => array (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, )
	);

	/**
	 * Get a (singleton) instance of the MapBuilder for this peer class.
	 * @return     MapBuilder The map builder for this peer
	 */
	public static function getMapBuilder()
	{
		if (self::$mapBuilder === null) {
			self::$mapBuilder = new J029tHistoricoEvidenciaMapBuilder();
		}
		return self::$mapBuilder;
	}
	/**
	 * Translates a fieldname to another type
	 *
	 * @param      string $name field name
	 * @param      string $fromType One of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME
	 *                         BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM
	 * @param      string $toType   One of the class type constants
	 * @return     string translated name of the field.
	 * @throws     PropelException - if the specified name could not be found in the fieldname mappings.
	 */
	static public function translateFieldName($name, $fromType, $toType)
	{
		$toNames = self::getFieldNames($toType);
		$key = isset(self::$fieldKeys[$fromType][$name]) ? self::$fieldKeys[$fromType][$name] : null;
		if ($key === null) {
			throw new PropelException("'$name' could not be found in the field names of type '$fromType'. These are: " . print_r(self::$fieldKeys[$fromType], true));
		}
		return $toNames[$key];
	}

	/**
	 * Returns an array of field names.
	 *
	 * @param      string $type The type of fieldnames to return:
	 *                      One of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME
	 *                      BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM
	 * @return     array A list of field names
	 */

	static public function getFieldNames($type = BasePeer::TYPE_PHPNAME)
	{
		if (!array_key_exists($type, self::$fieldNames)) {
			throw new PropelException('Method getFieldNames() expects the parameter $type to be one of the class constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME, BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM. ' . $type . ' was given.');
		}
		return self::$fieldNames[$type];
	}

	/**
	 * Convenience method which changes table.column to alias.column.
	 *
	 * Using this method you can maintain SQL abstraction while using column aliases.
	 * <code>
	 *		$c->addAlias("alias1", TablePeer::TABLE_NAME);
	 *		$c->addJoin(TablePeer::alias("alias1", TablePeer::PRIMARY_KEY_COLUMN), TablePeer::PRIMARY_KEY_COLUMN);
	 * </code>
	 * @param      string $alias The alias for the current table.
	 * @param      string $column The column name for current table. (i.e. J029tHistoricoEvidenciaPeer::COLUMN_NAME).
	 * @return     string
	 */
	public static function alias($alias, $column)
	{
		return str_replace(J029tHistoricoEvidenciaPeer::TABLE_NAME.'.', $alias.'.', $column);
	}

	/**
	 * Add all the columns needed to create a new object.
	 *
	 * Note: any columns that were marked with lazyLoad="true" in the
	 * XML schema will not be added to the select list and only loaded
	 * on demand.
	 *
	 * @param      criteria object containing the columns to add.
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function addSelectColumns(Criteria $criteria)
	{

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::CO_HISTORICO_EVIDENCIA);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::CO_EVIDENCIA);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::FE_CAMBIO_ESTADO);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::CO_CAMBIA_ESTADO);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::TX_ESTADO_ANTERIOR);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::TX_LUGAR_ANTERIOR);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::TX_CUSTODIO_ANTERIOR);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::TX_REPOSITORIO_ANTERIOR);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::TX_OBSERVACIONES);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::UPDATE_AT);

		$criteria->addSelectColumn(J029tHistoricoEvidenciaPeer::ID);

	}

	/**
	 * Returns the number of rows matching criteria.
	 *
	 * @param      Criteria $criteria
	 * @param      boolean $distinct Whether to select only distinct columns; deprecated: use Criteria->setDistinct() instead.
	 * @param      PropelPDO $con
	 * @return     int Number of matching rows.
	 */
	public static function doCount(Criteria $criteria, $distinct = false, PropelPDO $con = null)
	{
		// we may modify criteria, so copy it first
		$criteria = clone $criteria;

		// We need to set the primary table name, since in the case that there are no WHERE columns
		// it will be impossible for the BasePeer::createSelectSql() method to determine which
		// tables go into the FROM clause.
		$criteria->setPrimaryTableName(J029tHistoricoEvidenciaPeer::TABLE_NAME);

		if ($distinct && !in_array(Criteria::DISTINCT, $criteria->getSelectModifiers())) {
			$criteria->setDistinct();
		}

		if (!$criteria->hasSelectClause()) {
			J029tHistoricoEvidenciaPeer::addSelectColumns($criteria);
		}

		$criteria->clearOrderByColumns(); // ORDER BY won't ever affect the count
		$criteria->setDbName(self::DATABASE_NAME); // Set the correct dbName

		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}


    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidenciaPeer:doCount:doCount') as $callable)
    {
      call_user_func($callable, 'BaseJ029tHistoricoEvidenciaPeer', $criteria, $con);
    }


		// BasePeer returns a PDOStatement
		$stmt = BasePeer::doCount($criteria, $con);

		if ($row = $stmt->fetch(PDO::FETCH_NUM)) {
			$count = (int) $row[0];
		} else {
			$count = 0; // no rows returned; we infer that means 0 matches.
		}
		$stmt->closeCursor();
		return $count;
	}
	/**
	 * Method to select one object from the DB.
	 *
	 * @param      Criteria $criteria object used to create the SELECT statement.
	 * @param      PropelPDO $con
	 * @return     J029tHistoricoEvidencia
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function doSelectOne(Criteria $criteria, PropelPDO $con = null)
	{
		$critcopy = clone $criteria;
		$critcopy->setLimit(1);
		$objects = J029tHistoricoEvidenciaPeer::doSelect($critcopy, $con);
		if ($objects) {
			return $objects[0];
		}
		return null;
	}
	/**
	 * Method to do selects.
	 *
	 * @param      Criteria $criteria The Criteria object used to build the SELECT statement.
	 * @param      PropelPDO $con
	 * @return     array Array of selected Objects
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function doSelect(Criteria $criteria, PropelPDO $con = null)
	{
		return J029tHistoricoEvidenciaPeer::populateObjects(J029tHistoricoEvidenciaPeer::doSelectStmt($criteria, $con));
	}
	/**
	 * Prepares the Criteria object and uses the parent doSelect() method to execute a PDOStatement.
	 *
	 * Use this method directly if you want to work with an executed statement durirectly (for example
	 * to perform your own object hydration).
	 *
	 * @param      Criteria $criteria The Criteria object used to build the SELECT statement.
	 * @param      PropelPDO $con The connection to use
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 * @return     PDOStatement The executed PDOStatement object.
	 * @see        BasePeer::doSelect()
	 */
	public static function doSelectStmt(Criteria $criteria, PropelPDO $con = null)
	{

    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidenciaPeer:doSelectStmt:doSelectStmt') as $callable)
    {
      call_user_func($callable, 'BaseJ029tHistoricoEvidenciaPeer', $criteria, $con);
    }


		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		if (!$criteria->hasSelectClause()) {
			$criteria = clone $criteria;
			J029tHistoricoEvidenciaPeer::addSelectColumns($criteria);
		}

		// Set the correct dbName
		$criteria->setDbName(self::DATABASE_NAME);

		// BasePeer returns a PDOStatement
		return BasePeer::doSelect($criteria, $con);
	}
	/**
	 * Adds an object to the instance pool.
	 *
	 * Propel keeps cached copies of objects in an instance pool when they are retrieved
	 * from the database.  In some cases -- especially when you override doSelect*()
	 * methods in your stub classes -- you may need to explicitly add objects
	 * to the cache in order to ensure that the same objects are always returned by doSelect*()
	 * and retrieveByPK*() calls.
	 *
	 * @param      J029tHistoricoEvidencia $value A J029tHistoricoEvidencia object.
	 * @param      string $key (optional) key to use for instance map (for performance boost if key was already calculated externally).
	 */
	public static function addInstanceToPool(J029tHistoricoEvidencia $obj, $key = null)
	{
		if (Propel::isInstancePoolingEnabled()) {
			if ($key === null) {
				$key = (string) $obj->getId();
			} // if key === null
			self::$instances[$key] = $obj;
		}
	}

	/**
	 * Removes an object from the instance pool.
	 *
	 * Propel keeps cached copies of objects in an instance pool when they are retrieved
	 * from the database.  In some cases -- especially when you override doDelete
	 * methods in your stub classes -- you may need to explicitly remove objects
	 * from the cache in order to prevent returning objects that no longer exist.
	 *
	 * @param      mixed $value A J029tHistoricoEvidencia object or a primary key value.
	 */
	public static function removeInstanceFromPool($value)
	{
		if (Propel::isInstancePoolingEnabled() && $value !== null) {
			if (is_object($value) && $value instanceof J029tHistoricoEvidencia) {
				$key = (string) $value->getId();
			} elseif (is_scalar($value)) {
				// assume we've been passed a primary key
				$key = (string) $value;
			} else {
				$e = new PropelException("Invalid value passed to removeInstanceFromPool().  Expected primary key or J029tHistoricoEvidencia object; got " . (is_object($value) ? get_class($value) . ' object.' : var_export($value,true)));
				throw $e;
			}

			unset(self::$instances[$key]);
		}
	} // removeInstanceFromPool()

	/**
	 * Retrieves a string version of the primary key from the DB resultset row that can be used to uniquely identify a row in this table.
	 *
	 * For tables with a single-column primary key, that simple pkey value will be returned.  For tables with
	 * a multi-column primary key, a serialize()d version of the primary key will be returned.
	 *
	 * @param      string $key The key (@see getPrimaryKeyHash()) for this instance.
	 * @return     J029tHistoricoEvidencia Found object or NULL if 1) no instance exists for specified key or 2) instance pooling has been disabled.
	 * @see        getPrimaryKeyHash()
	 */
	public static function getInstanceFromPool($key)
	{
		if (Propel::isInstancePoolingEnabled()) {
			if (isset(self::$instances[$key])) {
				return self::$instances[$key];
			}
		}
		return null; // just to be explicit
	}
	
	/**
	 * Clear the instance pool.
	 *
	 * @return     void
	 */
	public static function clearInstancePool()
	{
		self::$instances = array();
	}
	
	/**
	 * Retrieves a string version of the primary key from the DB resultset row that can be used to uniquely identify a row in this table.
	 *
	 * For tables with a single-column primary key, that simple pkey value will be returned.  For tables with
	 * a multi-column primary key, a serialize()d version of the primary key will be returned.
	 *
	 * @param      array $row PropelPDO resultset row.
	 * @param      int $startcol The 0-based offset for reading from the resultset row.
	 * @return     string A string version of PK or NULL if the components of primary key in result array are all null.
	 */
	public static function getPrimaryKeyHashFromRow($row, $startcol = 0)
	{
		// If the PK cannot be derived from the row, return NULL.
		if ($row[$startcol + 10] === null) {
			return null;
		}
		return (string) $row[$startcol + 10];
	}

	/**
	 * The returned array will contain objects of the default type or
	 * objects that inherit from the default.
	 *
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function populateObjects(PDOStatement $stmt)
	{
		$results = array();
	
		// set the class once to avoid overhead in the loop
		$cls = J029tHistoricoEvidenciaPeer::getOMClass();
		$cls = substr('.'.$cls, strrpos('.'.$cls, '.') + 1);
		// populate the object(s)
		while ($row = $stmt->fetch(PDO::FETCH_NUM)) {
			$key = J029tHistoricoEvidenciaPeer::getPrimaryKeyHashFromRow($row, 0);
			if (null !== ($obj = J029tHistoricoEvidenciaPeer::getInstanceFromPool($key))) {
				// We no longer rehydrate the object, since this can cause data loss.
				// See http://propel.phpdb.org/trac/ticket/509
				// $obj->hydrate($row, 0, true); // rehydrate
				$results[] = $obj;
			} else {
		
				$obj = new $cls();
				$obj->hydrate($row);
				$results[] = $obj;
				J029tHistoricoEvidenciaPeer::addInstanceToPool($obj, $key);
			} // if key exists
		}
		$stmt->closeCursor();
		return $results;
	}

  static public function getUniqueColumnNames()
  {
    return array();
  }
	/**
	 * Returns the TableMap related to this peer.
	 * This method is not needed for general use but a specific application could have a need.
	 * @return     TableMap
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function getTableMap()
	{
		return Propel::getDatabaseMap(self::DATABASE_NAME)->getTable(self::TABLE_NAME);
	}

	/**
	 * The class that the Peer will make instances of.
	 *
	 * This uses a dot-path notation which is tranalted into a path
	 * relative to a location on the PHP include_path.
	 * (e.g. path.to.MyClass -> 'path/to/MyClass.php')
	 *
	 * @return     string path.to.ClassName
	 */
	public static function getOMClass()
	{
		return J029tHistoricoEvidenciaPeer::CLASS_DEFAULT;
	}

	/**
	 * Method perform an INSERT on the database, given a J029tHistoricoEvidencia or Criteria object.
	 *
	 * @param      mixed $values Criteria or J029tHistoricoEvidencia object containing data that is used to create the INSERT statement.
	 * @param      PropelPDO $con the PropelPDO connection to use
	 * @return     mixed The new primary key.
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function doInsert($values, PropelPDO $con = null)
	{

    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidenciaPeer:doInsert:pre') as $callable)
    {
      $ret = call_user_func($callable, 'BaseJ029tHistoricoEvidenciaPeer', $values, $con);
      if (false !== $ret)
      {
        return $ret;
      }
    }


		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		if ($values instanceof Criteria) {
			$criteria = clone $values; // rename for clarity
		} else {
			$criteria = $values->buildCriteria(); // build Criteria from J029tHistoricoEvidencia object
		}

		if ($criteria->containsKey(J029tHistoricoEvidenciaPeer::ID) && $criteria->keyContainsValue(J029tHistoricoEvidenciaPeer::ID) ) {
			throw new PropelException('Cannot insert a value for auto-increment primary key ('.J029tHistoricoEvidenciaPeer::ID.')');
		}


		// Set the correct dbName
		$criteria->setDbName(self::DATABASE_NAME);

		try {
			// use transaction because $criteria could contain info
			// for more than one table (I guess, conceivably)
			$con->beginTransaction();
			$pk = BasePeer::doInsert($criteria, $con);
			$con->commit();
		} catch(PropelException $e) {
			$con->rollBack();
			throw $e;
		}

		
    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidenciaPeer:doInsert:post') as $callable)
    {
      call_user_func($callable, 'BaseJ029tHistoricoEvidenciaPeer', $values, $con, $pk);
    }

    return $pk;
	}

	/**
	 * Method perform an UPDATE on the database, given a J029tHistoricoEvidencia or Criteria object.
	 *
	 * @param      mixed $values Criteria or J029tHistoricoEvidencia object containing data that is used to create the UPDATE statement.
	 * @param      PropelPDO $con The connection to use (specify PropelPDO connection object to exert more control over transactions).
	 * @return     int The number of affected rows (if supported by underlying database driver).
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function doUpdate($values, PropelPDO $con = null)
	{

    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidenciaPeer:doUpdate:pre') as $callable)
    {
      $ret = call_user_func($callable, 'BaseJ029tHistoricoEvidenciaPeer', $values, $con);
      if (false !== $ret)
      {
        return $ret;
      }
    }


		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		$selectCriteria = new Criteria(self::DATABASE_NAME);

		if ($values instanceof Criteria) {
			$criteria = clone $values; // rename for clarity

			$comparison = $criteria->getComparison(J029tHistoricoEvidenciaPeer::ID);
			$selectCriteria->add(J029tHistoricoEvidenciaPeer::ID, $criteria->remove(J029tHistoricoEvidenciaPeer::ID), $comparison);

		} else { // $values is J029tHistoricoEvidencia object
			$criteria = $values->buildCriteria(); // gets full criteria
			$selectCriteria = $values->buildPkeyCriteria(); // gets criteria w/ primary key(s)
		}

		// set the correct dbName
		$criteria->setDbName(self::DATABASE_NAME);

		$ret = BasePeer::doUpdate($selectCriteria, $criteria, $con);
	

    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidenciaPeer:doUpdate:post') as $callable)
    {
      call_user_func($callable, 'BaseJ029tHistoricoEvidenciaPeer', $values, $con, $ret);
    }

    return $ret;
  }

	/**
	 * Method to DELETE all rows from the j029t_historico_evidencia table.
	 *
	 * @return     int The number of affected rows (if supported by underlying database driver).
	 */
	public static function doDeleteAll($con = null)
	{
		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}
		$affectedRows = 0; // initialize var to track total num of affected rows
		try {
			// use transaction because $criteria could contain info
			// for more than one table or we could emulating ON DELETE CASCADE, etc.
			$con->beginTransaction();
			$affectedRows += BasePeer::doDeleteAll(J029tHistoricoEvidenciaPeer::TABLE_NAME, $con);
			$con->commit();
			return $affectedRows;
		} catch (PropelException $e) {
			$con->rollBack();
			throw $e;
		}
	}

	/**
	 * Method perform a DELETE on the database, given a J029tHistoricoEvidencia or Criteria object OR a primary key value.
	 *
	 * @param      mixed $values Criteria or J029tHistoricoEvidencia object or primary key or array of primary keys
	 *              which is used to create the DELETE statement
	 * @param      PropelPDO $con the connection to use
	 * @return     int 	The number of affected rows (if supported by underlying database driver).  This includes CASCADE-related rows
	 *				if supported by native driver or if emulated using Propel.
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	 public static function doDelete($values, PropelPDO $con = null)
	 {
		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		if ($values instanceof Criteria) {
			// invalidate the cache for all objects of this type, since we have no
			// way of knowing (without running a query) what objects should be invalidated
			// from the cache based on this Criteria.
			J029tHistoricoEvidenciaPeer::clearInstancePool();

			// rename for clarity
			$criteria = clone $values;
		} elseif ($values instanceof J029tHistoricoEvidencia) {
			// invalidate the cache for this single object
			J029tHistoricoEvidenciaPeer::removeInstanceFromPool($values);
			// create criteria based on pk values
			$criteria = $values->buildPkeyCriteria();
		} else {
			// it must be the primary key



			$criteria = new Criteria(self::DATABASE_NAME);
			$criteria->add(J029tHistoricoEvidenciaPeer::ID, (array) $values, Criteria::IN);

			foreach ((array) $values as $singleval) {
				// we can invalidate the cache for this single object
				J029tHistoricoEvidenciaPeer::removeInstanceFromPool($singleval);
			}
		}

		// Set the correct dbName
		$criteria->setDbName(self::DATABASE_NAME);

		$affectedRows = 0; // initialize var to track total num of affected rows

		try {
			// use transaction because $criteria could contain info
			// for more than one table or we could emulating ON DELETE CASCADE, etc.
			$con->beginTransaction();
			
			$affectedRows += BasePeer::doDelete($criteria, $con);

			$con->commit();
			return $affectedRows;
		} catch (PropelException $e) {
			$con->rollBack();
			throw $e;
		}
	}

	/**
	 * Validates all modified columns of given J029tHistoricoEvidencia object.
	 * If parameter $columns is either a single column name or an array of column names
	 * than only those columns are validated.
	 *
	 * NOTICE: This does not apply to primary or foreign keys for now.
	 *
	 * @param      J029tHistoricoEvidencia $obj The object to validate.
	 * @param      mixed $cols Column name or array of column names.
	 *
	 * @return     mixed TRUE if all columns are valid or the error message of the first invalid column.
	 */
	public static function doValidate(J029tHistoricoEvidencia $obj, $cols = null)
	{
		$columns = array();

		if ($cols) {
			$dbMap = Propel::getDatabaseMap(J029tHistoricoEvidenciaPeer::DATABASE_NAME);
			$tableMap = $dbMap->getTable(J029tHistoricoEvidenciaPeer::TABLE_NAME);

			if (! is_array($cols)) {
				$cols = array($cols);
			}

			foreach ($cols as $colName) {
				if ($tableMap->containsColumn($colName)) {
					$get = 'get' . $tableMap->getColumn($colName)->getPhpName();
					$columns[$colName] = $obj->$get();
				}
			}
		} else {

		}

		$res =  BasePeer::doValidate(J029tHistoricoEvidenciaPeer::DATABASE_NAME, J029tHistoricoEvidenciaPeer::TABLE_NAME, $columns);
    if ($res !== true) {
        $request = sfContext::getInstance()->getRequest();
        foreach ($res as $failed) {
            $col = J029tHistoricoEvidenciaPeer::translateFieldname($failed->getColumn(), BasePeer::TYPE_COLNAME, BasePeer::TYPE_PHPNAME);
        }
    }

    return $res;
	}

	/**
	 * Retrieve a single object by pkey.
	 *
	 * @param      int $pk the primary key.
	 * @param      PropelPDO $con the connection to use
	 * @return     J029tHistoricoEvidencia
	 */
	public static function retrieveByPK($pk, PropelPDO $con = null)
	{

		if (null !== ($obj = J029tHistoricoEvidenciaPeer::getInstanceFromPool((string) $pk))) {
			return $obj;
		}

		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		$criteria = new Criteria(J029tHistoricoEvidenciaPeer::DATABASE_NAME);
		$criteria->add(J029tHistoricoEvidenciaPeer::ID, $pk);

		$v = J029tHistoricoEvidenciaPeer::doSelect($criteria, $con);

		return !empty($v) > 0 ? $v[0] : null;
	}

	/**
	 * Retrieve multiple objects by pkey.
	 *
	 * @param      array $pks List of primary keys
	 * @param      PropelPDO $con the connection to use
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function retrieveByPKs($pks, PropelPDO $con = null)
	{
		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		$objs = null;
		if (empty($pks)) {
			$objs = array();
		} else {
			$criteria = new Criteria(J029tHistoricoEvidenciaPeer::DATABASE_NAME);
			$criteria->add(J029tHistoricoEvidenciaPeer::ID, $pks, Criteria::IN);
			$objs = J029tHistoricoEvidenciaPeer::doSelect($criteria, $con);
		}
		return $objs;
	}

} // BaseJ029tHistoricoEvidenciaPeer

// This is the static code needed to register the MapBuilder for this table with the main Propel class.
//
// NOTE: This static code cannot call methods on the J029tHistoricoEvidenciaPeer class, because it is not defined yet.
// If you need to use overridden methods, you can add this code to the bottom of the J029tHistoricoEvidenciaPeer class:
//
// Propel::getDatabaseMap(J029tHistoricoEvidenciaPeer::DATABASE_NAME)->addTableBuilder(J029tHistoricoEvidenciaPeer::TABLE_NAME, J029tHistoricoEvidenciaPeer::getMapBuilder());
//
// Doing so will effectively overwrite the registration below.

Propel::getDatabaseMap(BaseJ029tHistoricoEvidenciaPeer::DATABASE_NAME)->addTableBuilder(BaseJ029tHistoricoEvidenciaPeer::TABLE_NAME, BaseJ029tHistoricoEvidenciaPeer::getMapBuilder());

