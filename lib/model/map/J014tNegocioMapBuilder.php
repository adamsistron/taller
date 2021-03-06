<?php


/**
 * This class adds structure of 'j014t_negocio' table to 'propel' DatabaseMap object.
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
class J014tNegocioMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J014tNegocioMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J014tNegocioPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J014tNegocioPeer::TABLE_NAME);
		$tMap->setPhpName('J014tNegocio');
		$tMap->setClassname('J014tNegocio');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j014t_negocio_co_negocio_seq');

		$tMap->addPrimaryKey('CO_NEGOCIO', 'CoNegocio', 'BIGINT', true, null);

		$tMap->addColumn('TX_NEGOCIO', 'TxNegocio', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_SIGLA', 'TxSigla', 'VARCHAR', false, 255);

	} // doBuild()

} // J014tNegocioMapBuilder
