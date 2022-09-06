import React from "react";
import Button from "react-bootstrap/Button";
import Form from "react-bootstrap/Form";
import { useState, useEffect } from "react";

function Formulario() {
  const [areas, setAreas] = useState([]);
  const [nombre, setNombre] = useState("");
  const [apellido, setApellido] = useState("");
  const [correo, setCorreo] = useState("");
  const [celular, setCelular] = useState("");
  const [area, setArea] = useState("");
  const [mensaje, setMensaje] = useState("");
  const [alerta, setAlerta] = useState(false);

  const API = 'http://localhost/formulario_contacto/backend/public/api/areas';
  const fetchApi = () => {
    fetch(API)
    .then((res) => res.json())
    .then((data) => {
      console.log(data)
      setAreas(data)
    })
  }

  useEffect(() => {
    fetchApi()
  }, [])

  let handleSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append("nombre" , nombre);
    formData.append("apellido" , apellido);
    formData.append("correo" , correo);
    formData.append("celular" , celular);
    formData.append("area" , area);
    formData.append("mensaje" , mensaje);

    try {
      let res = await fetch("http://localhost/formulario_contacto/backend/public/api/contacto", {
        method: "POST",
        body: formData
        })
        let response = await res.json();
        if (res.status === 200) {
          setNombre("");
          setApellido("");
          setCorreo("");
          setCelular("");
          setArea("");
          setMensaje("");
          setAlerta(false);
        } else {
          setAlerta(true);
        }
    } catch (err) {
      setAlerta(true);
    }
  };

  return (
    <Form className="mx-auto w-50" onSubmit={handleSubmit}>
      <Form.Group className="mb-3" controlId="formNombre">
        <Form.Label>Nombre</Form.Label>
        <Form.Control type="text" placeholder="Nombre" value={nombre} onChange={(e) => setNombre(e.target.value)} required/> 
      </Form.Group>

      <Form.Group className="mb-3" controlId="formApellido">
        <Form.Label>Apellido</Form.Label>
        <Form.Control type="text" placeholder="Apellido" value={apellido} onChange={(e) => setApellido(e.target.value)} required/>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formEmail">
        <Form.Label>Correo</Form.Label>
        <Form.Control type="email" placeholder="Email" value={correo} onChange={(e) => setCorreo(e.target.value)} required/>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formCelular">
        <Form.Label>Celular</Form.Label>
        <Form.Control type="number" placeholder="Celular" value={celular} onChange={(e) => setCelular(e.target.value)} required/>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formArea">
        <Form.Label>Area de contacto</Form.Label>
        <Form.Select value={area} onChange={(e) => setArea(e.target.value)} required>
          <option selected disabled value="">Seleccione un area</option>
          {areas.map((option) => (
              <option key={option.id} value={option.id}>{option.area}</option>
          ))}
        </Form.Select>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formMensaje">
        <Form.Label>Mensaje</Form.Label>
        <Form.Control as="textarea" rows={3} value={mensaje} onChange={(e) => setMensaje(e.target.value)} required/>
      </Form.Group>

      <Button variant="primary" type="submit">
        Enviar
      </Button>
      {alerta ? <div className="bg-danger text-white"><p>Error al enviar los datos</p></div> : null }
    </Form>
  );
}

export default Formulario;
 