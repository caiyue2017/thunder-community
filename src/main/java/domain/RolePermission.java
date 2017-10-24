package domain;

import java.io.Serializable;

/**
 * Created by 阿越 on 2017/5/8.
 */
public class RolePermission implements Serializable{
    private int roleId;
    private int permissionId;

    @Override
    public String toString() {
        return "RolePermission{" +
                "roleId=" + roleId +
                ", permissionId=" + permissionId +
                '}';
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }
}
