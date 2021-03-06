<?php


/**
 * This class adds structure of 'j031t_accion_recomendada' table to 'propel' DatabaseMap object.
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
class J031tAccionRecomendadaMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J031tAccionRecomendadaMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J031tAccionRecomendadaPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J031tAccionRecomendadaPeer::TABLE_NAME);
		$tMap->setPhpName('J031tAccionRecomendada');
		$tMap->setClassname('J031tAccionRecomendada');

		$tMap->setUseIdGenerator(false);

		$tMap->addPrimaryKey('CO_ACCION', 'CoAccion', 'BIGINT', true, null);

		$tMap->addColumn('TX_DESCRIPCION', 'TxDescripcion', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_RESPONSABLE_EJECUTAR', 'TxResponsableEjecutar', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_RESPONSABLE_STI_EJECUTAR', 'CoResponsableStiEjecutar', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addColumn('FECHA_A_EJECUTAR', 'FechaAEjecutar', 'DATE', false, null);

		$tMap->addColumn('FECHA_EJECUTADA', 'FechaEjecutada', 'DATE', false, null);

		$tMap->addColumn('TX_SEGUIMIENTO', 'TxSeguimiento', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_OBSERVACIONES', 'TxObservaciones', 'VARCHAR', false, 255);

		$tMap->addColumn('IN_ABIERTO', 'InAbierto', 'BOOLEAN', false, null);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addForeignKey('CO_CREATED_AT', 'CoCreatedAt', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addColumn('UPDATED_AT', 'UpdatedAt', 'TIMESTAMP', false, null);

		$tMap->addForeignKey('CO_UPDATE_AT', 'CoUpdateAt', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_INCIDENTE', 'CoIncidente', 'BIGINT', 'j034t_incidente', 'CO_INCIDENTE', false, null);

		$tMap->addForeignKey('CO_FORENSE', 'CoForense', 'BIGINT', 'j016t_forense', 'CO_FORENSE', false, null);

		$tMap->addColumn('CO_MONITOREO', 'CoMonitoreo', 'BIGINT', false, null);

		$tMap->addColumn('CO_DEPURACION', 'CoDepuracion', 'BIGINT', false, null);

	} // doBuild()

} // J031tAccionRecomendadaMapBuilder
