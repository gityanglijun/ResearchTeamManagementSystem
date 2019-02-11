package org.ysu.ylj.service.achievements;

import org.springframework.stereotype.Service;
import org.ysu.ylj.dao.Table1Mapper;
import org.ysu.ylj.pojo.Table1;
import org.ysu.ylj.pojo.Table1Example;
import org.ysu.ylj.service.Interface.ITestService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TestServiceImpl implements ITestService {
    @Resource
    Table1Mapper table1Mapper;
   @Override
    public List<Table1> getTables() {
       Table1Example table1Example=new Table1Example();
       table1Example.createCriteria().andIdIsNotNull();
       List<Table1> table1s=table1Mapper.selectByExample(table1Example);
       return table1s;
    }
}
