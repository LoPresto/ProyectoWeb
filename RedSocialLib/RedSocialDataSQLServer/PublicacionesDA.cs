using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.IO;
using RedSocialEntity;
using RedSocialData;

namespace RedSocialDataSQLServer
{
    public class PublicacionesDA
    {
        public PublicacionesDA()
        {
        }
  
      #region Métodos Privados
        private PublicacionEntity CrearPublicacion(SqlDataReader cursor)
        {
            PublicacionEntity publicacion = new PublicacionEntity();
            publicacion.Id_publicacion = cursor.GetInt32(cursor.GetOrdinal("Id_publicacion"));
            publicacion.Id_usr = cursor.GetInt32(cursor.GetOrdinal("Id_usr"));
            publicacion.Titulo = cursor.GetString(cursor.GetOrdinal("Titulo"));
            publicacion.Descripcion = cursor.GetString(cursor.GetOrdinal("Descripcion"));
            publicacion.PrecioD = cursor.GetFloat(cursor.GetOrdinal("PrecioD"));
            publicacion.PrecioS = cursor.GetFloat(cursor.GetOrdinal("PrecioS"));
            publicacion.PecioM = cursor.GetFloat(cursor.GetOrdinal("PecioM"));
            publicacion.FechaDesde = cursor.GetDateTime(cursor.GetOrdinal("FechaDesde"));
            publicacion.FechaHasta = cursor.GetDateTime(cursor.GetOrdinal("FechaHasta"));
            publicacion.Alquilado = cursor.GetBoolean(cursor.GetOrdinal("Alquilado"));
            publicacion.Suspendido = cursor.GetBoolean(cursor.GetOrdinal("Suspendido"));
            publicacion.Id_publicacion = cursor.GetInt32(cursor.GetOrdinal("Id_cat_lvl3"));

            return publicacion;
        }
        #endregion Métodos Privados

        #region Métodos Públicos
        public void Insertar(PublicacionEntity publicacion)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("Insertar_Publicacion", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);

                        comando.Parameters["@Id_usr"].Value = publicacion.Id_usr;
                        comando.Parameters["@Titulo"].Value = publicacion.Titulo.Trim();
                        comando.Parameters["@Descripcion"].Value = publicacion.Descripcion.Trim();
                        comando.Parameters["@PrecioD"].Value = publicacion.PrecioD;
                        comando.Parameters["@PrecioS"].Value = publicacion.PrecioD;
                        comando.Parameters["@PrecioM"].Value = publicacion.PrecioS;
                        comando.Parameters["@FechaDesde"].Value = publicacion.FechaDesde;
                        comando.Parameters["@FechaHasta"].Value = publicacion.FechaHasta;
                        comando.Parameters["@Alquilado"].Value = publicacion.Alquilado;
                        comando.Parameters["@Suspendido"].Value = publicacion.Suspendido;
                        comando.Parameters["@Id_cat_lvl3"].Value = publicacion.Id_cat_lvl3;
                       
                        comando.ExecuteNonQuery();
                        publicacion.Id_publicacion = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al insertar la publicación.", ex);
            }
        }
        #endregion Métodos Públicos
    }


}
