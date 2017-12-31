package com.jw.pojo;

/**
 * @author mioko
 */
public class PermissionInfo {
    private int permissionId;
    private String permissionName;
    private int subPermissionId;
    private String subPermissionName;
    private int parentPermissionId;
    private String url;

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public int getSubPermissionId() {
        return subPermissionId;
    }

    public void setSubPermissionId(int subPermissionId) {
        this.subPermissionId = subPermissionId;
    }

    public String getSubPermissionName() {
        return subPermissionName;
    }

    public void setSubPermissionName(String subPermissionName) {
        this.subPermissionName = subPermissionName;
    }

    public int getParentPermissionId() {
        return parentPermissionId;
    }

    public void setParentPermissionId(int parentPermissionId) {
        this.parentPermissionId = parentPermissionId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
