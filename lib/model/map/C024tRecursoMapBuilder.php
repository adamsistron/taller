<?php


/**
 * This class adds structure of 'c024t_recurso' table to 'propel' DatabaseMap object.
 *
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Thu Nov 12 11:16:18 2015
 *
 *
 * These statically-built map classes are used by Propel to do runtime db structure discovery.
 * For example, the createSelectSql() method checks the type of a given column used in an
 * ORDER BY clause to know whether it needs to apply SQL to make the ORDER BY case-insensitive
 * (i.e. if it's a text column type).
 *
 * @package    lib.model.map
 */
class C024tRecursoMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.C024tRecursoMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(C024tRecursoPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(C024tRecursoPeer::TABLE_NAME);
		$tMap->setPhpName('C024tRecurso');
		$tMap->setClassname('C024tRecurso');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('c024t_recurso_co_recurso_seq');

		$tMap->addColumn('TX_DESCRIPCION', 'TxDescripcion', 'VARCHAR', false, 255);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

		$tMap->addForeignKey('CO_USUARIO_CREATED', 'CoUsuarioCreated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_USUARIO_UPDATED', 'CoUsuarioUpdated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addPrimaryKey('CO_RECURSO', 'CoRecurso', 'BIGINT', true, null);

	} // doBuild()

} // C024tRecursoMapBuilder
