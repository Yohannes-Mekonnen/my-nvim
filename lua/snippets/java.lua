local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("java", {

  -- ========================
  -- JPA ENTITY
  -- ========================
  s("jpae", fmt([[
@Entity
@Table(name = "{}")
public class {} {{

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    {}

}}
]], {
    i(1, "table_name"),
    i(2, "EntityName"),
    i(3, "// fields"),
  })),

  -- ========================
  -- AUDITABLE BASE ENTITY
  -- ========================
  s("auditable", fmt([[
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class {} {{

    @CreatedDate
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    private LocalDateTime updatedAt;

}}
]], {
    i(1, "BaseEntity"),
  })),

  -- ========================
  -- SOFT DELETE ENTITY
  -- ========================
  s("softdel", fmt([[
@Column(nullable = false)
private boolean deleted = false;

public void softDelete() {{
    this.deleted = true;
}}
]], {})),

  -- ========================
  -- MANY TO ONE
  -- ========================
  s("mt1", fmt([[
@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "{}_id")
private {} {};
]], {
    i(1, "other_entity"),
    i(2, "OtherEntity"),
    i(3, "otherEntity"),
  })),

  -- ========================
  -- ONE TO MANY
  -- ========================
  s("otm", fmt([[
@OneToMany(mappedBy = "{}", cascade = CascadeType.ALL, orphanRemoval = true)
private List<{}> {} = new ArrayList<>();
]], {
    i(1, "parentField"),
    i(2, "ChildEntity"),
    i(3, "children"),
  })),

  -- ========================
  -- REPOSITORY
  -- ========================
  s("jpar", fmt([[
@Repository
public interface {}Repository extends JpaRepository<{}, Long> {{

}}
]], {
    i(1, "Entity"),
    i(2, "Entity"),
  })),

  -- ========================
  -- SERVICE
  -- ========================
  s("jpas", fmt([[
@Service
@RequiredArgsConstructor
@Transactional
public class {}Service {{

    private final {}Repository repository;

    {}

}}
]], {
    i(1, "Entity"),
    i(2, "Entity"),
    i(3, "// business logic"),
  })),

  -- ========================
  -- CONTROLLER
  -- ========================
  s("restc", fmt([[
@RestController
@RequestMapping("/api/{}")
@RequiredArgsConstructor
public class {}Controller {{

    private final {}Service service;

    {}

}}
]], {
    i(1, "entities"),
    i(2, "Entity"),
    i(3, "Entity"),
    i(4, "// endpoints"),
  })),

  -- ========================
  -- DTO
  -- ========================
  s("dto", fmt([[
@Data
public class {}Dto {{

    {}

}}
]], {
    i(1, "Entity"),
    i(2, "// fields"),
  })),

  -- ========================
  -- MAPSTRUCT MAPPER
  -- ========================
  s("mapper", fmt([[
@Mapper(componentModel = "spring")
public interface {}Mapper {{

    {}Dto toDto({} entity);

    {} toEntity({}Dto dto);

}}
]], {
    i(1, "Entity"),
    i(2, "Entity"),
    i(3, "Entity"),
    i(4, "Entity"),
    i(5, "Entity"),
  })),

  -- ========================
  -- SPECIFICATION TEMPLATE
  -- ========================
  s("spec", fmt([[
public static Specification<{}> has{}({} value) {{
    return (root, query, cb) ->
        cb.equal(root.get("{}"), value);
}}
]], {
    i(1, "Entity"),
    i(2, "Field"),
    i(3, "Type"),
    i(4, "field"),
  })),

  -- ========================
  -- PAGEABLE QUERY METHOD
  -- ========================
  s("pageq", fmt([[
Page<{}> findBy{}({}, Pageable pageable);
]], {
    i(1, "Entity"),
    i(2, "Field"),
    i(3, "Type field"),
  })),

  -- ========================
  -- SERVICE CRUD TEMPLATE
  -- ========================
  s("crud", fmt([[
public {} create({} request) {{
    {} entity = mapper.toEntity(request);
    return mapper.toDto(repository.save(entity));
}}

public {} get(Long id) {{
    return repository.findById(id)
            .map(mapper::toDto)
            .orElseThrow(() -> new RuntimeException("Not found"));
}}

public void delete(Long id) {{
    repository.deleteById(id);
}}
]], {
    i(1, "EntityDto"),
    i(2, "EntityDto"),
    i(3, "Entity"),
    i(4, "EntityDto"),
  })),

})
