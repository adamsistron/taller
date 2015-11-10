<?php


/**
 * This class adds structure of 'j033t_procesos' table to 'propel' DatabaseMap object.
 *
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Tue Nov 10 11:06:18 2015
 *
 *
 * These statically-built map classes are used by Propel to do runtime db structure discovery.
 * For example, the createSelectSql() method checks the type of a given column used in an
 * ORDER BY clause to know whether it needs to apply SQL to make the ORDER BY case-insensitive
 * (i.e. if it's a text column type).
 *
 * @package    lib.model.map
 */
class J033tProcesosMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J033tProcesosMapBuilder';

	/**
	 * The database map.
	 */
	private $dbMap;

	/**
	 * Tells us if this DatabaseMapBuilder is built so that we
	 * don't have to re-build it every time.
	 *
	 * @return     boolean true if this DatabaseMapBuilder is built, false otherwise.
	 */
	public function isBuilt()
	{
		return ($this->dbMap !== null);
	}

	/**
	 * Gets the databasemap this map builder built.
	 *
	 * @return     the databasemap
	 */
	public function getDatabaseMap()
	{
		return $this->dbMap;
	}

	/**
	 * The doBuild() method builds the DatabaseMap
	 *
	 * @return     void
	 * @throws     PropelException
	 */
	public function doBuild()
	{
		$this->dbMap = Propel::getDatabaseMap(J033tProcesosPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J033tProcesosPeer::TABLE_NAME);
		$tMap->setPhpName('J033tProcesos');
		$tMap->setClassname('J033tProcesos');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j033t_procesos_co_proceso_seq');

		$tMap->addPrimaryKey('CO_PROCESO', 'CoProceso', 'BIGINT', true, null);

		$tMap->addColumn('TX_PROCESO', 'TxProceso', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_SIGLA', 'TxSigla', 'VARCHAR', false, 255);

	} // doBuild()

} // J033tProcesosMapBuilder
