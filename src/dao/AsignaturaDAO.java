package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Asignatura;
import util.Database;

public class AsignaturaDAO {

    public List<Asignatura> listar() {
        List<Asignatura> lista = new ArrayList<>();
        String sql = "SELECT * FROM asignaturas";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(new Asignatura(rs.getInt("id"), rs.getString("nombre"), rs.getString("codigo")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Asignatura obtenerPorId(int id) {
        Asignatura asig = null;
        String sql = "SELECT * FROM asignaturas WHERE id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    asig = new Asignatura(rs.getInt("id"), rs.getString("nombre"), rs.getString("codigo"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return asig;
    }

    public boolean insertar(Asignatura a) {
        String sql = "INSERT INTO asignaturas (nombre, codigo) VALUES (?, ?)";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, a.getNombre());
            ps.setString(2, a.getCodigo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Asignatura a) {
        String sql = "UPDATE asignaturas SET nombre = ?, codigo = ? WHERE id = ?";
        try (Connection con = Database.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, a.getNombre());
            ps.setString(2, a.getCodigo());
            ps.setInt(3, a.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM asignaturas WHERE id = ?";
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
