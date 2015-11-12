<?php


/**
 * This class adds structure of 'j047t_documento_normativo' table to 'propel' DatabaseMap object.
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
class J047tDocumentoNormativoMapBuilder implements MapBuilder {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'lib.model.map.J047tDocumentoNormativoMapBuilder';

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
		$this->dbMap = Propel::getDatabaseMap(J047tDocumentoNormativoPeer::DATABASE_NAME);

		$tMap = $this->dbMap->addTable(J047tDocumentoNormativoPeer::TABLE_NAME);
		$tMap->setPhpName('J047tDocumentoNormativo');
		$tMap->setClassname('J047tDocumentoNormativo');

		$tMap->setUseIdGenerator(false);

		$tMap->addPrimaryKey('CO_DOCUMENTO_NORMATIVO', 'CoDocumentoNormativo', 'BIGINT', true, null);

		$tMap->addForeignKey('CO_TIPO_MARCO', 'CoTipoMarco', 'BIGINT', 'j049t_tipo_marco', 'CO_TIPO_MARCO', false, null);

		$tMap->addColumn('TX_TITULO', 'TxTitulo', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_DESCRIPCION', 'TxDescripcion', 'VARCHAR', false, 255);

		$tMap->addColumn('TX_REVISION', 'TxRevision', 'BIGINT', false, null);

		$tMap->addForeignKey('CO_ESTADO', 'CoEstado', 'BIGINT', 'j048t_estado_documento', 'CO_ESTADO_DOCUMENTO', false, null);

		$tMap->addColumn('FE_APRUEBA1', 'FeAprueba1', 'DATE', false, null);

		$tMap->addForeignKey('CO_APRUEBA1', 'CoAprueba1', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addColumn('FE_APRUEBA2', 'FeAprueba2', 'DATE', false, null);

		$tMap->addForeignKey('CO_APRUEBA2', 'CoAprueba2', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addColumn('FE_ELIMINA1', 'FeElimina1', 'DATE', false, null);

		$tMap->addForeignKey('CO_ELIMINA1', 'CoElimina1', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addColumn('FE_ELIMINA2', 'FeElimina2', 'DATE', false, null);

		$tMap->addForeignKey('CO_ELIMINA2', 'CoElimina2', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addColumn('TX_OBSERVACIONES', 'TxObservaciones', 'LONGVARCHAR', false, null);

		$tMap->addColumn('CREATED_AT', 'CreatedAt', 'DATE', false, null);

		$tMap->addColumn('UPDATE_AT', 'UpdateAt', 'TIMESTAMP', false, null);

		$tMap->addForeignKey('CO_USUARIO_CREATED', 'CoUsuarioCreated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

		$tMap->addForeignKey('CO_USUARIO_UPDATED', 'CoUsuarioUpdated', 'BIGINT', 'j002t_usuario', 'CO_USUARIO', false, null);

	} // doBuild()

} // J047tDocumentoNormativoMapBuilder
