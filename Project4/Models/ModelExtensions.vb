Imports System.ComponentModel.DataAnnotations

<MetadataType(GetType(GroceryListValidations))> _
Partial Public Class GroceryList

End Class

Public Class GroceryListValidations

    Const minQuantity As Integer = 1
    Const maxQuantity As Integer = 500
    Const maxDescription As Integer = 50
    Const integerExpression As String = "^\d+$"

    <Required(ErrorMessage:="description is a required field")> _
    <StringLength(maxDescription, ErrorMessage:="description cannot contain more than 50 characters")> _
    Public Property description As String

    <Required(ErrorMessage:="quantity is a required field")> _
    <Range(minQuantity, maxQuantity, ErrorMessage:="quantity must be between 1 and 500")> _
    <RegularExpression(integerExpression, ErrorMessage:="quantity must be a whole number between 1 and 500")> _
    Public Property qty As Integer

End Class
