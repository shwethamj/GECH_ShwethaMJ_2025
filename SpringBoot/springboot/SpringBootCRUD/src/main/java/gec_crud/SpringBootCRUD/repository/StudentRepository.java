package gec_crud.SpringBootCRUD.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import gec_crud.SpringBootCRUD.models.Student;



public interface StudentRepository extends JpaRepository<Student,Long> {

}
