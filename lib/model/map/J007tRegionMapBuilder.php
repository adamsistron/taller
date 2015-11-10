<?php


/**
 * This class adds structure of 'j007t_region' table to 'propel' DatabaseMap object.
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
class J007tRegionMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J007tRegionMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J007tRegionPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J007tRegionPeer::TABLE_NAME);
		$tMap->setPhpName('J007tRegion');
		$tMap->setClassname('J007tRegion');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j007t_region_co_region_seq');

		$tMap->addPrimaryKey('CO_REGION', 'CoRegion', 'BIGINT', true, null);

		$tMap->addColumn('TX_REGION', 'TxRegion', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_SIGLA', 'TxSigla', 'VARCHAR', false, 255);

	} // doBuild()

} // J007tRegionMapBuilder
