<?php


/**
 * This class adds structure of 'j045t_referencia_marco' table to 'propel' DatabaseMap object.
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
class J045tReferenciaMarcoMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J045tReferenciaMarcoMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J045tReferenciaMarcoPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J045tReferenciaMarcoPeer::TABLE_NAME);
		$tMap->setPhpName('J045tReferenciaMarco');
		$tMap->setClassname('J045tReferenciaMarco');

		$tMap->setUseIdGenerator(false);

		$tMap->addPrimaryKey('CO_REFERENCIA_MARCO', 'CoReferenciaMarco', 'BIGINT', true, null);

		$tMap->addForeignKey('CO_MARCO_NORMATIVO', 'CoMarcoNormativo', 'BIGINT', 'j046t_marco_normativo', 'CO_MARCO_NORMATIVO', false, null);

		$tMap->addForeignKey('CO_INCIDENTE', 'CoIncidente', 'BIGINT', 'j034t_incidente', 'CO_INCIDENTE', false, null);

		$tMap->addForeignKey('CO_RECOMENDACIONES', 'CoRecomendaciones', 'BIGINT', 'j030t_informe_recomendaciones', 'CO_INFORME_RECOMENDACIONES', false, null);

		$tMap->addColumn('CO_MONITOREO', 'CoMonitoreo', 'BIGINT', false, null);

		$tMap->addForeignKey('CO_FORENSE', 'CoForense', 'BIGINT', 'j016t_forense', 'CO_FORENSE', false, null);

		$tMap->addColumn('CO_DEPURACION', 'CoDepuracion', 'BIGINT', false, null);

		$tMap->addColumn('CO_CUMPLE', 'CoCumple', 'BOOLEAN', false, null);

		$tMap->addForeignKey('CO_ACCION', 'CoAccion', 'BIGINT', 'j031t_accion_recomendada', 'CO_ACCION', false, null);

	} // doBuild()

} // J045tReferenciaMarcoMapBuilder
