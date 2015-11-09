<?php


/**
 * This class adds structure of 'j016t_forense' table to 'propel' DatabaseMap object.
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
class J016tForenseMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J016tForenseMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J016tForensePeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J016tForensePeer::TABLE_NAME);
		$tMap->setPhpName('J016tForense');
		$tMap->setClassname('J016tForense');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j016t_forense_co_forense_seq');

		$tMap->addPrimaryKey('CO_FORENSE', 'CoForense', 'BIGINT', true, null);

		$tMap->addColumn('FE_APERTURA', 'FeApertura', 'DATE', false, null);

		$tMap->addColumn('FE_CIERRE', 'FeCierre', 'DATE', false, null);

		$tMap->addForeignKey('CO_USUARIO_APERTURA', 'CoUsuarioApertura', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_USUARIO_CIERRE', 'CoUsuarioCierre', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_REGION', 'CoRegion', 'BIGINT', 'j007t_region', 'CO_REGION', false, null);

		$tMap->addForeignKey('CO_NEGOCIO', 'CoNegocio', 'BIGINT', 'j014t_negocio', 'CO_NEGOCIO', false, null);

		$tMap->addForeignKey('CO_DIVISION', 'CoDivision', 'BIGINT', 'j008t_division', 'CO_DIVISION', false, null);

		$tMap->addColumn('TX_SERIAL', 'TxSerial', 'VARCHAR', false, 255);

		$tMap->addColumn('IN_ABIERTO', 'InAbierto', 'BOOLEAN', false, null);

		$tMap->addColumn('TX_DESCRIPCION_SOLICITUD', 'TxDescripcionSolicitud', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_CASO_AAII', 'TxCasoAaii', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_ALCANCE_FORENSE', 'CoAlcanceForense', 'BIGINT', 'j017t_alcance_forense', 'CO_ALCANCE_FORENSE', false, null);

		$tMap->addColumn('TX_DESCRIPCION_ENTORNO', 'TxDescripcionEntorno', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_METOLOGIA_HERRAMIENTAS', 'TxMetologiaHerramientas', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_OBSERVACIONES', 'TxObservaciones', 'VARCHAR', false, 255);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

		$tMap->addColumn('CO_USUARIO_CREATED', 'CoUsuarioCreated', 'BIGINT', false, null);

		$tMap->addForeignKey('CO_USUARIO_UPDATE', 'CoUsuarioUpdate', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

	} // doBuild()

} // J016tForenseMapBuilder
