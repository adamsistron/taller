<?php


/**
 * This class adds structure of 'j032t_seriales_enlaces_ir' table to 'propel' DatabaseMap object.
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
class J032tSerialesEnlacesIrMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J032tSerialesEnlacesIrMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J032tSerialesEnlacesIrPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J032tSerialesEnlacesIrPeer::TABLE_NAME);
		$tMap->setPhpName('J032tSerialesEnlacesIr');
		$tMap->setClassname('J032tSerialesEnlacesIr');

		$tMap->setUseIdGenerator(false);

		$tMap->addPrimaryKey('CO_ENLACES_IR', 'CoEnlacesIr', 'BIGINT', true, null);

		$tMap->addForeignKey('CO_INFORME_RECOMENDACIONES', 'CoInformeRecomendaciones', 'BIGINT', 'j030t_informe_recomendaciones', 'CO_INFORME_RECOMENDACIONES', false, null);

		$tMap->addForeignKey('CO_FORENSE', 'CoForense', 'BIGINT', 'j016t_forense', 'CO_FORENSE', false, null);

		$tMap->addColumn('CO_INCIDENTE', 'CoIncidente', 'BIGINT', false, null);

		$tMap->addColumn('CO_DEPURACION', 'CoDepuracion', 'BIGINT', false, null);

	} // doBuild()

} // J032tSerialesEnlacesIrMapBuilder