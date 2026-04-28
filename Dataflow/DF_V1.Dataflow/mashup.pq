[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared O = let
  Source = Excel.Workbook(Web.Contents("https://ecolab-my.sharepoint.com/personal/prasannareddy_vustala_ecolab_com/Documents/EDO_Workpsace_data.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "O", Kind = "Sheet"]}[Data],
  #"Changed column type" = Table.TransformColumnTypes(#"Navigation 1", {{"Column1", type text}, {"Column2", type text}, {"Column3", type text}, {"Column4", type text}, {"Column5", type text}, {"Column6", type text}, {"Column7", type text}, {"Column8", type text}}),
  #"Promoted headers" = Table.PromoteHeaders(#"Changed column type", [PromoteAllScalars = true]),
  #"Removed columns" = Table.RemoveColumns(#"Promoted headers", {"Upgrade status", "State"})
in
  #"Removed columns";
