<?php


/**
 * This class adds structure of 'j030t_informe_recomendaciones' table to 'propel' DatabaseMap object.
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
class J030tInformeRecomendacionesMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J030tInformeRecomendacionesMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J030tInformeRecomendacionesPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J030tInformeRecomendacionesPeer::TABLE_NAME);
		$tMap->setPhpName('J030tInformeRecomendaciones');
		$tMap->setClassname('J030tInformeRecomendaciones');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j030t_informe_recomendaciones_co_informe_recomendaciones_seq');

		$tMap->addPrimaryKey('CO_INFORME_RECOMENDACIONES', 'CoInformeRecomendaciones', 'BIGINT', true, null);

		$tMap->addColumn('FE_EMISION', 'FeEmision', 'DATE', false, null);

		$tMap->addForeignKey('CO_ACCION', 'CoAccion', 'BIGINT', 'j031t_accion_recomendada', 'CO_ACCION', false, null);

		$tMap->addForeignKey('CO_REGION', 'CoRegion', 'BIGINT', 'j007t_region', 'CO_REGION', false, null);

		$tMap->addForeignKey('CO_NEGOCIO', 'CoNegocio', 'BIGINT', 'j014t_negocio', 'CO_NEGOCIO', false, null);

		$tMap->addForeignKey('CO_DIVISION', 'CoDivision', 'BIGINT', 'j008t_division', 'CO_DIVISION', false, null);

		$tMap->addColumn('TX_SERIAL', 'TxSerial', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_REVISA', 'CoRevisa', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_APRUEBA', 'CoAprueba', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addColumn('TX_RESUMEN_EJECUTIVO', 'TxResumenEjecutivo', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_ANTECEDENTES', 'TxAntecedentes', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_SITUACION_ACTUAL', 'TxSituacionActual', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_PREOCUPACION', 'TxPreocupacion', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_RECOMENDACIONES', 'TxRecomendaciones', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_OBSERVACIONES', 'TxObservaciones', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_RUTA', 'TxRuta', 'VARCHAR', false, 255);

		$tMap->addColumn('NB_ARCHIVO', 'NbArchivo', 'VARCHAR', false, 255);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

		$tMap->addForeignKey('CO_USUARIO_CREATED', 'CoUsuarioCreated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_USUARIO_UPDATE', 'CoUsuarioUpdate', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

	} // doBuild()

} // J030tInformeRecomendacionesMapBuilder
