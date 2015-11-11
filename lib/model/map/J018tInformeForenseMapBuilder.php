<?php


/**
 * This class adds structure of 'j018t_informe_forense' table to 'propel' DatabaseMap object.
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
class J018tInformeForenseMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J018tInformeForenseMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J018tInformeForensePeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J018tInformeForensePeer::TABLE_NAME);
		$tMap->setPhpName('J018tInformeForense');
		$tMap->setClassname('J018tInformeForense');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j018t_informe_forense_co_informe_forense_seq');

		$tMap->addPrimaryKey('CO_INFORME_FORENSE', 'CoInformeForense', 'BIGINT', true, null);

		$tMap->addColumn('FE_EMISION', 'FeEmision', 'DATE', false, null);

		$tMap->addForeignKey('CO_FORENSE', 'CoForense', 'BIGINT', 'j016t_forense', 'CO_FORENSE', false, null);

		$tMap->addForeignKey('CO_REGION', 'CoRegion', 'BIGINT', 'j007t_region', 'CO_REGION', false, null);

		$tMap->addForeignKey('CO_NEGOCIO', 'CoNegocio', 'BIGINT', 'j014t_negocio', 'CO_NEGOCIO', false, null);

		$tMap->addForeignKey('CO_DIVISION', 'CoDivision', 'BIGINT', 'j008t_division', 'CO_DIVISION', false, null);

		$tMap->addColumn('TX_SERIAL', 'TxSerial', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_REVISA', 'CoRevisa', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_APRUEBA', 'CoAprueba', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addColumn('TX_RESULTADOS', 'TxResultados', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_CONCLUSIONES', 'TxConclusiones', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_OBSERVACIONES', 'TxObservaciones', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_RUTA', 'TxRuta', 'VARCHAR', false, 255);

		$tMap->addColumn('NB_ARCHIVO', 'NbArchivo', 'VARCHAR', false, 255);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

		$tMap->addForeignKey('CO_USUARIO_CREATED', 'CoUsuarioCreated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_USUARIO_UPDATE', 'CoUsuarioUpdate', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

	} // doBuild()

} // J018tInformeForenseMapBuilder
