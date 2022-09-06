<div class="row d-flex justify-content-center">
  <form id="contacto" class="col-sm-12 col-md-9" method="post" action="<?=base_url()?>/contacto/create">
    <div class="form-group w-100">
      <label>Nombre</label>
      <input name="nombre" type="text" class="form-control" error="El campo nombre no es valido" id="nombCont" placeholder="Nombre" required>
    </div>
    <div class="form-group">
      <label>Apellido</label>
      <input name="apellido" type="text" class="form-control" error="El campo apellido no es valido" id="apellCont" placeholder="Apellido" required>
    </div>
    <div class="form-group">
      <label>Correo</label>
      <input name="correo" type="email" class="form-control" error="El campo correo electronico no es valido" id="emailCont" placeholder="usuario@email.com" required>
    </div>
    <div class="form-group">
      <label>Celular</label>
      <input name="celular" type="number" class="form-control" error="El campo celular no es valido" id="celular" placeholder="Celular" required>
    </div>
    <div class="form-group">
      <label>Area de contacto</label>
      <select class="form-control" name="area" id="area" required>
        <option selected disabled value="">Seleccione</option>
        <?php foreach ($area as $a): ?>
          <option value = <?= esc($a['id']) ?>><?= esc($a['area']) ?></option>
        <?php endforeach ?>
      </select> 
    </div>
    <div class="form-group">
      <label>Mensaje</label>
      <textarea name="mensaje" style="resize: none" class="form-control" id="mensaje" rows="3" required>
      </textarea>
    </div>
    <button type="submit" id="botonCont" class="btn btn-primary">Enviar</button>
    <?php if (isset($error)) {?>
      <div class="alert alert-danger">
        <?php echo $error; ?>
      </div>
    <?php } ?>
    <?php if (isset($success)) {?>
      <div class="alert alert-success">
        <?php echo $success; ?>
      </div>
    <?php } ?>
  </form>
</div>