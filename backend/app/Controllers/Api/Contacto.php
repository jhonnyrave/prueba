<?php 
namespace App\Controllers\Api;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\ContactoModel;

class Contacto extends ResourceController{

    use ResponseTrait;
    
    public function index()
    {
        $model = new AreaModel();
        $data = $model->findAll();
        return $this->respond($data, 200);
    }

    public function create()
    {
        $model = new ContactoModel();
        $data = [
            'nombre' => $this->request->getPost('nombre'),
            'apellido' => $this->request->getPost('apellido'),
            'correo' => $this->request->getPost('correo'),
            'celular' => $this->request->getPost('celular'),
            'id_area' => $this->request->getPost('area'),
            'mensaje' => $this->request->getPost('mensaje')
        ];
        $model->insert($data);
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'success' => 'Data Saved'
            ]
        ];    
        return $this->respond($response);       
    }
}