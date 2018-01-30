--
-- File generated with SQLiteStudio v3.1.1 on Wed Dec 20 22:11:35 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Websites
DROP TABLE IF EXISTS Websites;

CREATE TABLE Websites (
    BaseURL     VARCHAR (100),
    Description TEXT (100),
    Name        VARCHAR (20),
    Path        VARCHAR (50),
    Source      VARCHAR (20),
    CONSTRAINT Websites_PK PRIMARY KEY (
        BaseURL
    )
    ON CONFLICT REPLACE
);

INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://www.nauticalcharts.noaa.gov/mcd/chart1/ChartNo1.pdf', NULL, 'Chart1', NULL, 'NOAA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://www.nauticalcharts.noaa.gov/publications/coast-pilot', NULL, 'CoastalPilot', NULL, 'NOAA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://www.navcen.uscg.gov/pdf/lightLists', NULL, 'LightLists', NULL, 'USCG');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://www.navcen.uscg.gov/pdf/navRules/CG_NRHB_20151231.pdf', NULL, 'NavRules', NULL, 'USCG');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/APN/Bowditch_Vol_2.pdf', NULL, 'American Practical Navigator', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/APN/Bowditch_Vol_1.pdf', NULL, 'American Practical Navigator', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub110/Pub110bk.pdf', 'Greenland, The East Coasts of North and South America (Excluding Continental U.S.A. Except the East Coast of Florida) and the West Indies', 'NGA List of Lights', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub110/UpdatedPub110bk.pdf', 'Greenland, The East Coasts of North and South America (Excluding Continental U.S.A. Except the East Coast of Florida) and the West Indies', 'NGA List of Lights', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub111/UpdatedPub111bk.pdf', 'The West Coasts of North and South America (Excluding Continental U.S.A. and Hawaii), Australia, Tasmania, New Zealand, and the Islands of the North and South Pacific Oceans', 'NGA List of Lights', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub112/UpdatedPub112bk.pdf', 'List of Lights Pub. 112, Western Pacific and Indian Oceans Including the Persian Gulf and Red Sea', 'NGA List of Lights', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub115/UpdatedPub115bk.pdf', 'List of Lights Pub. 115, Norway, Iceland and Arctic Ocean', 'NGA List of Lights', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub116/UpdatedPub116bk.pdf', 'Baltic Sea with Kattegat, Belts and Sound and Gulf of Bothnia', 'NGA List of Lights', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub114/UpdatedPub114bk.pdf', 'List of Lights Pub. 114, British Isles, English Channel and North Sea', 'NGA List of Lights', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub113/UpdatedPub113bk.pdf', 'The West Coasts of Europe and Africa, the Mediterranean Sea, Black Sea and Azovskoye More (Sea of Azov)', 'NGA List of Lights', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/Files/AnnualChange2015_World.PDF', 'US/UK World Magnetic Model - Epoch 2015.0', 'US/UK World Magnetic Model', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/Files/MagneticVariation2015_World.PDF', NULL, NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/RNA/pub117.zip', 'The Radio Navigational Aids (NGA Pub. 117) publication contains a detailed list of selected worldwide radio stations that provide services to the navigator. ', 'Radio Navigational Aids', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/Files/ManeuveringBoardLarge.pdf', 'The Radar Navigation and Maneuvering Board Manual (Pub. 1310) contains, in a single volume, information on the fundamentals of shipboard radar, radar operation, collision avoidance, navigation by radar, and a description of vessel traffic systems in US waters. ', 'Radar Navigation and Maneuvering Board Manual', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/RNM/Pub_1310.zip', 'RADAR NAVIGATION AND MANEUVERING BOARD MANUAL', NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/Files/ManeuveringBoard.pdf', 'The Radar Navigation and Maneuvering Board Manual (Pub. 1310) contains, in a single volume, information on the fundamentals of shipboard radar, radar operation, collision avoidance, navigation by radar, and a description of vessel traffic systems in US waters. ', 'Radar Navigation and Maneuvering Board Manual', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/Files/NautChrts_GPS_index.htm', NULL, NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/Files/AnnualChange2015_SPolar.PDF', NULL, NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/Files/AnnualChange2015_NPolar.PDF', NULL, NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/Files/MagneticVariation2015_NPolar.PDF', NULL, NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub124/Pub124bk.pdf', 'East Coast of South America (Enroute), 15th Ed 2017', 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub123/Pub123bk.pdf', 'Southwest Coast of Africa (Enroute), 16th Ed 2017', 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub120/Pub120bk.pdf', 'PACIFIC OCEAN AND SOUTHEAST ASIA', 'Sailing Directions Planning Guide', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/APN/pub9.zip', '', NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/Chart1/ChartNo1_LoRes.pdf', 'Low Resolution Version', 'U.S. Chart No. 1', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/Chart1/ChartNo1.pdf', 'Chart No. 1', 'U.S. Chart No. 1', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/Chart1/ChartNo1_Updated.pdf', 'Updated Version', 'U.S. Chart No. 1', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/NGAPortal/MSISiteContent/StaticFiles/Files/MatthewMaury.pdf', 'Matthew Maury', 'Matthew Maury', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/NGAPortal/MSISiteContent/StaticFiles/HoMCA.pdf', NULL, NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub126/Pub126bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub140/Pub140bk.pdf', 'North Atlantic Ocean and Adjacent Seas (Planning Guide), 16th Ed 2017', 'Sailing Directions Planning Guide', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub132/Pub132bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub131/Pub131bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub127/Pub127bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub125/Pub125bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub157/Pub157bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub155/Pub155bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub154/Pub154bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub153/Pub153bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub148/Pub148bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub147/Pub147bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub146/Pub146bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub145/Pub145bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub143/Pub143bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub142/Pub142bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub141/Pub141bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub173/Pub173bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub172/Pub172bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub171/Pub171bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub164/Pub164bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub163/Pub163bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub162/Pub162bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub161/Pub161bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub160/Pub160bk.pdf', 'South Atlantic Ocean and Indian Ocean (Planning Guide), 13th Ed 2016', 'Sailing Directions Planning Guide', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub159/Pub159bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub158/Pub158bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub182/Pub182bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub181/Pub181bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub180/Pub180bk.pdf', 'Arctic Ocean (Planning Guide), 12th Ed 2017', 'Sailing Directions Planning Guide', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub175/Pub175bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub174/Pub174bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_6/Pub229Vol6.pdf', 'Latitudes 75° - 90°, Inclusive', 'Sight Reduction Tables for Marine Nav. - Volume 6', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_5/Pub229Vol5.pdf', 'Latitudes 60° - 75°, Inclusive', 'Sight Reduction Tables for Marine Nav. - Volume 5', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_4/Pub229Vol4.pdf', 'Latitudes 45° - 60°, Inclusive', 'Sight Reduction Tables for Marine Nav. - Volume 4', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_3/Pub229Vol3.pdf', 'Latitudes 30° - 45°, Inclusive', 'Sight Reduction Tables for Marine Nav. - Volume 3', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_2/Pub229Vol2.pdf', 'Latitudes 15° - 30°, Inclusive', 'Sight Reduction Tables for Marine Nav. - Volume 2', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_1/Pub229Vol1.pdf', 'Latitudes 0° - 15°, Inclusive', 'Sight Reduction Tables for Marine Nav. - Volume 1', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub200/Pub200bk.pdf', 'Antarctica (Planning Guide and Enroute), 11th Ed 2017', 'Sailing Directions Planning Guide', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub195/Pub195bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub194/Pub194bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub193/Pub193bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub192/Pub192bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub191/Pub191bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub183/Pub183bk.pdf', NULL, 'Sailing Directions Enroute', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/WPI/wpi.zip', NULL, NULL, NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_VII/USCG_Volume_VII.pdf', 'Great Lakes (United States and Canada)', 'USCG Light List ', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_VI/USCG_Volume_VI.pdf', 'Pacific Coast and Pacific Islands', 'USCG Light List ', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_V/USCG_Volume_V.pdf', 'Mississippi River System', 'USCG Light List ', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_IV/USCG_Volume_IV.pdf', 'Gulf of Mexico (Econfina River, Florida to Rio Grande River, Texas)', 'USCG Light List ', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_III/USCG_Volume_III.pdf', 'Atlantic and Gulf Coast (Little River, South Carolina to Econfina River, Florida includes Puerto Rico and the U.S. Virgin Islands)', 'USCG Light List ', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_II/USCG_Volume_II.pdf', 'Atlantic Coast (Toms River, New Jersey to Little River, South Carolina)', 'USCG Light List ', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_I/USCG_Volume_I.pdf', 'Atlantic Coast (St. Croix River, Maine to Shrewsbury River, New Jersey)', 'USCG Light List ', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/ICOS/pub102.zip', 'International Code of Signals', 'International Code of Signals', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/WPI/Pub150bk.pdf', 'World Port Index Database (MS Access) (2 MB)', 'World Port Index', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/WPI/PUB150.ZIP', 'World Port Index Database (MS Access)', 'World Port Index', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/WPI/WPI_Shapefile.zip', 'World Port Index Shape file', 'World Port Index', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/DBP/Pub_151.zip', 'Distance Between Ports', 'Distance Between Ports', NULL, 'NGA');
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('http://msi.nga.mil/MSISiteContent/StaticFiles/SD_Update_Summary.htm', NULL, 'Sailing Directions Summary', NULL, NULL);
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTA/Pub249/Vol_2/Pub249Vol2.pdf', 'Latitudes 0°-40° Declinations 0°-29°', 'Sight Reduction Tables for Air Nav. - Volume 2', NULL, NULL);
INSERT INTO Websites (BaseURL, Description, Name, Path, Source) VALUES ('https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTA/Pub249/Vol_3/Pub249Vol3.pdf', 'Latitudes 39°-89° Declinations 0°-29°', 'Sight Reduction Tables for Air Nav. - Volume 3', NULL, NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
