package cs.dit.mapper;

import cs.dit.model.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
    Admin getAdminById(String id);
}