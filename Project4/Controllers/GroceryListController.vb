Namespace Project4
    Public Class GroceryListController
        Inherits System.Web.Mvc.Controller

        '
        ' GET: /GroceryList

        Function Index() As ActionResult
            Return View(GroceryListDataManager.read)
        End Function

        '
        ' GET: /GroceryList/Details/5

        Function Details(ByVal id As Integer) As ActionResult
            Return View("Details", GroceryListDataManager.readById(id))
        End Function

        '
        ' GET: /GroceryList/Create

        Function Create() As ActionResult
            Return View()
        End Function

        '
        ' POST: /GroceryList/Create

        <HttpPost()> _
        Function Create(ByVal newItem As GroceryList) As ActionResult
            Try
                If ModelState.IsValid Then
                    GroceryListDataManager.create(newItem)
                Else
                    Return View(newItem)
                End If

                Return RedirectToAction("Index")
            Catch
                Return View()
            End Try
        End Function
        
        '
        ' GET: /GroceryList/Edit/5

        Function Edit(ByVal id As Integer) As ActionResult
            Return View("Edit", GroceryListDataManager.readById(id))
        End Function

        '
        ' POST: /GroceryList/Edit/5

        <HttpPost()> _
        Function Edit(ByVal id As Integer, ByVal itemToUpdate As GroceryList) As ActionResult
            Try
                If ModelState.IsValid Then
                    GroceryListDataManager.update(id, itemToUpdate)
                Else
                    Return View("Edit", itemToUpdate)
                End If

                Return RedirectToAction("Index")
            Catch
                Return View("Edit")
            End Try
        End Function

        '
        ' GET: /GroceryList/Delete/5

        Sub Delete(ByVal id As Integer)
            Dim result As Integer = GroceryListDataManager.delete(id)

            HttpContext.Response.Write(result)
        End Sub

    End Class
End Namespace