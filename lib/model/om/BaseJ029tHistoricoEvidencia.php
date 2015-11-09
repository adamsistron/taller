<?php

/**
 * Base class that represents a row from the 'j029t_historico_evidencia' table.
 *
 * 
 *
 * This class was autogenerated by Propel 1.3.0-dev on:
 *
 * Mon Nov  9 14:57:52 2015
 *
 * @package    lib.model.om
 */
abstract class BaseJ029tHistoricoEvidencia extends BaseObject  implements Persistent {


  const PEER = 'J029tHistoricoEvidenciaPeer';

	/**
	 * The Peer class.
	 * Instance provides a convenient way of calling static methods on a class
	 * that calling code may not be able to identify.
	 * @var        J029tHistoricoEvidenciaPeer
	 */
	protected static $peer;

	/**
	 * The value for the co_historico_evidencia field.
	 * @var        string
	 */
	protected $co_historico_evidencia;

	/**
	 * The value for the co_evidencia field.
	 * @var        string
	 */
	protected $co_evidencia;

	/**
	 * The value for the fe_cambio_estado field.
	 * @var        string
	 */
	protected $fe_cambio_estado;

	/**
	 * The value for the co_cambia_estado field.
	 * @var        string
	 */
	protected $co_cambia_estado;

	/**
	 * The value for the tx_estado_anterior field.
	 * @var        string
	 */
	protected $tx_estado_anterior;

	/**
	 * The value for the tx_lugar_anterior field.
	 * @var        string
	 */
	protected $tx_lugar_anterior;

	/**
	 * The value for the tx_custodio_anterior field.
	 * @var        string
	 */
	protected $tx_custodio_anterior;

	/**
	 * The value for the tx_repositorio_anterior field.
	 * @var        string
	 */
	protected $tx_repositorio_anterior;

	/**
	 * The value for the tx_observaciones field.
	 * @var        string
	 */
	protected $tx_observaciones;

	/**
	 * The value for the update_at field.
	 * @var        string
	 */
	protected $update_at;

	/**
	 * The value for the id field.
	 * @var        int
	 */
	protected $id;

	/**
	 * Flag to prevent endless save loop, if this object is referenced
	 * by another object which falls in this transaction.
	 * @var        boolean
	 */
	protected $alreadyInSave = false;

	/**
	 * Flag to prevent endless validation loop, if this object is referenced
	 * by another object which falls in this transaction.
	 * @var        boolean
	 */
	protected $alreadyInValidation = false;

	/**
	 * Initializes internal state of BaseJ029tHistoricoEvidencia object.
	 * @see        applyDefaults()
	 */
	public function __construct()
	{
		parent::__construct();
		$this->applyDefaultValues();
	}

	/**
	 * Applies default values to this object.
	 * This method should be called from the object's constructor (or
	 * equivalent initialization method).
	 * @see        __construct()
	 */
	public function applyDefaultValues()
	{
	}

	/**
	 * Get the [co_historico_evidencia] column value.
	 * 
	 * @return     string
	 */
	public function getCoHistoricoEvidencia()
	{
		return $this->co_historico_evidencia;
	}

	/**
	 * Get the [co_evidencia] column value.
	 * 
	 * @return     string
	 */
	public function getCoEvidencia()
	{
		return $this->co_evidencia;
	}

	/**
	 * Get the [optionally formatted] temporal [fe_cambio_estado] column value.
	 * 
	 *
	 * @param      string $format The date/time format string (either date()-style or strftime()-style).
	 *							If format is NULL, then the raw DateTime object will be returned.
	 * @return     mixed Formatted date/time value as string or DateTime object (if format is NULL), NULL if column is NULL
	 * @throws     PropelException - if unable to parse/validate the date/time value.
	 */
	public function getFeCambioEstado($format = 'Y-m-d')
	{
		if ($this->fe_cambio_estado === null) {
			return null;
		}



		try {
			$dt = new DateTime($this->fe_cambio_estado);
		} catch (Exception $x) {
			throw new PropelException("Internally stored date/time/timestamp value could not be converted to DateTime: " . var_export($this->fe_cambio_estado, true), $x);
		}

		if ($format === null) {
			// Because propel.useDateTimeClass is TRUE, we return a DateTime object.
			return $dt;
		} elseif (strpos($format, '%') !== false) {
			return strftime($format, $dt->format('U'));
		} else {
			return $dt->format($format);
		}
	}

	/**
	 * Get the [co_cambia_estado] column value.
	 * 
	 * @return     string
	 */
	public function getCoCambiaEstado()
	{
		return $this->co_cambia_estado;
	}

	/**
	 * Get the [tx_estado_anterior] column value.
	 * 
	 * @return     string
	 */
	public function getTxEstadoAnterior()
	{
		return $this->tx_estado_anterior;
	}

	/**
	 * Get the [tx_lugar_anterior] column value.
	 * 
	 * @return     string
	 */
	public function getTxLugarAnterior()
	{
		return $this->tx_lugar_anterior;
	}

	/**
	 * Get the [tx_custodio_anterior] column value.
	 * 
	 * @return     string
	 */
	public function getTxCustodioAnterior()
	{
		return $this->tx_custodio_anterior;
	}

	/**
	 * Get the [tx_repositorio_anterior] column value.
	 * 
	 * @return     string
	 */
	public function getTxRepositorioAnterior()
	{
		return $this->tx_repositorio_anterior;
	}

	/**
	 * Get the [tx_observaciones] column value.
	 * 
	 * @return     string
	 */
	public function getTxObservaciones()
	{
		return $this->tx_observaciones;
	}

	/**
	 * Get the [optionally formatted] temporal [update_at] column value.
	 * 
	 *
	 * @param      string $format The date/time format string (either date()-style or strftime()-style).
	 *							If format is NULL, then the raw DateTime object will be returned.
	 * @return     mixed Formatted date/time value as string or DateTime object (if format is NULL), NULL if column is NULL
	 * @throws     PropelException - if unable to parse/validate the date/time value.
	 */
	public function getUpdateAt($format = 'Y-m-d H:i:s')
	{
		if ($this->update_at === null) {
			return null;
		}



		try {
			$dt = new DateTime($this->update_at);
		} catch (Exception $x) {
			throw new PropelException("Internally stored date/time/timestamp value could not be converted to DateTime: " . var_export($this->update_at, true), $x);
		}

		if ($format === null) {
			// Because propel.useDateTimeClass is TRUE, we return a DateTime object.
			return $dt;
		} elseif (strpos($format, '%') !== false) {
			return strftime($format, $dt->format('U'));
		} else {
			return $dt->format($format);
		}
	}

	/**
	 * Get the [id] column value.
	 * 
	 * @return     int
	 */
	public function getId()
	{
		return $this->id;
	}

	/**
	 * Set the value of [co_historico_evidencia] column.
	 * 
	 * @param      string $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setCoHistoricoEvidencia($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->co_historico_evidencia !== $v) {
			$this->co_historico_evidencia = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::CO_HISTORICO_EVIDENCIA;
		}

		return $this;
	} // setCoHistoricoEvidencia()

	/**
	 * Set the value of [co_evidencia] column.
	 * 
	 * @param      string $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setCoEvidencia($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->co_evidencia !== $v) {
			$this->co_evidencia = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::CO_EVIDENCIA;
		}

		return $this;
	} // setCoEvidencia()

	/**
	 * Sets the value of [fe_cambio_estado] column to a normalized version of the date/time value specified.
	 * 
	 * @param      mixed $v string, integer (timestamp), or DateTime value.  Empty string will
	 *						be treated as NULL for temporal objects.
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setFeCambioEstado($v)
	{
		// we treat '' as NULL for temporal objects because DateTime('') == DateTime('now')
		// -- which is unexpected, to say the least.
		if ($v === null || $v === '') {
			$dt = null;
		} elseif ($v instanceof DateTime) {
			$dt = $v;
		} else {
			// some string/numeric value passed; we normalize that so that we can
			// validate it.
			try {
				if (is_numeric($v)) { // if it's a unix timestamp
					$dt = new DateTime('@'.$v, new DateTimeZone('UTC'));
					// We have to explicitly specify and then change the time zone because of a
					// DateTime bug: http://bugs.php.net/bug.php?id=43003
					$dt->setTimeZone(new DateTimeZone(date_default_timezone_get()));
				} else {
					$dt = new DateTime($v);
				}
			} catch (Exception $x) {
				throw new PropelException('Error parsing date/time value: ' . var_export($v, true), $x);
			}
		}

		if ( $this->fe_cambio_estado !== null || $dt !== null ) {
			// (nested ifs are a little easier to read in this case)

			$currNorm = ($this->fe_cambio_estado !== null && $tmpDt = new DateTime($this->fe_cambio_estado)) ? $tmpDt->format('Y-m-d') : null;
			$newNorm = ($dt !== null) ? $dt->format('Y-m-d') : null;

			if ( ($currNorm !== $newNorm) // normalized values don't match 
					)
			{
				$this->fe_cambio_estado = ($dt ? $dt->format('Y-m-d') : null);
				$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::FE_CAMBIO_ESTADO;
			}
		} // if either are not null

		return $this;
	} // setFeCambioEstado()

	/**
	 * Set the value of [co_cambia_estado] column.
	 * 
	 * @param      string $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setCoCambiaEstado($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->co_cambia_estado !== $v) {
			$this->co_cambia_estado = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::CO_CAMBIA_ESTADO;
		}

		return $this;
	} // setCoCambiaEstado()

	/**
	 * Set the value of [tx_estado_anterior] column.
	 * 
	 * @param      string $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setTxEstadoAnterior($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->tx_estado_anterior !== $v) {
			$this->tx_estado_anterior = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::TX_ESTADO_ANTERIOR;
		}

		return $this;
	} // setTxEstadoAnterior()

	/**
	 * Set the value of [tx_lugar_anterior] column.
	 * 
	 * @param      string $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setTxLugarAnterior($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->tx_lugar_anterior !== $v) {
			$this->tx_lugar_anterior = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::TX_LUGAR_ANTERIOR;
		}

		return $this;
	} // setTxLugarAnterior()

	/**
	 * Set the value of [tx_custodio_anterior] column.
	 * 
	 * @param      string $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setTxCustodioAnterior($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->tx_custodio_anterior !== $v) {
			$this->tx_custodio_anterior = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::TX_CUSTODIO_ANTERIOR;
		}

		return $this;
	} // setTxCustodioAnterior()

	/**
	 * Set the value of [tx_repositorio_anterior] column.
	 * 
	 * @param      string $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setTxRepositorioAnterior($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->tx_repositorio_anterior !== $v) {
			$this->tx_repositorio_anterior = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::TX_REPOSITORIO_ANTERIOR;
		}

		return $this;
	} // setTxRepositorioAnterior()

	/**
	 * Set the value of [tx_observaciones] column.
	 * 
	 * @param      string $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setTxObservaciones($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->tx_observaciones !== $v) {
			$this->tx_observaciones = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::TX_OBSERVACIONES;
		}

		return $this;
	} // setTxObservaciones()

	/**
	 * Sets the value of [update_at] column to a normalized version of the date/time value specified.
	 * 
	 * @param      mixed $v string, integer (timestamp), or DateTime value.  Empty string will
	 *						be treated as NULL for temporal objects.
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setUpdateAt($v)
	{
		// we treat '' as NULL for temporal objects because DateTime('') == DateTime('now')
		// -- which is unexpected, to say the least.
		if ($v === null || $v === '') {
			$dt = null;
		} elseif ($v instanceof DateTime) {
			$dt = $v;
		} else {
			// some string/numeric value passed; we normalize that so that we can
			// validate it.
			try {
				if (is_numeric($v)) { // if it's a unix timestamp
					$dt = new DateTime('@'.$v, new DateTimeZone('UTC'));
					// We have to explicitly specify and then change the time zone because of a
					// DateTime bug: http://bugs.php.net/bug.php?id=43003
					$dt->setTimeZone(new DateTimeZone(date_default_timezone_get()));
				} else {
					$dt = new DateTime($v);
				}
			} catch (Exception $x) {
				throw new PropelException('Error parsing date/time value: ' . var_export($v, true), $x);
			}
		}

		if ( $this->update_at !== null || $dt !== null ) {
			// (nested ifs are a little easier to read in this case)

			$currNorm = ($this->update_at !== null && $tmpDt = new DateTime($this->update_at)) ? $tmpDt->format('Y-m-d\\TH:i:sO') : null;
			$newNorm = ($dt !== null) ? $dt->format('Y-m-d\\TH:i:sO') : null;

			if ( ($currNorm !== $newNorm) // normalized values don't match 
					)
			{
				$this->update_at = ($dt ? $dt->format('Y-m-d\\TH:i:sO') : null);
				$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::UPDATE_AT;
			}
		} // if either are not null

		return $this;
	} // setUpdateAt()

	/**
	 * Set the value of [id] column.
	 * 
	 * @param      int $v new value
	 * @return     J029tHistoricoEvidencia The current object (for fluent API support)
	 */
	public function setId($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->id !== $v) {
			$this->id = $v;
			$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::ID;
		}

		return $this;
	} // setId()

	/**
	 * Indicates whether the columns in this object are only set to default values.
	 *
	 * This method can be used in conjunction with isModified() to indicate whether an object is both
	 * modified _and_ has some values set which are non-default.
	 *
	 * @return     boolean Whether the columns in this object are only been set with default values.
	 */
	public function hasOnlyDefaultValues()
	{
			// First, ensure that we don't have any columns that have been modified which aren't default columns.
			if (array_diff($this->modifiedColumns, array())) {
				return false;
			}

		// otherwise, everything was equal, so return TRUE
		return true;
	} // hasOnlyDefaultValues()

	/**
	 * Hydrates (populates) the object variables with values from the database resultset.
	 *
	 * An offset (0-based "start column") is specified so that objects can be hydrated
	 * with a subset of the columns in the resultset rows.  This is needed, for example,
	 * for results of JOIN queries where the resultset row includes columns from two or
	 * more tables.
	 *
	 * @param      array $row The row returned by PDOStatement->fetch(PDO::FETCH_NUM)
	 * @param      int $startcol 0-based offset column which indicates which restultset column to start with.
	 * @param      boolean $rehydrate Whether this object is being re-hydrated from the database.
	 * @return     int next starting column
	 * @throws     PropelException  - Any caught Exception will be rewrapped as a PropelException.
	 */
	public function hydrate($row, $startcol = 0, $rehydrate = false)
	{
		try {

			$this->co_historico_evidencia = ($row[$startcol + 0] !== null) ? (string) $row[$startcol + 0] : null;
			$this->co_evidencia = ($row[$startcol + 1] !== null) ? (string) $row[$startcol + 1] : null;
			$this->fe_cambio_estado = ($row[$startcol + 2] !== null) ? (string) $row[$startcol + 2] : null;
			$this->co_cambia_estado = ($row[$startcol + 3] !== null) ? (string) $row[$startcol + 3] : null;
			$this->tx_estado_anterior = ($row[$startcol + 4] !== null) ? (string) $row[$startcol + 4] : null;
			$this->tx_lugar_anterior = ($row[$startcol + 5] !== null) ? (string) $row[$startcol + 5] : null;
			$this->tx_custodio_anterior = ($row[$startcol + 6] !== null) ? (string) $row[$startcol + 6] : null;
			$this->tx_repositorio_anterior = ($row[$startcol + 7] !== null) ? (string) $row[$startcol + 7] : null;
			$this->tx_observaciones = ($row[$startcol + 8] !== null) ? (string) $row[$startcol + 8] : null;
			$this->update_at = ($row[$startcol + 9] !== null) ? (string) $row[$startcol + 9] : null;
			$this->id = ($row[$startcol + 10] !== null) ? (int) $row[$startcol + 10] : null;
			$this->resetModified();

			$this->setNew(false);

			if ($rehydrate) {
				$this->ensureConsistency();
			}

			// FIXME - using NUM_COLUMNS may be clearer.
			return $startcol + 11; // 11 = J029tHistoricoEvidenciaPeer::NUM_COLUMNS - J029tHistoricoEvidenciaPeer::NUM_LAZY_LOAD_COLUMNS).

		} catch (Exception $e) {
			throw new PropelException("Error populating J029tHistoricoEvidencia object", $e);
		}
	}

	/**
	 * Checks and repairs the internal consistency of the object.
	 *
	 * This method is executed after an already-instantiated object is re-hydrated
	 * from the database.  It exists to check any foreign keys to make sure that
	 * the objects related to the current object are correct based on foreign key.
	 *
	 * You can override this method in the stub class, but you should always invoke
	 * the base method from the overridden method (i.e. parent::ensureConsistency()),
	 * in case your model changes.
	 *
	 * @throws     PropelException
	 */
	public function ensureConsistency()
	{

	} // ensureConsistency

	/**
	 * Reloads this object from datastore based on primary key and (optionally) resets all associated objects.
	 *
	 * This will only work if the object has been saved and has a valid primary key set.
	 *
	 * @param      boolean $deep (optional) Whether to also de-associated any related objects.
	 * @param      PropelPDO $con (optional) The PropelPDO connection to use.
	 * @return     void
	 * @throws     PropelException - if this object is deleted, unsaved or doesn't have pk match in db
	 */
	public function reload($deep = false, PropelPDO $con = null)
	{
		if ($this->isDeleted()) {
			throw new PropelException("Cannot reload a deleted object.");
		}

		if ($this->isNew()) {
			throw new PropelException("Cannot reload an unsaved object.");
		}

		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		// We don't need to alter the object instance pool; we're just modifying this instance
		// already in the pool.

		$stmt = J029tHistoricoEvidenciaPeer::doSelectStmt($this->buildPkeyCriteria(), $con);
		$row = $stmt->fetch(PDO::FETCH_NUM);
		$stmt->closeCursor();
		if (!$row) {
			throw new PropelException('Cannot find matching row in the database to reload object values.');
		}
		$this->hydrate($row, 0, true); // rehydrate

		if ($deep) {  // also de-associate any related objects?

		} // if (deep)
	}

	/**
	 * Removes this object from datastore and sets delete attribute.
	 *
	 * @param      PropelPDO $con
	 * @return     void
	 * @throws     PropelException
	 * @see        BaseObject::setDeleted()
	 * @see        BaseObject::isDeleted()
	 */
	public function delete(PropelPDO $con = null)
	{

    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidencia:delete:pre') as $callable)
    {
      $ret = call_user_func($callable, $this, $con);
      if ($ret)
      {
        return;
      }
    }


		if ($this->isDeleted()) {
			throw new PropelException("This object has already been deleted.");
		}

		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}
		
		$con->beginTransaction();
		try {
			J029tHistoricoEvidenciaPeer::doDelete($this, $con);
			$this->setDeleted(true);
			$con->commit();
		} catch (PropelException $e) {
			$con->rollBack();
			throw $e;
		}
	

    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidencia:delete:post') as $callable)
    {
      call_user_func($callable, $this, $con);
    }

  }
	/**
	 * Persists this object to the database.
	 *
	 * If the object is new, it inserts it; otherwise an update is performed.
	 * All modified related objects will also be persisted in the doSave()
	 * method.  This method wraps all precipitate database operations in a
	 * single transaction.
	 *
	 * @param      PropelPDO $con
	 * @return     int The number of rows affected by this insert/update and any referring fk objects' save() operations.
	 * @throws     PropelException
	 * @see        doSave()
	 */
	public function save(PropelPDO $con = null)
	{

    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidencia:save:pre') as $callable)
    {
      $affectedRows = call_user_func($callable, $this, $con);
      if (is_int($affectedRows))
      {
        return $affectedRows;
      }
    }


		if ($this->isDeleted()) {
			throw new PropelException("You cannot save an object that has been deleted.");
		}

		if ($con === null) {
			$con = Propel::getConnection(J029tHistoricoEvidenciaPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}
		
		$con->beginTransaction();
		try {
			$affectedRows = $this->doSave($con);
			$con->commit();
    foreach (sfMixer::getCallables('BaseJ029tHistoricoEvidencia:save:post') as $callable)
    {
      call_user_func($callable, $this, $con, $affectedRows);
    }

			J029tHistoricoEvidenciaPeer::addInstanceToPool($this);
			return $affectedRows;
		} catch (PropelException $e) {
			$con->rollBack();
			throw $e;
		}
	}

	/**
	 * Performs the work of inserting or updating the row in the database.
	 *
	 * If the object is new, it inserts it; otherwise an update is performed.
	 * All related objects are also updated in this method.
	 *
	 * @param      PropelPDO $con
	 * @return     int The number of rows affected by this insert/update and any referring fk objects' save() operations.
	 * @throws     PropelException
	 * @see        save()
	 */
	protected function doSave(PropelPDO $con)
	{
		$affectedRows = 0; // initialize var to track total num of affected rows
		if (!$this->alreadyInSave) {
			$this->alreadyInSave = true;

			if ($this->isNew() ) {
				$this->modifiedColumns[] = J029tHistoricoEvidenciaPeer::ID;
			}

			// If this object has been modified, then save it to the database.
			if ($this->isModified()) {
				if ($this->isNew()) {
					$pk = J029tHistoricoEvidenciaPeer::doInsert($this, $con);
					$affectedRows += 1; // we are assuming that there is only 1 row per doInsert() which
										 // should always be true here (even though technically
										 // BasePeer::doInsert() can insert multiple rows).

					$this->setId($pk);  //[IMV] update autoincrement primary key

					$this->setNew(false);
				} else {
					$affectedRows += J029tHistoricoEvidenciaPeer::doUpdate($this, $con);
				}

				$this->resetModified(); // [HL] After being saved an object is no longer 'modified'
			}

			$this->alreadyInSave = false;

		}
		return $affectedRows;
	} // doSave()

	/**
	 * Array of ValidationFailed objects.
	 * @var        array ValidationFailed[]
	 */
	protected $validationFailures = array();

	/**
	 * Gets any ValidationFailed objects that resulted from last call to validate().
	 *
	 *
	 * @return     array ValidationFailed[]
	 * @see        validate()
	 */
	public function getValidationFailures()
	{
		return $this->validationFailures;
	}

	/**
	 * Validates the objects modified field values and all objects related to this table.
	 *
	 * If $columns is either a column name or an array of column names
	 * only those columns are validated.
	 *
	 * @param      mixed $columns Column name or an array of column names.
	 * @return     boolean Whether all columns pass validation.
	 * @see        doValidate()
	 * @see        getValidationFailures()
	 */
	public function validate($columns = null)
	{
		$res = $this->doValidate($columns);
		if ($res === true) {
			$this->validationFailures = array();
			return true;
		} else {
			$this->validationFailures = $res;
			return false;
		}
	}

	/**
	 * This function performs the validation work for complex object models.
	 *
	 * In addition to checking the current object, all related objects will
	 * also be validated.  If all pass then <code>true</code> is returned; otherwise
	 * an aggreagated array of ValidationFailed objects will be returned.
	 *
	 * @param      array $columns Array of column names to validate.
	 * @return     mixed <code>true</code> if all validations pass; array of <code>ValidationFailed</code> objets otherwise.
	 */
	protected function doValidate($columns = null)
	{
		if (!$this->alreadyInValidation) {
			$this->alreadyInValidation = true;
			$retval = null;

			$failureMap = array();


			if (($retval = J029tHistoricoEvidenciaPeer::doValidate($this, $columns)) !== true) {
				$failureMap = array_merge($failureMap, $retval);
			}



			$this->alreadyInValidation = false;
		}

		return (!empty($failureMap) ? $failureMap : true);
	}

	/**
	 * Retrieves a field from the object by name passed in as a string.
	 *
	 * @param      string $name name
	 * @param      string $type The type of fieldname the $name is of:
	 *                     one of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME
	 *                     BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM
	 * @return     mixed Value of field.
	 */
	public function getByName($name, $type = BasePeer::TYPE_PHPNAME)
	{
		$pos = J029tHistoricoEvidenciaPeer::translateFieldName($name, $type, BasePeer::TYPE_NUM);
		$field = $this->getByPosition($pos);
		return $field;
	}

	/**
	 * Retrieves a field from the object by Position as specified in the xml schema.
	 * Zero-based.
	 *
	 * @param      int $pos position in xml schema
	 * @return     mixed Value of field at $pos
	 */
	public function getByPosition($pos)
	{
		switch($pos) {
			case 0:
				return $this->getCoHistoricoEvidencia();
				break;
			case 1:
				return $this->getCoEvidencia();
				break;
			case 2:
				return $this->getFeCambioEstado();
				break;
			case 3:
				return $this->getCoCambiaEstado();
				break;
			case 4:
				return $this->getTxEstadoAnterior();
				break;
			case 5:
				return $this->getTxLugarAnterior();
				break;
			case 6:
				return $this->getTxCustodioAnterior();
				break;
			case 7:
				return $this->getTxRepositorioAnterior();
				break;
			case 8:
				return $this->getTxObservaciones();
				break;
			case 9:
				return $this->getUpdateAt();
				break;
			case 10:
				return $this->getId();
				break;
			default:
				return null;
				break;
		} // switch()
	}

	/**
	 * Exports the object as an array.
	 *
	 * You can specify the key type of the array by passing one of the class
	 * type constants.
	 *
	 * @param      string $keyType (optional) One of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME
	 *                        BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM. Defaults to BasePeer::TYPE_PHPNAME.
	 * @param      boolean $includeLazyLoadColumns (optional) Whether to include lazy loaded columns.  Defaults to TRUE.
	 * @return     an associative array containing the field names (as keys) and field values
	 */
	public function toArray($keyType = BasePeer::TYPE_PHPNAME, $includeLazyLoadColumns = true)
	{
		$keys = J029tHistoricoEvidenciaPeer::getFieldNames($keyType);
		$result = array(
			$keys[0] => $this->getCoHistoricoEvidencia(),
			$keys[1] => $this->getCoEvidencia(),
			$keys[2] => $this->getFeCambioEstado(),
			$keys[3] => $this->getCoCambiaEstado(),
			$keys[4] => $this->getTxEstadoAnterior(),
			$keys[5] => $this->getTxLugarAnterior(),
			$keys[6] => $this->getTxCustodioAnterior(),
			$keys[7] => $this->getTxRepositorioAnterior(),
			$keys[8] => $this->getTxObservaciones(),
			$keys[9] => $this->getUpdateAt(),
			$keys[10] => $this->getId(),
		);
		return $result;
	}

	/**
	 * Sets a field from the object by name passed in as a string.
	 *
	 * @param      string $name peer name
	 * @param      mixed $value field value
	 * @param      string $type The type of fieldname the $name is of:
	 *                     one of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME
	 *                     BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM
	 * @return     void
	 */
	public function setByName($name, $value, $type = BasePeer::TYPE_PHPNAME)
	{
		$pos = J029tHistoricoEvidenciaPeer::translateFieldName($name, $type, BasePeer::TYPE_NUM);
		return $this->setByPosition($pos, $value);
	}

	/**
	 * Sets a field from the object by Position as specified in the xml schema.
	 * Zero-based.
	 *
	 * @param      int $pos position in xml schema
	 * @param      mixed $value field value
	 * @return     void
	 */
	public function setByPosition($pos, $value)
	{
		switch($pos) {
			case 0:
				$this->setCoHistoricoEvidencia($value);
				break;
			case 1:
				$this->setCoEvidencia($value);
				break;
			case 2:
				$this->setFeCambioEstado($value);
				break;
			case 3:
				$this->setCoCambiaEstado($value);
				break;
			case 4:
				$this->setTxEstadoAnterior($value);
				break;
			case 5:
				$this->setTxLugarAnterior($value);
				break;
			case 6:
				$this->setTxCustodioAnterior($value);
				break;
			case 7:
				$this->setTxRepositorioAnterior($value);
				break;
			case 8:
				$this->setTxObservaciones($value);
				break;
			case 9:
				$this->setUpdateAt($value);
				break;
			case 10:
				$this->setId($value);
				break;
		} // switch()
	}

	/**
	 * Populates the object using an array.
	 *
	 * This is particularly useful when populating an object from one of the
	 * request arrays (e.g. $_POST).  This method goes through the column
	 * names, checking to see whether a matching key exists in populated
	 * array. If so the setByName() method is called for that column.
	 *
	 * You can specify the key type of the array by additionally passing one
	 * of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME,
	 * BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM.
	 * The default key type is the column's phpname (e.g. 'AuthorId')
	 *
	 * @param      array  $arr     An array to populate the object from.
	 * @param      string $keyType The type of keys the array uses.
	 * @return     void
	 */
	public function fromArray($arr, $keyType = BasePeer::TYPE_PHPNAME)
	{
		$keys = J029tHistoricoEvidenciaPeer::getFieldNames($keyType);

		if (array_key_exists($keys[0], $arr)) $this->setCoHistoricoEvidencia($arr[$keys[0]]);
		if (array_key_exists($keys[1], $arr)) $this->setCoEvidencia($arr[$keys[1]]);
		if (array_key_exists($keys[2], $arr)) $this->setFeCambioEstado($arr[$keys[2]]);
		if (array_key_exists($keys[3], $arr)) $this->setCoCambiaEstado($arr[$keys[3]]);
		if (array_key_exists($keys[4], $arr)) $this->setTxEstadoAnterior($arr[$keys[4]]);
		if (array_key_exists($keys[5], $arr)) $this->setTxLugarAnterior($arr[$keys[5]]);
		if (array_key_exists($keys[6], $arr)) $this->setTxCustodioAnterior($arr[$keys[6]]);
		if (array_key_exists($keys[7], $arr)) $this->setTxRepositorioAnterior($arr[$keys[7]]);
		if (array_key_exists($keys[8], $arr)) $this->setTxObservaciones($arr[$keys[8]]);
		if (array_key_exists($keys[9], $arr)) $this->setUpdateAt($arr[$keys[9]]);
		if (array_key_exists($keys[10], $arr)) $this->setId($arr[$keys[10]]);
	}

	/**
	 * Build a Criteria object containing the values of all modified columns in this object.
	 *
	 * @return     Criteria The Criteria object containing all modified values.
	 */
	public function buildCriteria()
	{
		$criteria = new Criteria(J029tHistoricoEvidenciaPeer::DATABASE_NAME);

		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::CO_HISTORICO_EVIDENCIA)) $criteria->add(J029tHistoricoEvidenciaPeer::CO_HISTORICO_EVIDENCIA, $this->co_historico_evidencia);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::CO_EVIDENCIA)) $criteria->add(J029tHistoricoEvidenciaPeer::CO_EVIDENCIA, $this->co_evidencia);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::FE_CAMBIO_ESTADO)) $criteria->add(J029tHistoricoEvidenciaPeer::FE_CAMBIO_ESTADO, $this->fe_cambio_estado);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::CO_CAMBIA_ESTADO)) $criteria->add(J029tHistoricoEvidenciaPeer::CO_CAMBIA_ESTADO, $this->co_cambia_estado);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::TX_ESTADO_ANTERIOR)) $criteria->add(J029tHistoricoEvidenciaPeer::TX_ESTADO_ANTERIOR, $this->tx_estado_anterior);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::TX_LUGAR_ANTERIOR)) $criteria->add(J029tHistoricoEvidenciaPeer::TX_LUGAR_ANTERIOR, $this->tx_lugar_anterior);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::TX_CUSTODIO_ANTERIOR)) $criteria->add(J029tHistoricoEvidenciaPeer::TX_CUSTODIO_ANTERIOR, $this->tx_custodio_anterior);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::TX_REPOSITORIO_ANTERIOR)) $criteria->add(J029tHistoricoEvidenciaPeer::TX_REPOSITORIO_ANTERIOR, $this->tx_repositorio_anterior);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::TX_OBSERVACIONES)) $criteria->add(J029tHistoricoEvidenciaPeer::TX_OBSERVACIONES, $this->tx_observaciones);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::UPDATE_AT)) $criteria->add(J029tHistoricoEvidenciaPeer::UPDATE_AT, $this->update_at);
		if ($this->isColumnModified(J029tHistoricoEvidenciaPeer::ID)) $criteria->add(J029tHistoricoEvidenciaPeer::ID, $this->id);

		return $criteria;
	}

	/**
	 * Builds a Criteria object containing the primary key for this object.
	 *
	 * Unlike buildCriteria() this method includes the primary key values regardless
	 * of whether or not they have been modified.
	 *
	 * @return     Criteria The Criteria object containing value(s) for primary key(s).
	 */
	public function buildPkeyCriteria()
	{
		$criteria = new Criteria(J029tHistoricoEvidenciaPeer::DATABASE_NAME);

		$criteria->add(J029tHistoricoEvidenciaPeer::ID, $this->id);

		return $criteria;
	}

	/**
	 * Returns the primary key for this object (row).
	 * @return     int
	 */
	public function getPrimaryKey()
	{
		return $this->getId();
	}

	/**
	 * Generic method to set the primary key (id column).
	 *
	 * @param      int $key Primary key.
	 * @return     void
	 */
	public function setPrimaryKey($key)
	{
		$this->setId($key);
	}

	/**
	 * Sets contents of passed object to values from current object.
	 *
	 * If desired, this method can also make copies of all associated (fkey referrers)
	 * objects.
	 *
	 * @param      object $copyObj An object of J029tHistoricoEvidencia (or compatible) type.
	 * @param      boolean $deepCopy Whether to also copy all rows that refer (by fkey) to the current row.
	 * @throws     PropelException
	 */
	public function copyInto($copyObj, $deepCopy = false)
	{

		$copyObj->setCoHistoricoEvidencia($this->co_historico_evidencia);

		$copyObj->setCoEvidencia($this->co_evidencia);

		$copyObj->setFeCambioEstado($this->fe_cambio_estado);

		$copyObj->setCoCambiaEstado($this->co_cambia_estado);

		$copyObj->setTxEstadoAnterior($this->tx_estado_anterior);

		$copyObj->setTxLugarAnterior($this->tx_lugar_anterior);

		$copyObj->setTxCustodioAnterior($this->tx_custodio_anterior);

		$copyObj->setTxRepositorioAnterior($this->tx_repositorio_anterior);

		$copyObj->setTxObservaciones($this->tx_observaciones);

		$copyObj->setUpdateAt($this->update_at);


		$copyObj->setNew(true);

		$copyObj->setId(NULL); // this is a auto-increment column, so set to default value

	}

	/**
	 * Makes a copy of this object that will be inserted as a new row in table when saved.
	 * It creates a new object filling in the simple attributes, but skipping any primary
	 * keys that are defined for the table.
	 *
	 * If desired, this method can also make copies of all associated (fkey referrers)
	 * objects.
	 *
	 * @param      boolean $deepCopy Whether to also copy all rows that refer (by fkey) to the current row.
	 * @return     J029tHistoricoEvidencia Clone of current object.
	 * @throws     PropelException
	 */
	public function copy($deepCopy = false)
	{
		// we use get_class(), because this might be a subclass
		$clazz = get_class($this);
		$copyObj = new $clazz();
		$this->copyInto($copyObj, $deepCopy);
		return $copyObj;
	}

	/**
	 * Returns a peer instance associated with this om.
	 *
	 * Since Peer classes are not to have any instance attributes, this method returns the
	 * same instance for all member of this class. The method could therefore
	 * be static, but this would prevent one from overriding the behavior.
	 *
	 * @return     J029tHistoricoEvidenciaPeer
	 */
	public function getPeer()
	{
		if (self::$peer === null) {
			self::$peer = new J029tHistoricoEvidenciaPeer();
		}
		return self::$peer;
	}

	/**
	 * Resets all collections of referencing foreign keys.
	 *
	 * This method is a user-space workaround for PHP's inability to garbage collect objects
	 * with circular references.  This is currently necessary when using Propel in certain
	 * daemon or large-volumne/high-memory operations.
	 *
	 * @param      boolean $deep Whether to also clear the references on all associated objects.
	 */
	public function clearAllReferences($deep = false)
	{
		if ($deep) {
		} // if ($deep)

	}


  public function __call($method, $arguments)
  {
    if (!$callable = sfMixer::getCallable('BaseJ029tHistoricoEvidencia:'.$method))
    {
      throw new sfException(sprintf('Call to undefined method BaseJ029tHistoricoEvidencia::%s', $method));
    }

    array_unshift($arguments, $this);

    return call_user_func_array($callable, $arguments);
  }


} // BaseJ029tHistoricoEvidencia
