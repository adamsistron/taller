<?php


/**
 * This class adds structure of 'j002t_usuario' table to 'propel' DatabaseMap object.
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
class J002tUsuarioMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J002tUsuarioMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J002tUsuarioPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J002tUsuarioPeer::TABLE_NAME);
		$tMap->setPhpName('J002tUsuario');
		$tMap->setClassname('J002tUsuario');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j002t_usuario_co_usuario_seq');

		$tMap->addPrimaryKey('CO_USUARIO', 'CoUsuario', 'BIGINT', true, null);

		$tMap->addColumn('TX_INDICADOR', 'TxIndicador', 'VARCHAR', false, 255);

		$tMap->addColumn('NB_EMPLEADO', 'NbEmpleado', 'VARCHAR', false, 255);

		$tMap->addColumn('AP_EMPLEADO', 'ApEmpleado', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_DIVISION', 'CoDivision', 'BIGINT', 'j008t_division', 'CO_DIVISION', false, null);

		$tMap->addForeignKey('CO_ROL', 'CoRol', 'BIGINT', 'j003t_rol', 'CO_ROL', false, null);

		$tMap->addForeignKey('CO_REGION', 'CoRegion', 'BIGINT', 'j007t_region', 'CO_REGION', false, null);

		$tMap->addForeignKey('CO_NEGOCIO', 'CoNegocio', 'BIGINT', 'j014t_negocio', 'CO_NEGOCIO', false, null);

	} // doBuild()

} // J002tUsuarioMapBuilder
