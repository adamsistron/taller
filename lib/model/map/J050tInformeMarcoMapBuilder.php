<?php


/**
 * This class adds structure of 'j050t_informe_marco' table to 'propel' DatabaseMap object.
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
class J050tInformeMarcoMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J050tInformeMarcoMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J050tInformeMarcoPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J050tInformeMarcoPeer::TABLE_NAME);
		$tMap->setPhpName('J050tInformeMarco');
		$tMap->setClassname('J050tInformeMarco');

		$tMap->setUseIdGenerator(true);

		$tMap->setPrimaryKeyMethodInfo('j050t_informe_marco_co_informe_marco_seq');

		$tMap->addPrimaryKey('CO_INFORME_MARCO', 'CoInformeMarco', 'BIGINT', true, null);

		$tMap->addColumn('FE_EMISION', 'FeEmision', 'DATE', false, null);

		$tMap->addColumn('TX_SERIAL', 'TxSerial', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_TIPO_REVISION', 'CoTipoRevision', 'BIGINT', 'j051t_tipo_revision', 'CO_TIPO_REVISION', false, null);

		$tMap->addColumn('TX_VERSION', 'TxVersion', 'BIGINT', false, null);

		$tMap->addForeignKey('CO_TIPO_DOCUMENTO', 'CoTipoDocumento', 'BIGINT', 'j046t_marco_normativo', 'CO_MARCO_NORMATIVO', false, null);

		$tMap->addColumn('TX_TITULO', 'TxTitulo', 'VARCHAR', false, 255);

		$tMap->addForeignKey('CO_JUSTIFICACION', 'CoJustificacion', 'BIGINT', 'j052t_tipo_justificacion', 'CO_TIPO_JUSTIFICACION', false, null);

		$tMap->addColumn('TX_JUSTIFICACION', 'TxJustificacion', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_DESCRIPCION', 'TxDescripcion', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_OBSERVACIONES', 'TxObservaciones', 'LONGVARCHAR', false, null);

		$tMap->addColumn('TX_RUTA', 'TxRuta', 'VARCHAR', false, 255);

		$tMap->addColumn('NB_ARCHIVO', 'NbArchivo', 'VARCHAR', false, 255);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

		$tMap->addForeignKey('CO_USUARIO_CREATED', 'CoUsuarioCreated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_USUARIO_UPDATE', 'CoUsuarioUpdate', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

	} // doBuild()

} // J050tInformeMarcoMapBuilder