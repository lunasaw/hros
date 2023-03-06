package com.xuezixiang.hros.service;

import com.xuezixiang.hros.mapper.NationMapper;
import com.xuezixiang.hros.model.Nation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description :

 * @Date: 2019/12/31 12:18
 */
@Service
public class NationService {
    @Autowired
    NationMapper nationMapper;
    public List<Nation> getAllNations() {
        return nationMapper.getAllNations();
    }
}
