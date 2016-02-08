using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Web;
using System.Data;
using RedSocialEntity;
using RedSocialData;
using System.Transactions;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            publicacion.FechaDesde = cursor.GetString(cursor.GetOrdinal("FechaDesde"));
             publicacion.FechaHasta = cursor.GetString(cursor.GetOrdinal("FechaHasta"));
            //publicacion.FechaHasta = cursor.GetDateTime(cursor.GetOrdinal("FechaHasta"));
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
                        comando.Parameters["@PrecioS"].Value = publicacion.PrecioS;
                        comando.Parameters["@PrecioM"].Value = publicacion.PecioM;
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

        public void BuscarPublicacion(GridView GridView1, string SearchWord, int id_usr)
        {
            String strConnString = ConfigurationManager.ConnectionStrings["ConexionRedSocial"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "BuscarPublicacion";
            cmd.Parameters.Add("@id_usr", SqlDbType.Int).Value = id_usr;
            cmd.Parameters.Add("@SearchWord", SqlDbType.Text).Value = SearchWord.Trim();
            cmd.Connection = con;
            try
            {
                con.Open();
                GridView1.EmptyDataText = "No hay productos publicados que se ajusten a tu busqueda. Intentá de nuevo.";
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        public void VerMisPublicaciones(GridView GridView3, int Id_usr)
        {
            String strConnString = ConfigurationManager.ConnectionStrings["ConexionRedSocial"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "MisPublicaciones";
            cmd.Parameters.Add("@id_usr", SqlDbType.Int).Value = Id_usr;


            cmd.Connection = con;
            try
            {
                con.Open();
                GridView3.EmptyDataText = "Usted no posee ningun producto publicado";
                GridView3.DataSource = cmd.ExecuteReader();
                GridView3.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        public void Modificar(PublicacionEntity publicacion)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("Modificar_Publicacion", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);


                        comando.Parameters["@Id_publicacion"].Value = publicacion.Id_publicacion;
                        comando.Parameters["@Titulo"].Value = publicacion.Titulo.Trim();
                        comando.Parameters["@Descripcion"].Value = publicacion.Descripcion.Trim();
                        comando.Parameters["@PrecioD"].Value = publicacion.PrecioD;
                        comando.Parameters["@PrecioS"].Value = publicacion.PrecioS;
                        comando.Parameters["@PrecioM"].Value = publicacion.PecioM;
                        comando.Parameters["@FechaHasta"].Value = publicacion.FechaHasta;

                        comando.ExecuteNonQuery();
                        publicacion.Id_publicacion = Convert.ToInt32(comando.Parameters["@RETURN_VALUE"].Value);
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al Modificar la publicación.", ex);
            }
        }

        public void Suspender(PublicacionEntity publicacion)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("Suspender_Publicacion", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);


                        comando.Parameters["@Id_publicacion"].Value = publicacion.Id_publicacion;
                 
                        comando.ExecuteNonQuery();
                       
                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al Suspender la publicación.", ex);
            }
        }


        public void Alquilar(PublicacionEntity publicacion,AlquilerEntity alquiler)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("Alquilar", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);


                        comando.Parameters["@Id_publicacion"].Value = publicacion.Id_publicacion;
                        comando.Parameters["@id_usr_alquilador"].Value = alquiler.Id_usr;
                        comando.Parameters["@costo"].Value = alquiler.Costo;
                        comando.Parameters["@fecha_desde"].Value = alquiler.FechaDesde;
                        comando.Parameters["@fecha_hasta"].Value = alquiler.FechaHasta;

                        comando.ExecuteNonQuery();

                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al alquilar el producto.", ex);
            }
        }


        public void DatosAlquiler_Alq(UsuarioEntity alquilador, PublicacionEntity publicacion, AlquilerEntity alquiler)
        {
            try
            {
                using (SqlConnection conexion = ConexionDA.ObtenerConexion())
                {
                    using (SqlCommand comando = new SqlCommand("BuscarMisAlquieres", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        SqlCommandBuilder.DeriveParameters(comando);


                        comando.Parameters["@id_usr_alquilador"].Value = alquiler.Id_usr;
                        

                        comando.ExecuteNonQuery();

                    }

                    conexion.Close();
                }
            }
            catch (Exception ex)
            {
                throw new ExcepcionDA("Se produjo un error al alquilar el producto.", ex);
            }
        }

        public void DatosAlquiler_public(UsuarioEntity alquilador, PublicacionEntity publicacion, AlquilerEntity alquiler)
        {
            String strConnString = ConfigurationManager.ConnectionStrings["ConexionRedSocial"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "BuscarPublicacion";
            //cmd.Parameters.Add("@id_usr", SqlDbType.Int).Value = id_usr;
            //cmd.Parameters.Add("@SearchWord", SqlDbType.Text).Value = SearchWord.Trim();
            cmd.Connection = con;
            try
            {
                con.Open();
              
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }


        public void VerMisAlquilados(GridView GridView3, int Id_usr)
        {
            String strConnString = ConfigurationManager.ConnectionStrings["ConexionRedSocial"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "MisAlquilados";
            cmd.Parameters.Add("@id_usr", SqlDbType.Int).Value = Id_usr;


            cmd.Connection = con;
            try
            {
                con.Open();
                GridView3.EmptyDataText = "Usted no posee ningun producto Alquilado";
                GridView3.DataSource = cmd.ExecuteReader();
                GridView3.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        public void VerMisAlquileres(GridView GridView3, int Id_usr)
        {
            String strConnString = ConfigurationManager.ConnectionStrings["ConexionRedSocial"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "MisAlquileres";
            cmd.Parameters.Add("@id_usr", SqlDbType.Int).Value = Id_usr;


            cmd.Connection = con;
            try
            {
                con.Open();
                GridView3.EmptyDataText = "Usted no posee ningun producto publicado";
                GridView3.DataSource = cmd.ExecuteReader();
                GridView3.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        
        #endregion Métodos Públicos
    }


}
