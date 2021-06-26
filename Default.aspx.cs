using System;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Windows.Forms;

namespace SitioPrueba
{
    public partial class _Default : Page
    {
        ServicioContadorPalabras.ServicioContadorSoapClient servicio;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Se hace la conexion al servicio
                servicio = new ServicioContadorPalabras.ServicioContadorSoapClient();
            }
            catch (Exception)
            {
                MessageBox.Show("Se debe iniciar el servicio.");
            }
        }

        private void LimpiarControles()
        {
            txtTexto.Text = string.Empty;
            txtPalabra.Text = string.Empty;
        }

        protected void btnLocal_Click(object sender, EventArgs e)
        {
            try
            {
                string cadena = txtTexto.Text;
                //Este objeto me permite contar las veces que se encuentran en la cadena, no importa el tamaño de la cadena
                int total = Regex.Matches(cadena, txtPalabra.Text).Count;
                MessageBox.Show(string.Concat("La palabra a buscar es: ", txtPalabra.Text, ", y está ", total.ToString(), " veces en el texto."));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        protected void btnServicio_Click(object sender, EventArgs e)
        {
            try
            {
                string cadena = txtTexto.Text;
                string palabra = txtPalabra.Text;
                //Consumo el servicio en el cual se encuentra el contador de las palabras
                int total = servicio.ContadorDePalabras(cadena, palabra);
                MessageBox.Show(string.Concat("La palabra a buscar es: ", txtPalabra.Text, ", y está ", total.ToString(), " veces en el texto."));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            LimpiarControles();
        }
    }
}