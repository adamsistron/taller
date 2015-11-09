<?php

/**
 * Base static class for performing query and update operations on the 'c004t_acta_aie' table.
 *
 * 
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Mon Nov  9 14:57:51 2015
 *
 * @package    lib.model.om
 */
abstract class BaseC004tActaAiePeer {

	/** the default database name for this class */
	const DATABASE_NAME = 'propel';

	/** the table name for this class */
	const TABLE_NAME = 'c004t_acta_aie';

	/** A class that can be returned by this peer. */
	const CLASS_DEFAULT = 'lib.model.C004tActaAie';

	/** The total number of columns. */
	const NUM_COLUMNS = 14;

	/** The number of lazy-loaded columns. */
	const NUM_LAZY_LOAD_COLUMNS = 0;

	/** the column name for the CO_AIE field */
	const CO_AIE = 'c004t_acta_aie.CO_AIE';

	/** the column name for the FE_EMISION field */
	const FE_EMISION = 'c004t_acta_aie.FE_EMISION';

	/** the column name for the CO_FORENSE field */
	const CO_FORENSE = 'c004t_acta_aie.CO_FORENSE';

	/** the column name for the CO_REGION field */
	const CO_REGION = 'c004t_acta_aie.CO_REGION';

	/** the column name for the CO_NEGOCIO field */
	const CO_NEGOCIO = 'c004t_acta_aie.CO_NEGOCIO';

	/** the column name for the CO_DIVISION field */
	const CO_DIVISION = 'c004t_acta_aie.CO_DIVISION';

	/** the column name for the TX_SERIAL field */
	const TX_SERIAL = 'c004t_acta_aie.TX_SERIAL';

	/** the column name for the CO_ELABORA field */
	const CO_ELABORA = 'c004t_acta_aie.CO_ELABORA';

	/** the column name for the TX_OBSERVACIONES field */
	const TX_OBSERVACIONES = 'c004t_acta_aie.TX_OBSERVACIONES';

	/** the column name for the TX_RUTA field */
	const TX_RUTA = 'c004t_acta_aie.TX_RUTA';

	/** the column name for the NB_ARCHIVO field */
	const NB_ARCHIVO = 'c004t_acta_aie.NB_ARCHIVO';

	/** the column name for the IN_REGISTRO field */
	const IN_REGISTRO = 'c004t_acta_aie.IN_REGISTRO';

	/** the column name for the TX_CLADIFICACION field */
	const TX_CLADIFICACION = 'c004t_acta_aie.TX_CLADIFICACION';

	/** the column name for the ID field */
	const ID = 'c004t_acta_aie.ID';

	/**
	 * An identiy map to hold any loaded instances of C004tActaAie objects.
	 * This must be public so that other peer classes can access this when hydrating from JOIN
	 * queries.
	 * @var        array C004tActaAie[]
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
		BasePeer::TYPE_PHPNAME => array ('CoAie', 'FeEmision', 'CoForense', 'CoRegion', 'CoNegocio', 'CoDivision', 'TxSerial', 'CoElabora', 'TxObservaciones', 'TxRuta', 'NbArchivo', 'InRegistro', 'TxCladificacion', 'Id', ),
		BasePeer::TYPE_STUDLYPHPNAME => array ('coAie', 'feEmision', 'coForense', 'coRegion', 'coNegocio', 'coDivision', 'txSerial', 'coElabora', 'txObservaciones', 'txRuta', 'nbArchivo', 'inRegistro', 'txCladificacion', 'id', ),
		BasePeer::TYPE_COLNAME => array (self::CO_AIE, self::FE_EMISION, self::CO_FORENSE, self::CO_REGION, self::CO_NEGOCIO, self::CO_DIVISION, self::TX_SERIAL, self::CO_ELABORA, self::TX_OBSERVACIONES, self::TX_RUTA, self::NB_ARCHIVO, self::IN_REGISTRO, self::TX_CLADIFICACION, self::ID, ),
		BasePeer::TYPE_FIELDNAME => array ('co_aie', 'fe_emision', 'co_forense', 'co_region', 'co_negocio', 'co_division', 'tx_serial', 'co_elabora', 'tx_observaciones', 'tx_ruta', 'nb_archivo', 'in_registro', 'tx_cladificacion', 'id', ),
		BasePeer::TYPE_NUM => array (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, )
	);

	/**
	 * holds an array of keys for quick access to the fieldnames array
	 *
	 * first dimension keys are the type constants
	 * e.g. self::$fieldNames[BasePeer::TYPE_PHPNAME]['Id'] = 0
	 */
	private static $fieldKeys = array (
		BasePeer::TYPE_PHPNAME => array ('CoAie' => 0, 'FeEmision' => 1, 'CoForense' => 2, 'CoRegion' => 3, 'CoNegocio' => 4, 'CoDivision' => 5, 'TxSerial' => 6, 'CoElabora' => 7, 'TxObservaciones' => 8, 'TxRuta' => 9, 'NbArchivo' => 10, 'InRegistro' => 11, 'TxCladificacion' => 12, 'Id' => 13, ),
		BasePeer::TYPE_STUDLYPHPNAME => array ('coAie' => 0, 'feEmision' => 1, 'coForense' => 2, 'coRegion' => 3, 'coNegocio' => 4, 'coDivision' => 5, 'txSerial' => 6, 'coElabora' => 7, 'txObservaciones' => 8, 'txRuta' => 9, 'nbArchivo' => 10, 'inRegistro' => 11, 'txCladificacion' => 12, 'id' => 13, ),
		BasePeer::TYPE_COLNAME => array (self::CO_AIE => 0, self::FE_EMISION => 1, self::CO_FORENSE => 2, self::CO_REGION => 3, self::CO_NEGOCIO => 4, self::CO_DIVISION => 5, self::TX_SERIAL => 6, self::CO_ELABORA => 7, self::TX_OBSERVACIONES => 8, self::TX_RUTA => 9, self::NB_ARCHIVO => 10, self::IN_REGISTRO => 11, self::TX_CLADIFICACION => 12, self::ID => 13, ),
		BasePeer::TYPE_FIELDNAME => array ('co_aie' => 0, 'fe_emision' => 1, 'co_forense' => 2, 'co_region' => 3, 'co_negocio' => 4, 'co_division' => 5, 'tx_serial' => 6, 'co_elabora' => 7, 'tx_observaciones' => 8, 'tx_ruta' => 9, 'nb_archivo' => 10, 'in_registro' => 11, 'tx_cladificacion' => 12, 'id' => 13, ),
		BasePeer::TYPE_NUM => array (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, )
	);

	/**
	 * Get a (singleton) instance of the MapBuilder for this peer class.
	 * @return     MapBuilder The map builder for this peer
	 */
	public static function getMapBuilder()
	{
		if (self::$mapBuilder === null) {
			self::$mapBuilder = new C004tActaAieMapBuilder();
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
	 * @param      string $column The column name for current table. (i.e. C004tActaAiePeer::COLUMN_NAME).
	 * @return     string
	 */
	public static function alias($alias, $column)
	{
		return str_replace(C004tActaAiePeer::TABLE_NAME.'.', $alias.'.', $column);
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

		$criteria->addSelectColumn(C004tActaAiePeer::CO_AIE);

		$criteria->addSelectColumn(C004tActaAiePeer::FE_EMISION);

		$criteria->addSelectColumn(C004tActaAiePeer::CO_FORENSE);

		$criteria->addSelectColumn(C004tActaAiePeer::CO_REGION);

		$criteria->addSelectColumn(C004tActaAiePeer::CO_NEGOCIO);

		$criteria->addSelectColumn(C004tActaAiePeer::CO_DIVISION);

		$criteria->addSelectColumn(C004tActaAiePeer::TX_SERIAL);

		$criteria->addSelectColumn(C004tActaAiePeer::CO_ELABORA);

		$criteria->addSelectColumn(C004tActaAiePeer::TX_OBSERVACIONES);

		$criteria->addSelectColumn(C004tActaAiePeer::TX_RUTA);

		$criteria->addSelectColumn(C004tActaAiePeer::NB_ARCHIVO);

		$criteria->addSelectColumn(C004tActaAiePeer::IN_REGISTRO);

		$criteria->addSelectColumn(C004tActaAiePeer::TX_CLADIFICACION);

		$criteria->addSelectColumn(C004tActaAiePeer::ID);

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
		$criteria->setPrimaryTableName(C004tActaAiePeer::TABLE_NAME);

		if ($distinct && !in_array(Criteria::DISTINCT, $criteria->getSelectModifiers())) {
			$criteria->setDistinct();
		}

		if (!$criteria->hasSelectClause()) {
			C004tActaAiePeer::addSelectColumns($criteria);
		}

		$criteria->clearOrderByColumns(); // ORDER BY won't ever affect the count
		$criteria->setDbName(self::DATABASE_NAME); // Set the correct dbName

		if ($con === null) {
			$con = Propel::getConnection(C004tActaAiePeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}


    foreach (sfMixer::getCallables('BaseC004tActaAiePeer:doCount:doCount') as $callable)
    {
      call_user_func($callable, 'BaseC004tActaAiePeer', $criteria, $con);
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
	 * @return     C004tActaAie
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function doSelectOne(Criteria $criteria, PropelPDO $con = null)
	{
		$critcopy = clone $criteria;
		$critcopy->setLimit(1);
		$objects = C004tActaAiePeer::doSelect($critcopy, $con);
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
		return C004tActaAiePeer::populateObjects(C004tActaAiePeer::doSelectStmt($criteria, $con));
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

    foreach (sfMixer::getCallables('BaseC004tActaAiePeer:doSelectStmt:doSelectStmt') as $callable)
    {
      call_user_func($callable, 'BaseC004tActaAiePeer', $criteria, $con);
    }


		if ($con === null) {
			$con = Propel::getConnection(C004tActaAiePeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		if (!$criteria->hasSelectClause()) {
			$criteria = clone $criteria;
			C004tActaAiePeer::addSelectColumns($criteria);
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
	 * @param      C004tActaAie $value A C004tActaAie object.
	 * @param      string $key (optional) key to use for instance map (for performance boost if key was already calculated externally).
	 */
	public static function addInstanceToPool(C004tActaAie $obj, $key = null)
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
	 * @param      mixed $value A C004tActaAie object or a primary key value.
	 */
	public static function removeInstanceFromPool($value)
	{
		if (Propel::isInstancePoolingEnabled() && $value !== null) {
			if (is_object($value) && $value instanceof C004tActaAie) {
				$key = (string) $value->getId();
			} elseif (is_scalar($value)) {
				// assume we've been passed a primary key
				$key = (string) $value;
			} else {
				$e = new PropelException("Invalid value passed to removeInstanceFromPool().  Expected primary key or C004tActaAie object; got " . (is_object($value) ? get_class($value) . ' object.' : var_export($value,true)));
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
	 * @return     C004tActaAie Found object or NULL if 1) no instance exists for specified key or 2) instance pooling has been disabled.
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
		if ($row[$startcol + 13] === null) {
			return null;
		}
		return (string) $row[$startcol + 13];
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
		$cls = C004tActaAiePeer::getOMClass();
		$cls = substr('.'.$cls, strrpos('.'.$cls, '.') + 1);
		// populate the object(s)
		while ($row = $stmt->fetch(PDO::FETCH_NUM)) {
			$key = C004tActaAiePeer::getPrimaryKeyHashFromRow($row, 0);
			if (null !== ($obj = C004tActaAiePeer::getInstanceFromPool($key))) {
				// We no longer rehydrate the object, since this can cause data loss.
				// See http://propel.phpdb.org/trac/ticket/509
				// $obj->hydrate($row, 0, true); // rehydrate
				$results[] = $obj;
			} else {
		
				$obj = new $cls();
				$obj->hydrate($row);
				$results[] = $obj;
				C004tActaAiePeer::addInstanceToPool($obj, $key);
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
		return C004tActaAiePeer::CLASS_DEFAULT;
	}

	/**
	 * Method perform an INSERT on the database, given a C004tActaAie or Criteria object.
	 *
	 * @param      mixed $values Criteria or C004tActaAie object containing data that is used to create the INSERT statement.
	 * @param      PropelPDO $con the PropelPDO connection to use
	 * @return     mixed The new primary key.
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function doInsert($values, PropelPDO $con = null)
	{

    foreach (sfMixer::getCallables('BaseC004tActaAiePeer:doInsert:pre') as $callable)
    {
      $ret = call_user_func($callable, 'BaseC004tActaAiePeer', $values, $con);
      if (false !== $ret)
      {
        return $ret;
      }
    }


		if ($con === null) {
			$con = Propel::getConnection(C004tActaAiePeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		if ($values instanceof Criteria) {
			$criteria = clone $values; // rename for clarity
		} else {
			$criteria = $values->buildCriteria(); // build Criteria from C004tActaAie object
		}

		if ($criteria->containsKey(C004tActaAiePeer::ID) && $criteria->keyContainsValue(C004tActaAiePeer::ID) ) {
			throw new PropelException('Cannot insert a value for auto-increment primary key ('.C004tActaAiePeer::ID.')');
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

		
    foreach (sfMixer::getCallables('BaseC004tActaAiePeer:doInsert:post') as $callable)
    {
      call_user_func($callable, 'BaseC004tActaAiePeer', $values, $con, $pk);
    }

    return $pk;
	}

	/**
	 * Method perform an UPDATE on the database, given a C004tActaAie or Criteria object.
	 *
	 * @param      mixed $values Criteria or C004tActaAie object containing data that is used to create the UPDATE statement.
	 * @param      PropelPDO $con The connection to use (specify PropelPDO connection object to exert more control over transactions).
	 * @return     int The number of affected rows (if supported by underlying database driver).
	 * @throws     PropelException Any exceptions caught during processing will be
	 *		 rethrown wrapped into a PropelException.
	 */
	public static function doUpdate($values, PropelPDO $con = null)
	{

    foreach (sfMixer::getCallables('BaseC004tActaAiePeer:doUpdate:pre') as $callable)
    {
      $ret = call_user_func($callable, 'BaseC004tActaAiePeer', $values, $con);
      if (false !== $ret)
      {
        return $ret;
      }
    }


		if ($con === null) {
			$con = Propel::getConnection(C004tActaAiePeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		$selectCriteria = new Criteria(self::DATABASE_NAME);

		if ($values instanceof Criteria) {
			$criteria = clone $values; // rename for clarity

			$comparison = $criteria->getComparison(C004tActaAiePeer::ID);
			$selectCriteria->add(C004tActaAiePeer::ID, $criteria->remove(C004tActaAiePeer::ID), $comparison);

		} else { // $values is C004tActaAie object
			$criteria = $values->buildCriteria(); // gets full criteria
			$selectCriteria = $values->buildPkeyCriteria(); // gets criteria w/ primary key(s)
		}

		// set the correct dbName
		$criteria->setDbName(self::DATABASE_NAME);

		$ret = BasePeer::doUpdate($selectCriteria, $criteria, $con);
	

    foreach (sfMixer::getCallables('BaseC004tActaAiePeer:doUpdate:post') as $callable)
    {
      call_user_func($callable, 'BaseC004tActaAiePeer', $values, $con, $ret);
    }

    return $ret;
  }

	/**
	 * Method to DELETE all rows from the c004t_acta_aie table.
	 *
	 * @return     int The number of affected rows (if supported by underlying database driver).
	 */
	public static function doDeleteAll($con = null)
	{
		if ($con === null) {
			$con = Propel::getConnection(C004tActaAiePeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}
		$affectedRows = 0; // initialize var to track total num of affected rows
		try {
			// use transaction because $criteria could contain info
			// for more than one table or we could emulating ON DELETE CASCADE, etc.
			$con->beginTransaction();
			$affectedRows += BasePeer::doDeleteAll(C004tActaAiePeer::TABLE_NAME, $con);
			$con->commit();
			return $affectedRows;
		} catch (PropelException $e) {
			$con->rollBack();
			throw $e;
		}
	}

	/**
	 * Method perform a DELETE on the database, given a C004tActaAie or Criteria object OR a primary key value.
	 *
	 * @param      mixed $values Criteria or C004tActaAie object or primary key or array of primary keys
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
			$con = Propel::getConnection(C004tActaAiePeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		if ($values instanceof Criteria) {
			// invalidate the cache for all objects of this type, since we have no
			// way of knowing (without running a query) what objects should be invalidated
			// from the cache based on this Criteria.
			C004tActaAiePeer::clearInstancePool();

			// rename for clarity
			$criteria = clone $values;
		} elseif ($values instanceof C004tActaAie) {
			// invalidate the cache for this single object
			C004tActaAiePeer::removeInstanceFromPool($values);
			// create criteria based on pk values
			$criteria = $values->buildPkeyCriteria();
		} else {
			// it must be the primary key



			$criteria = new Criteria(self::DATABASE_NAME);
			$criteria->add(C004tActaAiePeer::ID, (array) $values, Criteria::IN);

			foreach ((array) $values as $singleval) {
				// we can invalidate the cache for this single object
				C004tActaAiePeer::removeInstanceFromPool($singleval);
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
	 * Validates all modified columns of given C004tActaAie object.
	 * If parameter $columns is either a single column name or an array of column names
	 * than only those columns are validated.
	 *
	 * NOTICE: This does not apply to primary or foreign keys for now.
	 *
	 * @param      C004tActaAie $obj The object to validate.
	 * @param      mixed $cols Column name or array of column names.
	 *
	 * @return     mixed TRUE if all columns are valid or the error message of the first invalid column.
	 */
	public static function doValidate(C004tActaAie $obj, $cols = null)
	{
		$columns = array();

		if ($cols) {
			$dbMap = Propel::getDatabaseMap(C004tActaAiePeer::DATABASE_NAME);
			$tableMap = $dbMap->getTable(C004tActaAiePeer::TABLE_NAME);

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

		$res =  BasePeer::doValidate(C004tActaAiePeer::DATABASE_NAME, C004tActaAiePeer::TABLE_NAME, $columns);
    if ($res !== true) {
        $request = sfContext::getInstance()->getRequest();
        foreach ($res as $failed) {
            $col = C004tActaAiePeer::translateFieldname($failed->getColumn(), BasePeer::TYPE_COLNAME, BasePeer::TYPE_PHPNAME);
        }
    }

    return $res;
	}

	/**
	 * Retrieve a single object by pkey.
	 *
	 * @param      int $pk the primary key.
	 * @param      PropelPDO $con the connection to use
	 * @return     C004tActaAie
	 */
	public static function retrieveByPK($pk, PropelPDO $con = null)
	{

		if (null !== ($obj = C004tActaAiePeer::getInstanceFromPool((string) $pk))) {
			return $obj;
		}

		if ($con === null) {
			$con = Propel::getConnection(C004tActaAiePeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		$criteria = new Criteria(C004tActaAiePeer::DATABASE_NAME);
		$criteria->add(C004tActaAiePeer::ID, $pk);

		$v = C004tActaAiePeer::doSelect($criteria, $con);

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
			$con = Propel::getConnection(C004tActaAiePeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		$objs = null;
		if (empty($pks)) {
			$objs = array();
		} else {
			$criteria = new Criteria(C004tActaAiePeer::DATABASE_NAME);
			$criteria->add(C004tActaAiePeer::ID, $pks, Criteria::IN);
			$objs = C004tActaAiePeer::doSelect($criteria, $con);
		}
		return $objs;
	}

} // BaseC004tActaAiePeer

// This is the static code needed to register the MapBuilder for this table with the main Propel class.
//
// NOTE: This static code cannot call methods on the C004tActaAiePeer class, because it is not defined yet.
// If you need to use overridden methods, you can add this code to the bottom of the C004tActaAiePeer class:
//
// Propel::getDatabaseMap(C004tActaAiePeer::DATABASE_NAME)->addTableBuilder(C004tActaAiePeer::TABLE_NAME, C004tActaAiePeer::getMapBuilder());
//
// Doing so will effectively overwrite the registration below.

Propel::getDatabaseMap(BaseC004tActaAiePeer::DATABASE_NAME)->addTableBuilder(BaseC004tActaAiePeer::TABLE_NAME, BaseC004tActaAiePeer::getMapBuilder());

