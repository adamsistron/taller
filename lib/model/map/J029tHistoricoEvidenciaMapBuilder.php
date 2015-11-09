<?php


/**
 * This class adds structure of 'j029t_historico_evidencia' table to 'propel' DatabaseMap object.
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
class J029tHistoricoEvidenciaMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J029tHistoricoEvidenciaMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J029tHistoricoEvidenciaPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J029tHistoricoEvidenciaPeer::TABLE_NAME);
		$tMap->setPhpName('J029tHistoricoEvidencia');
		$tMap->setClassname('J029tHistoricoEvidencia');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j029t_historico_evidencia_id_seq');

		$tMap->addColumn('CO_HISTORICO_EVIDENCIA', 'CoHistoricoEvidencia', 'BIGINT', false, null);

		$tMap->addColumn('CO_EVIDENCIA', 'CoEvidencia', 'BIGINT', false, null);

		$tMap->addColumn('FE_CAMBIO_ESTADO', 'FeCambioEstado', 'DATE', false, null);

		$tMap->addColumn('CO_CAMBIA_ESTADO', 'CoCambiaEstado', 'BIGINT', false, null);

		$tMap->addColumn('TX_ESTADO_ANTERIOR', 'TxEstadoAnterior', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_LUGAR_ANTERIOR', 'TxLugarAnterior', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_CUSTODIO_ANTERIOR', 'TxCustodioAnterior', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_REPOSITORIO_ANTERIOR', 'TxRepositorioAnterior', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_OBSERVACIONES', 'TxObservaciones', 'VARCHAR', false, 255);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

		$tMap->addPrimaryKey('ID', 'Id', 'INTEGER', true, null);

	} // doBuild()

} // J029tHistoricoEvidenciaMapBuilder
