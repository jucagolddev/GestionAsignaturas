package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ResultadoAprendizaje;
import util.Database;

public class ResultadoAprendizajeDAO {

    public List<ResultadoAprendizaje> listarPorAsignatura(int asignaturaId) {
        List<ResultadoAprendizaje> lista = new ArrayList<>();
        String sql = "SELECT * FROM resultados_aprendizaje WHERE asignatura_id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, asignaturaId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    lista.add(new ResultadoAprendizaje(rs.getInt("id"), rs.getString("descripcion"),
                            rs.getInt("asignatura_id")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public ResultadoAprendizaje obtenerPorId(int id) {
        ResultadoAprendizaje ra = null;
        String sql = "SELECT * FROM resultados_aprendizaje WHERE id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ra = new ResultadoAprendizaje(rs.getInt("id"), rs.getString("descripcion"),
                            rs.getInt("asignatura_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ra;
    }

    public boolean insertar(ResultadoAprendizaje ra) {
        String sql = "INSERT INTO resultados_aprendizaje (descripcion, asignatura_id) VALUES (?, ?)";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, ra.getDescripcion());
            ps.setInt(2, ra.getAsignaturaId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(ResultadoAprendizaje ra) {
        String sql = "UPDATE resultados_aprendizaje SET descripcion = ? WHERE id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, ra.getDescripcion());
            ps.setInt(2, ra.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM resultados_aprendizaje WHERE id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
