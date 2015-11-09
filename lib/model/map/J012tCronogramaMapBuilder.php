<?php


/**
 * This class adds structure of 'j012t_cronograma' table to 'propel' DatabaseMap object.
 *
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Mon Nov  9 14:57:52 2015
 *
 *
 * These statically-built map classes are used by Propel to do runtime db structure discovery.
 * For example, the createSelectSql() method checks the type of a given column used in an
 * ORDER BY clause to know whether it needs to apply SQL to make the ORDER BY case-insensitive
 * (i.e. if it's a text column type).
 *
 * @package    lib.model.map
 */
class J012tCronogramaMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J012tCronogramaMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J012tCronogramaPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J012tCronogramaPeer::TABLE_NAME);
		$tMap->setPhpName('J012tCronograma');
		$tMap->setClassname('J012tCronograma');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j012t_cronograma_co_cronograma_seq');

		$tMap->addPrimaryKey('CO_CRONOGRAMA', 'CoCronograma', 'BIGINT', true, null);

		$tMap->addColumn('TX_DESCRIPCION', 'TxDescripcion', 'VARCHAR', false, 255);

		$tMap->addColumn('FE_CRONOGRAMA', 'FeCronograma', 'DATE', false, null);

		$tMap->addForeignKey('CO_TRANSACCION_ENLACE', 'CoTransaccionEnlace', 'BIGINT', 'j005t_transaccion', 'CO_TRANSACCION', false, null);

		$tMap->addForeignKey('CO_TRANSACCION', 'CoTransaccion', 'BIGINT', 'j005t_transaccion', 'CO_TRANSACCION', false, null);

		$tMap->addColumn('TX_SERIAL', 'TxSerial', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_USUARIO', 'CoUsuario', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

	} // doBuild()

} // J012tCronogramaMapBuilder