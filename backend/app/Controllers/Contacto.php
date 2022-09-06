<?php 
namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\AreaModel;
use App\Models\ContactoModel;

class Contacto extends BaseController{

    protected $contacto;

    public function __construct()
    {
        $this->contacto = new ContactoModel();
    }

    public function index()
    {
        if (! is_file(APPPATH . 'Views/pages/contacto.php')) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
        }
        
        $model = model(AreaModel::class);
        $data['area'] = $model->getArea();
        $data['title'] = "Formulario de contacto"; 

        return view('templates/header', $data)
            . view('pages/contacto',$data)
            . view('templates/footer');
    }

    public function create()
    {
        $model = model(AreaModel::class);
        $area = $model->getArea();
        if ($this->request->getMethod() == "post" )
        {
            //consultar que no tenga mas de un correo en el dia
            $date1 = date('Y-m-d H:i:s');
            $date = date("Y-m-d", strtotime("+1 day", strtotime($date1))) . " 00:00:00";
            $correo = strtolower($this->request->getPost('correo'));
            $this->contacto->select('*');
            $this->contacto->where('correo', $correo);
            $this->contacto->where('created_at <=',$date);
            $datos = $this->contacto->get()->getRow();
            
            if($datos){
                $data = ['title' => 'Formulario de contacto','error' => 'No puedes enviar más de 1 mensaje al día','area' =>$area];
            }else{
                $this->contacto->insert(
                    [
                        'nombre' => $this->request->getPost('nombre'),
                        'apellido' => $this->request->getPost('apellido'),
                        'correo' => $this->request->getPost('correo'),
                        'celular' => $this->request->getPost('celular'),
                        'id_area' => $this->request->getPost('area'),
                        'mensaje' => $this->request->getPost('mensaje'),
                    ]
                );
                $data = ['title' => 'Formulario de contacto','success' => 'Datos enviados con exito','area' =>$area];
            }
            return view('templates/header', $data)
            . view('pages/contacto',$data)
            . view('templates/footer');
        }  
    }

    public function createUser()
    {
        $model = new UserModel();
        $user  = $model->save($this->request->getPost());
        // responde con cod estado 201
        return $this->respondCreated();
    }
}