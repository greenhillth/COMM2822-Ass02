-- Modify Inventory table
ALTER TABLE "Y24GROUP054"."INVENTORY"
ADD (
    --null
);
/
-- Comments 
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."INVENTORY_ID" IS 'Primary key of inventory table. Represents an individual item.';
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."NAME" IS 'Name of item. Not nullable.';
COMMENT ON COLUMN "Y24GROUP054"."INVENTORY"."DESCRIPTION" IS 'Short description of item.';
COMMENT ON TABLE "Y24GROUP054"."INVENTORY" IS 'Record of all items at centre.';
