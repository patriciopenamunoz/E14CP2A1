# Actividad 028 - CRUD anidado con asociación

- Para poder realizar este actividad debes haber realizado los cursos previos junto con los videos online correspondientes a la experiencia 14.

### El objetivo de esta actividad es la implementación de un CRUD anidado de Empresa, Empleados y Departamentos, donde cada Empresa puede tener N cantidad de empleados y un empleado solo puede pertenecer a 1 empresa (relación 1 a N), y cada empleado pertenece a un departamento y un departamento tiene muchos empleados (relación 1 a N).

## Ejercicio 1:

- Iniciar un nuevo proyecto en Rails 5.1

- Añadir el **CDN de Boostrap** al layout

- Añadir el **CDN de jQuery** al layout

- Crear un scaffold **Company** con el campo *name* (string)

- Revisar y correr la migración

- Crear un scaffold **Area** con el campo *name* (string)

- Revisar y correr la migración

- Convertir el *index* de *companies* en la página de inicio.

- Crear un modelo **Employee** con los campos *first_name* (string), *last_name* (string), email (string), *company:references* y *area:references*.

- Revisar y correr la migración.

- En los modelos *Company* y *Area* agregar la relación con *Employee* (**has_many**) y verificar que el modelo *Employee* se haya creado con las relaciones correctas (**belongs_to**)

    > Recordar las relaciones entre empresa - empleado y empleado - area en el enunciado.

- Crear el controller **employees**.

- Generar la ruta para la creación de un empleado asociado a una empresa.

    - Para ello modificar la ruta resources de companies que ahora recibirá un bloque y dentro crearemos la ruta que apuntará al método create de employees.
    
    ~~~ruby
    resources :employees, only: [:create]
    ~~~

- En la terminal ejecutar **rails routes** para corroborar la ruta creada. La ruta generada debe contener el **:company_id** y apuntar al método **employees#create**.

- Para poder almacenar un registro en el método create primero debemos generar el filtro de parámetros conocido como **strong params**, para ello:

    - En el controller **employees** crear el método **employee_params**. Este método debe permitir y retornar los campos necesarios para la creación de un nuevo empleado, es decir, first_name, last_name y email.

- En el controller **employees** crear el método **create**. Este método debe generar una nueva instancia de *Employee* recibiendo como argumento **employee_params** y almacenarlo en la BD. Luego redireccionar a la vista *show* de la empresa involucrada.

- En la vista *Show* de *companies* además del detalle de la empresa, se debe agregar un formulario que permita ingresar un nuevo empleado a la empresa seleccionada.

    - El formulario debe ser generado utilizando el helper *form_with* anidando los dos modelos y debe implementar las clases de bootstrap (revisar docs).

    ~~~ruby
    <%= form_with(model: [ @company, @employee ]) do |form| %>
    ~~~

    - Donde **@employee** debe ser declarado en el método correspondiente como una nueva instancia de **Employee**.

    - El formulario debe tener campos para *first_name*, *last_name*, *email*, *area*.
    
    	> Recordar que el campo area debe ser un select.

- En la vista *show*, bajo el formulario, se deben listar todos los empleados correspondientes a esa empresa en una tabla con los campos *first_name*, *last_name*, *email* y *area*.

- Junto a cada registro de empleado en la tabla se debe añadir un botón para eliminar el empleado. Para ello:

    - Agregar el método *destroy* a la ruta anidada.

     ~~~ruby
     resources :employees, only: [:create, :destroy]
     ~~~

     - Crear el método correspondiente en el controller.

     - Agregar el botón con el *method: :delete* a cada registro de empleados en la tabla.

- En la vista *Index* de *companies*: 
    - Los registros deben estar listados en una tabla (bootstrap) que contenga el nombre de la empresa y la cantidad de empleados que existe por área (**count**).

    - Al hacer click en el nombre de la empresa debe redireccionar a la vista *show* de esa empresa.

    - Cada categoría ademas debe ir acompañada de botones para *Edit* y *Destroy* utilizando la clases de bootstrap.

- En *application.html.erb*:
	- En una vista parcial, agregar un navbar (**fixed**) con bootstrap con los link para acceder al home (index de empresas), para agregar nueva empresa y para agregar nueva área.