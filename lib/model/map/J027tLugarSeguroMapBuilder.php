<?php


/**
 * This class adds structure of 'j027t_lugar_seguro' table to 'propel' DatabaseMap object.
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
class J027tLugarSeguroMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J027tLugarSeguroMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J027tLugarSeguroPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J027tLugarSeguroPeer::TABLE_NAME);
		$tMap->setPhpName('J027tLugarSeguro');
		$tMap->setClassname('J027tLugarSeguro');

		$tMap->setUseIdGenerator(false);

		$tMap->addPrimaryKey('CO_LUGAR_SEGURO', 'CoLugarSeguro', 'BIGINT', true, null);

		$tMap->addColumn('TX_UBICACION_FISICA', 'TxUbicacionFisica', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_GERENCIA_CUSTODIA', 'TxGerenciaCustodia', 'VARCHAR', false, 255);

		$tMap->addColumn('CO_CUSTODIO', 'CoCustodio', 'BIGINT', false, null);

		$tMap->addColumn('TX_OBSERVACIONES', 'TxObservaciones', 'VARCHAR', false, 255);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

		$tMap->addForeignKey('CO_USUARIO_CREATED', 'CoUsuarioCreated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_USUARIO_UPDATED', 'CoUsuarioUpdated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

	} // doBuild()

} // J027tLugarSeguroMapBuilder
