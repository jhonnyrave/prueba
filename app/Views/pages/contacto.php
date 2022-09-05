

<div class="container-fluid top">
    <div class="row">
      <form id="contacto" 
      class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6" method="post"
      action="<?= base_url() ?>/contacto/create">
      <div class="form-group">
          <label>Nombre:</label>
          <input name="nombre" type="text" class="form-control" error="El campo Nombre no es valido" id="nombCont" placeholder="Nombre" required>
        </div>
        <div class="form-group">
          <label>Apellido:</label>
          <input name="apellido" type="text" class="form-control" error="El campo Apellido no es valido" id="apellCont" placeholder="Apellido" required>
        </div>
      <div class="form-group">
          <label>Correo Electronico:</label>
          <input name="correo" type="email" class="form-control" error="El campo Correo Electronico no es valido" id="emailCont" placeholder="usuario@email.com" required>
        </div>
        
        <div class="form-group">
          <label>Celular:</label>
          <input name="celCont" type="text" class="form-control" error="El campo Celular no es valido" id="celCont" placeholder="Celular" required>
        </div>
        <div class="form-group">
          <label>Area:</label>
          <select class="form-control" name="area" id="area" required>
          <option value = "">Seleccione</option>
          <?php foreach ($area as $a): ?>
            <option value = <?= esc($a['id']) ?>><?= esc($a['area']) ?></option>
            <?php endforeach ?>
        </select>
         
        </div>
        <div class="form-group">
          <label>Mensaje:</label>
          <textarea name="mensaje" style="resize: none" class="form-control" id="mensaje" rows="3" required></textarea>
        </div>
        <button type="submit" id="botonCont" class="btn btn-primary">Enviar</button>
        <?php  if (isset($error)) {?>
                  <div class="alert alert-danger">
                    <?php echo $error; ?>
                 </div>
        <?php } ?>

        <?php  if (isset($success)) {?>
                  <div class="alert alert-success">
                    <?php echo $success; ?>
                 </div>
        <?php } ?>
      </form>
    </div>
  </div>