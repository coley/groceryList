Public Class GroceryListDataManager

    Private Shared _db As MATCDataContext

    Public Shared Property DB() As MATCDataContext
        Get
            If (_db Is Nothing) Then
                _db = New MATCDataContext
            End If

            Return _db

        End Get

        Set(ByVal value As MATCDataContext)
            _db = value
        End Set

    End Property

    'Create
    Public Shared Function create(ByVal newItem As GroceryList) As Integer

        DB.GroceryLists.InsertOnSubmit(newItem)
        DB.SubmitChanges()

        Return newItem.id
    End Function

    'Read
    Public Shared Function read() As IEnumerable(Of GroceryList)
        'Return (From groceries In DB.GroceryLists Select groceries)
        Return (From groceries In DB.GroceryLists Order By groceries.description Ascending, groceries.created Ascending Select groceries)
    End Function

    'Read by id
    Public Shared Function readById(ByVal id As Integer) As GroceryList
        Return (From groceries In DB.GroceryLists Where groceries.id = id Select groceries).SingleOrDefault
    End Function

    'Update
    Public Shared Function update(ByVal id As Integer, itemToUpdate As GroceryList) As Integer
        Dim rowsAffected As Integer = 0
        Dim currentItem As GroceryList = readById(id)

        If currentItem IsNot Nothing Then
            currentItem.description = itemToUpdate.description
            currentItem.qty = itemToUpdate.qty

            rowsAffected = DB.GetChangeSet.Updates.Count

            If rowsAffected > 0 Then
                DB.SubmitChanges()
            End If
        End If
        
        Return rowsAffected

    End Function

    'Delete
    Public Shared Function delete(ByVal id As Integer) As Integer
        Dim rowsAffected As Integer = 0
        Dim itemToDelete As GroceryList = readById(id)

        If itemToDelete IsNot Nothing Then
            DB.GroceryLists.DeleteOnSubmit(itemToDelete)
            rowsAffected = DB.GetChangeSet.Deletes.Count

            If rowsAffected > 0 Then
                DB.SubmitChanges()
            End If
        End If
       
        Return rowsAffected

    End Function

End Class
