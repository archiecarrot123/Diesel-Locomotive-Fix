local fluid_locomotive_item = table.deepcopy(data.raw["item-with-entity-data"]["locomotive"])
fluid_locomotive_item.name = "Diesel-Locomotive-fluid-locomotive"
fluid_locomotive_item.icon = "__Diesel-Locomotive-Fix__/graphics/icons/diesel-locomotive.png"
fluid_locomotive_item.order = "a[train-system]-fa[diesel-locomotive]"
fluid_locomotive_item.place_result = "Diesel-Locomotive-fluid-locomotive"

data:extend({fluid_locomotive_item})