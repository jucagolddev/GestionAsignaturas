package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CriterioEvaluacion;
import util.Database;

public class CriterioEvaluacionDAO {

    public List<CriterioEvaluacion> listarPorRA(int raId) {
        List<CriterioEvaluacion> lista = new ArrayList<>();
        String sql = "SELECT * FROM criterios_evaluacion WHERE ra_id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, raId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    lista.add(new CriterioEvaluacion(rs.getInt("id"), rs.getString("descripcion"), rs.getInt("ra_id")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public CriterioEvaluacion obtenerPorId(int id) {
        CriterioEvaluacion ce = null;
        String sql = "SELECT * FROM criterios_evaluacion WHERE id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ce = new CriterioEvaluacion(rs.getInt("id"), rs.getString("descripcion"), rs.getInt("ra_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ce;
    }

    public boolean insertar(CriterioEvaluacion ce) {
        String sql = "INSERT INTO criterios_evaluacion (descripcion, ra_id) VALUES (?, ?)";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, ce.getDescripcion());
            ps.setInt(2, ce.getRaId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(CriterioEvaluacion ce) {
        String sql = "UPDATE criterios_evaluacion SET descripcion = ? WHERE id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, ce.getDescripcion());
            ps.setInt(2, ce.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM criterios_evaluacion WHERE id = ?";
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
