<?php 
namespace App\Models;

use CodeIgniter\Model;

class AreaModel extends Model{

    protected $table      = 'area';
   
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['area', 'estado'];

    protected $useTimestamps = false;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    protected $validationRules    = [];
    protected $validationMessages = [];
    protected $skipValidation     = false;

    public function getArea($estado = 'A')
    {
        return $this->where(['estado' => $estado])->findAll();
    }

}