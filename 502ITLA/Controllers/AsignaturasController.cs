using _502ITLA.Datos;
using _502ITLA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace _502ITLA.Controllers
{
    public class AsignaturasController : Controller
    {
        AsignaturaDatos _AsignaturaDatos = new AsignaturaDatos();


        public ActionResult Listar()
        {
            //LA VISTA MOSTRARÁ UNA LISTA DE CONTACTOS
            var oLista = _AsignaturaDatos.Listar();

            return View(oLista);
        }

        public ActionResult Guardar()
        {
            //METODO SOLO DEVUELVE LA VISTA
            return View();
        }

        [HttpPost]
        public ActionResult Guardar(Asignatura oasignatura)
        {
            //METODO RECIBE EL OBJETO PARA GUARDARLO EN BD
            if (!ModelState.IsValid)
                return View();


            var respuesta = _AsignaturaDatos.Guardar(oasignatura);

            if (respuesta)
                return RedirectToAction("Listar");
            else
                return View();
        }

        [HttpPost]
        public ActionResult Editar(int IdAsignatura)
        {
            //METODO SOLO DEVUELVE LA VISTA
            var oasignatura = _AsignaturaDatos.Obtener(IdAsignatura);
            return View(oasignatura);
        }

        [HttpPost]
        public ActionResult Editar(Asignatura oasignatura)
        {
            if (!ModelState.IsValid)
                return View();


            var respuesta = _AsignaturaDatos.Editar(oasignatura);

            if (respuesta)
                return RedirectToAction("Listar");
            else
                return View();
        }


        public ActionResult Eliminar(int IdAsignatura)
        {
            //METODO SOLO DEVUELVE LA VISTA
            var oasignatura = _AsignaturaDatos.Obtener(IdAsignatura);
            return View(oasignatura);
        }

        [HttpPost]
        public ActionResult Eliminar(Asignatura oasignatura)
        {

            var respuesta = _AsignaturaDatos.Eliminar(oasignatura.IdAsignatura);

            if (respuesta)
                return RedirectToAction("Listar");
            else
                return View();
        }
    }
}