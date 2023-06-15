using System.Data.SqlClient;
using Dapper;

public static class DB
{
    private static string ConnectionString { get; set; } = @"Server=localhost;DataBase=Elecciones2023;Trusted_Connection=True;";
     public static void AgregarCandidato(Candidato can)
    {
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            db.Execute("INSERT INTO Candidato @Candidato", new {Candidato = can});
        }
    }
    public static void EliminarCandidato(int IdCandidato)
    {
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            db.Execute("DELETE * FROM Candidato WHERE IdCandidato = @IdCandidato", new {IdCandidato = IdCandidato});
        }
    }

    public static Partido VerInfoPartido(int IdPartido)
    {
        Partido partido = null;
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT * FROM Partido WHERE IdPartido = @IdPartido";
            partido = db.QueryFirstOrDefault<Partido>(sql, new {IdPartido = IdPartido});
        }
        return partido;
    }
    public static Candidato VerInfoCandidato(int IdCandidato)
    {
        Candidato candidato = null;
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT * FROM Candidato WHERE IdCandidato = @IdCandidato";
            candidato = db.QueryFirstOrDefault<Candidato>(sql, new {IdCandidato = IdCandidato});
        }
        return candidato;
    }
    public static List<Partido> ListarPartidos()
    {
        List<Partido> ListaPartidos = new List<Partido>();
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT * FROM Partido";
            ListaPartidos = db.Query<Partido>(sql).ToList();
        }
        return ListaPartidos;
    }
    public static List<Candidato> ListarCandidatos(int IdPartido)
    {
        List<Candidato> ListaCandidatos = new List<Candidato>(); 
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "SELECT * FROM Candidato WHERE IdPartido = @IdPartido";
            ListaCandidatos = db.Query<Candidato>(sql, new {IdPartido = IdPartido}).ToList();
        }
        return ListaCandidatos;
    }

}