<?php


/**
 * This class adds structure of 'j044t_tipo_hechos' table to 'propel' DatabaseMap object.
 *
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Thu Nov 12 11:16:19 2015
 *
 *
 * These statically-built map classes are used by Propel to do runtime db structure discovery.
 * For example, the createSelectSql() method checks the type of a given column used in an
 * ORDER BY clause to know whether it needs to apply SQL to make the ORDER BY case-insensitive
 * (i.e. if it's a text column type).
 *
 * @package    lib.model.map
 */
class J044tTipoHechosMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J044tTipoHechosMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J044tTipoHechosPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J044tTipoHechosPeer::TABLE_NAME);
		$tMap->setPhpName('J044tTipoHechos');
		$tMap->setClassname('J044tTipoHechos');

		$tMap->setUseIdGenerator(false);

		$tMap->addPrimaryKey('CO_TIPO_HECHOS', 'CoTipoHechos', 'BIGINT', true, null);

		$tMap->addColumn('CO_CREATED_AT', 'CoCreatedAt', 'BIGINT', false, null);

		$tMap->addColumn('CO_UPDATE_AT', 'CoUpdateAt', 'BIGINT', false, null);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATED_AT', 'UpdatedAt', 'TIMESTAMP', false, null);

		$tMap->addColumn('TX_TIPO_HECHOS', 'TxTipoHechos', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_TIPO_INCIDENTE', 'CoTipoIncidente', 'BIGINT', 'j043t_tipo_incidentes', 'CO_TIPO_INCIDENTES', false, null);

	} // doBuild()

} // J044tTipoHechosMapBuilder
