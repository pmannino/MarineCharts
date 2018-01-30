INSERT OR REPLACE INTO Vertices (
                         chartName,
                         panel_no,
                         lat,
                         long,
                         pointNumber
                     )
                     SELECT MapName,
                            GDAItemID,
                            nlat,
                            wlong,
                            1
                       FROM alltopomaps;

INSERT OR REPLACE INTO Vertices (
                         chartName,
                         panel_no,
                         lat,
                         long,
                         pointNumber
                     )
                     SELECT MapName,
                            GDAItemID,
                            nlat,
                            elong,
                            2
                       FROM alltopomaps;

INSERT OR REPLACE INTO Vertices (
                         chartName,
                         panel_no,
                         lat,
                         long,
                         pointNumber
                     )
                     SELECT MapName,
                            GDAItemID,
                            slat,
                            elong,
                            3
                       FROM alltopomaps;

INSERT OR REPLACE INTO Vertices (
                         chartName,
                         panel_no,
                         lat,
                         long,
                         pointNumber
                     )
                     SELECT MapName,
                            GDAItemID,
                            slat,
                            wlong,
                            4
                       FROM alltopomaps;