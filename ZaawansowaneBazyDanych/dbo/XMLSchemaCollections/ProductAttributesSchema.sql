CREATE XML SCHEMA COLLECTION [dbo].[ProductAttributesSchema]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <xsd:element name="Attributes" type="AttributesType" />
  <xsd:complexType name="AttributesType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Name" type="xsd:string" />
          <xsd:element name="Price" type="xsd:decimal" />
          <xsd:element name="Weight" type="xsd:decimal" />
          <xsd:element name="Brand" type="xsd:string" />
          <xsd:element name="Length" type="xsd:decimal" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
</xsd:schema>';

