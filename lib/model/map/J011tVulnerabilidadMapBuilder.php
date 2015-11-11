<?php


/**
 * This class adds structure of 'j011t_vulnerabilidad' table to 'propel' DatabaseMap object.
 *
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Wed Nov 11 13:50:04 2015
 *
 *
 * These statically-built map classes are used by Propel to do runtime db structure discovery.
 * For example, the createSelectSql() method checks the type of a given column used in an
 * ORDER BY clause to know whether it needs to apply SQL to make the ORDER BY case-insensitive
 * (i.e. if it's a text column type).
 *
 * @package    lib.model.map
 */
class J011tVulnerabilidadMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J011tVulnerabilidadMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J011tVulnerabilidadPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J011tVulnerabilidadPeer::TABLE_NAME);
		$tMap->setPhpName('J011tVulnerabilidad');
		$tMap->setClassname('J011tVulnerabilidad');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j011t_vulnerabilidad_co_vulnerabilidad_seq');

		$tMap->addPrimaryKey('CO_VULNERABILIDAD', 'CoVulnerabilidad', 'BIGINT', true, null);

		$tMap->addColumn('TX_VULNERABILIDAD', 'TxVulnerabilidad', 'VARCHAR', false, 255);

		$tMap->addColumn('FE_VULNERABILIDAD', 'FeVulnerabilidad', 'DATE', false, null);

		$tMap->addForeignKey('CO_TRANSACCION', 'CoTransaccion', 'BIGINT', 'j005t_transaccion', 'CO_TRANSACCION', true, null);

		$tMap->addColumn('IN_APLICACION', 'InAplicacion', 'BOOLEAN', false, null);

		$tMap->addColumn('IN_CERRADO', 'InCerrado', 'BOOLEAN', false, null);

	} // doBuild()

} // J011tVulnerabilidadMapBuilder
