<?php


/**
 * This class adds structure of 'j046t_marco_normativo' table to 'propel' DatabaseMap object.
 *
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Tue Nov 10 11:06:19 2015
 *
 *
 * These statically-built map classes are used by Propel to do runtime db structure discovery.
 * For example, the createSelectSql() method checks the type of a given column used in an
 * ORDER BY clause to know whether it needs to apply SQL to make the ORDER BY case-insensitive
 * (i.e. if it's a text column type).
 *
 * @package    lib.model.map
 */
class J046tMarcoNormativoMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J046tMarcoNormativoMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J046tMarcoNormativoPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J046tMarcoNormativoPeer::TABLE_NAME);
		$tMap->setPhpName('J046tMarcoNormativo');
		$tMap->setClassname('J046tMarcoNormativo');

		$tMap->setUseIdGenerator(false);

		$tMap->addPrimaryKey('CO_MARCO_NORMATIVO', 'CoMarcoNormativo', 'BIGINT', true, null);

		$tMap->addColumn('CO_DOCUMENTO', 'CoDocumento', 'BIGINT', false, null);

		$tMap->addColumn('TX_CODIGO_MARCO', 'TxCodigoMarco', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_DESCRIPCION', 'TxDescripcion', 'BIGINT', false, null);

		$tMap->addColumn('CO_CREATED_AT', 'CoCreatedAt', 'BIGINT', false, null);

		$tMap->addColumn('CO_UPDATED_AT', 'CoUpdatedAt', 'BIGINT', false, null);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

	} // doBuild()

} // J046tMarcoNormativoMapBuilder
