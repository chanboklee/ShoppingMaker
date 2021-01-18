package com.shopping.maker.repository.item;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shopping.maker.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Long>{

}
