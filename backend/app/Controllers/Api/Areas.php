<?php 
namespace App\Controllers\Api;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\AreaModel;

class Areas extends ResourceController{

    use ResponseTrait;
    // get all Areas
    public function index()
    {
        $model = new AreaModel();
        $data = $model->findAll();
        return $this->respond($data, 200);
    }

}