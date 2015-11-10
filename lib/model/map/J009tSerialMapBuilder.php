<?php


/**
 * This class adds structure of 'j009t_serial' table to 'propel' DatabaseMap object.
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
class J009tSerialMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J009tSerialMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J009tSerialPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J009tSerialPeer::TABLE_NAME);
		$tMap->setPhpName('J009tSerial');
		$tMap->setClassname('J009tSerial');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j009t_serial_co_serial_seq');

		$tMap->addForeignKey('CO_TP_DOCUMENTO', 'CoTpDocumento', 'BIGINT', 'j001t_menu', 'CO_MENU', false, null);

		$tMap->addColumn('NU_SERIAL', 'NuSerial', 'BIGINT', false, null);

		$tMap->addColumn('NU_ANIO', 'NuAnio', 'NUMERIC', false, null);

		$tMap->addPrimaryKey('CO_SERIAL', 'CoSerial', 'BIGINT', true, null);

		$tMap->addColumn('TX_NOMENCLATURA', 'TxNomenclatura', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_REGION', 'CoRegion', 'BIGINT', 'j007t_region', 'CO_REGION', false, null);

	} // doBuild()

} // J009tSerialMapBuilder
