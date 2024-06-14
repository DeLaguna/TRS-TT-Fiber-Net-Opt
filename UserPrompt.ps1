# UserPrompt.ps1

function UserPrompt {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Message,
        [Parameter(Mandatory=$true)]
        [string]$Title
    )

    # Load necessary assembly
    Add-Type -AssemblyName System.Windows.Forms

    # Create a new form
    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Title
    $form.Size = New-Object System.Drawing.Size(300,200)
    $form.StartPosition = "CenterScreen"

    # Create a label
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,20)
    $label.Size = New-Object System.Drawing.Size(280,20)
    $label.Text = $Message
    $form.Controls.Add($label)

    # Create Yes button
    $yesButton = New-Object System.Windows.Forms.Button
    $yesButton.Location = New-Object System.Drawing.Point(75,120)
    $yesButton.Size = New-Object System.Drawing.Size(75,23)
    $yesButton.Text = "Yes"
    $yesButton.DialogResult = [System.Windows.Forms.DialogResult]::Yes
    $form.Controls.Add($yesButton)

    # Create No button
    $noButton = New-Object System.Windows.Forms.Button
    $noButton.Location = New-Object System.Drawing.Point(150,120)
    $noButton.Size = New-Object System.Drawing.Size(75,23)
    $noButton.Text = "No"
    $noButton.DialogResult = [System.Windows.Forms.DialogResult]::No
    $form.Controls.Add($noButton)

    # Set the accept and cancel button
    $form.AcceptButton = $yesButton
    $form.CancelButton = $noButton

    # Show the form
    $result = $form.ShowDialog()

    # Return the result
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        return $true
    } else {
        return $false
    }
}