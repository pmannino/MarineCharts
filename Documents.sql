--
-- File generated with SQLiteStudio v3.1.1 on Fri Dec 22 19:08:44 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Documents
DROP TABLE IF EXISTS Documents;

CREATE TABLE Documents (
    URL             VARCHAR (200),
    DateRetrieved   DATE,
    Description     VARCHAR (100),
    DocumentType    VARCHAR (20),
    DownloadStatus  VARCHAR (10)  DEFAULT New,
    Filename        VARCHAR (100),
    Path            VARCHAR (50),
    PublicationDate DATE,
    Source          VARCHAR (20),
    Title           VARCHAR (50),
    CONSTRAINT Websites_PK PRIMARY KEY (
        URL
    )
    ON CONFLICT REPLACE
);

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.nauticalcharts.noaa.gov/mcd/chart1/ChartNo1.pdf',
                          NULL,
                          NULL,
                          'Chart1',
                          'New',
                          'ChartNo1.pdf',
                          '{USERDATA}/NOAA',
                          NULL,
                          'NOAA',
                          'ChartNo1'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.nauticalcharts.noaa.gov/publications/coast-pilot',
                          NULL,
                          NULL,
                          'CoastPilot',
                          'New',
                          NULL,
                          '{USERDATA}/NOAA',
                          NULL,
                          'NOAA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/navRules/CG_NRHB_20151231.pdf',
                          NULL,
                          'USCG NAVIGATION RULES AND REGULATIONS HANDBOOK',
                          'NavRules',
                          'New',
                          'NavRules.pdf',
                          '{USERDATA}/USCG',
                          '2015-11-30',
                          'USCG',
                          'NavRules'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/APN/Bowditch_Vol_2.pdf',
                          NULL,
                          NULL,
                          'American Practical Navigator',
                          'New',
                          'American Practical Navigator Vol 2.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'American Practical Navigator Vol 2'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/APN/Bowditch_Vol_1.pdf',
                          NULL,
                          NULL,
                          'American Practical Navigator',
                          'New',
                          'American Practical Navigator Vol1.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'American Practical Navigator Vol1'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub110/Pub110bk.pdf',
                          NULL,
                          'Greenland, The East Coasts of North and South America (Excluding Continental U.S.A. Except the East Coast of Florida) and the West Indies',
                          'LightList',
                          'New',
                          'LightList Greenland.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'LightList Greenland'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub110/UpdatedPub110bk.pdf',
                          NULL,
                          'Greenland, The East Coasts of North and South America (Excluding Continental U.S.A. Except the East Coast of Florida) and the West Indies',
                          'LightList',
                          'New',
                          'LightList Greenland Updated.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'LightList Greenland Updated'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub111/UpdatedPub111bk.pdf',
                          NULL,
                          'The West Coasts of North and South America (Excluding Continental U.S.A. and Hawaii), Australia, Tasmania, New Zealand, and the Islands of the North and South Pacific Oceans',
                          'LightList',
                          'New',
                          'LightList N and S America Updated.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'LightList N and S America Updated'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub112/UpdatedPub112bk.pdf',
                          NULL,
                          'List of Lights Pub. 112, Western Pacific and Indian Oceans Including the Persian Gulf and Red Sea',
                          'LightList',
                          'New',
                          'LightList W Pacific Updated.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'LightList W Pacific Updated'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub115/UpdatedPub115bk.pdf',
                          NULL,
                          'List of Lights Pub. 115, Norway, Iceland and Arctic Ocean',
                          'LightList',
                          'New',
                          'LightList Norway Updated.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'LightList Norway Updated'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub116/UpdatedPub116bk.pdf',
                          NULL,
                          'Baltic Sea with Kattegat, Belts and Sound and Gulf of Bothnia',
                          'LightList',
                          'New',
                          'LightList Baltic Sea Updated.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'LightList Baltic Sea Updated'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub114/UpdatedPub114bk.pdf',
                          NULL,
                          'List of Lights Pub. 114, British Isles, English Channel and North Sea',
                          'LightList',
                          'New',
                          'LightList British Isles Updated.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'LightList British Isles Updated'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/NIMA_LOL/Pub113/UpdatedPub113bk.pdf',
                          NULL,
                          'The West Coasts of Europe and Africa, the Mediterranean Sea, Black Sea and Azovskoye More (Sea of Azov)',
                          'LightList',
                          'New',
                          'LightList Europe and Africa Updated.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'LightList Europe and Africa Updated'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/Files/AnnualChange2015_World.PDF',
                          NULL,
                          'US/UK World Magnetic Model - Epoch 2015.0',
                          'US/UK World Magnetic Model',
                          'New',
                          'US-UK World Magnetic Model (2015).PDF',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'US-UK World Magnetic Model (2015).PDF'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/Files/MagneticVariation2015_World.PDF',
                          NULL,
                          NULL,
                          NULL,
                          'New',
                          'Magnetic Variation 2015 World.PDF',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Magnetic Variation 2015 World.PDF'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/RNA/pub117.zip',
                          NULL,
                          'The Radio Navigational Aids (NGA Pub. 117) publication contains a detailed list of selected worldwide radio stations that provide services to the navigator. ',
                          'Radio Navigational Aids',
                          'New',
                          'Radio Navaids.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Radio Navaids'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/Files/ManeuveringBoardLarge.pdf',
                          NULL,
                          'The Radar Navigation and Maneuvering Board Manual (Pub. 1310) contains, in a single volume, information on the fundamentals of shipboard radar, radar operation, collision avoidance, navigation by radar, and a description of vessel traffic systems in US waters. ',
                          'Radar Navigation and Maneuvering Board Manual',
                          'New',
                          'Maneuvering Board Large.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Maneuvering Board Large'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/RNM/Pub_1310.zip',
                          NULL,
                          'RADAR NAVIGATION AND MANEUVERING BOARD MANUAL',
                          NULL,
                          'New',
                          'Radar Navigation.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Radar Navigation'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/Files/ManeuveringBoard.pdf',
                          NULL,
                          'The Radar Navigation and Maneuvering Board Manual (Pub. 1310) contains, in a single volume, information on the fundamentals of shipboard radar, radar operation, collision avoidance, navigation by radar, and a description of vessel traffic systems in US waters. ',
                          'Radar Navigation and Maneuvering Board Manual',
                          'New',
                          'Maneuvering Board.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Maneuvering Board'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/Files/NautChrts_GPS_index.htm',
                          NULL,
                          NULL,
                          NULL,
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/Files/AnnualChange2015_SPolar.PDF',
                          NULL,
                          NULL,
                          NULL,
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/Files/AnnualChange2015_NPolar.PDF',
                          NULL,
                          NULL,
                          NULL,
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/Files/MagneticVariation2015_NPolar.PDF',
                          NULL,
                          NULL,
                          NULL,
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub124/Pub124bk.pdf',
                          NULL,
                          'East Coast of South America (Enroute), 15th Ed 2017',
                          'Sailing Directions Enroute',
                          'New',
                          'East Coast of South America (Enroute), 15th Ed 2017.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'East Coast of South America (Enroute), 15th Ed 2017'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub123/Pub123bk.pdf',
                          NULL,
                          'Southwest Coast of Africa (Enroute), 16th Ed 2017',
                          'Sailing Directions Enroute',
                          'New',
                          'Southwest Coast of Africa (Enroute), 16th Ed 2017.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Southwest Coast of Africa (Enroute), 16th Ed 2017'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub120/Pub120bk.pdf',
                          NULL,
                          'PACIFIC OCEAN AND SOUTHEAST ASIA',
                          'Sailing Directions Planning Guide',
                          'New',
                          'PACIFIC OCEAN AND SOUTHEAST ASIA.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'PACIFIC OCEAN AND SOUTHEAST ASIA'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/APN/pub9.zip',
                          NULL,
                          NULL,
                          NULL,
                          'New',
                          '',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          ''
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/Chart1/ChartNo1_LoRes.pdf',
                          NULL,
                          'Low Resolution Version',
                          'Chart1',
                          'New',
                          'ChartNo1_LoRes.pdf',
                          '{USERDATA}/NGA',
                          '2013-04-15',
                          'NGA',
                          'ChartNo1_LoRes'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/Chart1/ChartNo1.pdf',
                          NULL,
                          'Chart No. 1',
                          'Chart1',
                          'New',
                          'ChartNo1.pdf',
                          '{USERDATA}/NGA',
                          '2013-04-15',
                          'NGA',
                          'ChartNo1'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/Chart1/ChartNo1_Updated.pdf',
                          NULL,
                          'Updated Version',
                          'Chart1',
                          'New',
                          'ChartNo1_Updated.pdf',
                          '{USERDATA}/NGA',
                          '2013-04-15',
                          'NGA',
                          'ChartNo1_Updated'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/NGAPortal/MSISiteContent/StaticFiles/Files/MatthewMaury.pdf',
                          NULL,
                          'Matthew Maury',
                          'Matthew Maury',
                          'New',
                          'Matthew Maury.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Matthew Maury'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/NGAPortal/MSISiteContent/StaticFiles/HoMCA.pdf',
                          NULL,
                          NULL,
                          NULL,
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub126/Pub126bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub140/Pub140bk.pdf',
                          NULL,
                          'North Atlantic Ocean and Adjacent Seas (Planning Guide), 16th Ed 2017',
                          'Sailing Directions Planning Guide',
                          'New',
                          'North Atlantic Ocean and Adjacent Seas (Planning Guide), 16th Ed 2017.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'North Atlantic Ocean and Adjacent Seas (Planning Guide), 16th Ed 2017'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub132/Pub132bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub131/Pub131bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub127/Pub127bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub125/Pub125bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub157/Pub157bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub155/Pub155bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub154/Pub154bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub153/Pub153bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub148/Pub148bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub147/Pub147bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub146/Pub146bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub145/Pub145bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub143/Pub143bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub142/Pub142bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub141/Pub141bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub173/Pub173bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub172/Pub172bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub171/Pub171bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub164/Pub164bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub163/Pub163bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub162/Pub162bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub161/Pub161bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub160/Pub160bk.pdf',
                          NULL,
                          'South Atlantic Ocean and Indian Ocean (Planning Guide), 13th Ed 2016',
                          'Sailing Directions Planning Guide',
                          'New',
                          'South Atlantic Ocean and Indian Ocean (Planning Guide), 13th Ed 2016.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'South Atlantic Ocean and Indian Ocean (Planning Guide), 13th Ed 2016'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub159/Pub159bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub158/Pub158bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub182/Pub182bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub181/Pub181bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub180/Pub180bk.pdf',
                          NULL,
                          'Arctic Ocean (Planning Guide), 12th Ed 2017',
                          'Sailing Directions Planning Guide',
                          'New',
                          'Arctic Ocean (Planning Guide), 12th Ed 2017.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Arctic Ocean (Planning Guide), 12th Ed 2017'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub175/Pub175bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub174/Pub174bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_6/Pub229Vol6.pdf',
                          NULL,
                          'Latitudes 75° - 90°, Inclusive',
                          'Sight Reduction Tables for Marine Nav. - Volume 6',
                          'New',
                          'Latitudes 75° - 90°, Inclusive.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Latitudes 75° - 90°, Inclusive'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_5/Pub229Vol5.pdf',
                          NULL,
                          'Latitudes 60° - 75°, Inclusive',
                          'Sight Reduction Tables for Marine Nav. - Volume 5',
                          'New',
                          'Latitudes 60° - 75°, Inclusive.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Latitudes 60° - 75°, Inclusive'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_4/Pub229Vol4.pdf',
                          NULL,
                          'Latitudes 45° - 60°, Inclusive',
                          'Sight Reduction Tables for Marine Nav. - Volume 4',
                          'New',
                          'Latitudes 45° - 60°, Inclusive.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Latitudes 45° - 60°, Inclusive'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_3/Pub229Vol3.pdf',
                          NULL,
                          'Latitudes 30° - 45°, Inclusive',
                          'Sight Reduction Tables for Marine Nav. - Volume 3',
                          'New',
                          'Latitudes 30° - 45°, Inclusive.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Latitudes 30° - 45°, Inclusive'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_2/Pub229Vol2.pdf',
                          NULL,
                          'Latitudes 15° - 30°, Inclusive',
                          'Sight Reduction Tables for Marine Nav. - Volume 2',
                          'New',
                          'Latitudes 15° - 30°, Inclusive.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Latitudes 15° - 30°, Inclusive'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTM/Pub229/Vol_1/Pub229Vol1.pdf',
                          NULL,
                          'Latitudes 0° - 15°, Inclusive',
                          'Sight Reduction Tables for Marine Nav. - Volume 1',
                          'New',
                          'Latitudes 0° - 15°, Inclusive.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Latitudes 0° - 15°, Inclusive'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub200/Pub200bk.pdf',
                          NULL,
                          'Antarctica (Planning Guide and Enroute), 11th Ed 2017',
                          'Sailing Directions Planning Guide',
                          'New',
                          'Antarctica (Planning Guide and Enroute), 11th Ed 2017.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Antarctica (Planning Guide and Enroute), 11th Ed 2017'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub195/Pub195bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub194/Pub194bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub193/Pub193bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub192/Pub192bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub191/Pub191bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SD/Pub183/Pub183bk.pdf',
                          NULL,
                          NULL,
                          'Sailing Directions Enroute',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/WPI/wpi.zip',
                          NULL,
                          NULL,
                          NULL,
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_VII/USCG_Volume_VII.pdf',
                          NULL,
                          'Great Lakes (United States and Canada)',
                          'LightList',
                          'New',
                          'USCG_Volume_VII.pdf',
                          '{USERDATA}/NGA',
                          '2017-01-01',
                          'NGA',
                          'USCG_Volume_VII'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_VI/USCG_Volume_VI.pdf',
                          NULL,
                          'Pacific Coast and Pacific Islands',
                          'LightList',
                          'New',
                          'USCG_Volume_VI.pdf',
                          '{USERDATA}/NGA',
                          '2017-01-01',
                          'NGA',
                          'USCG_Volume_VI'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_V/USCG_Volume_V.pdf',
                          NULL,
                          'Mississippi River System',
                          'LightList',
                          'New',
                          'USCG_Volume_V.pdf',
                          '{USERDATA}/NGA',
                          '2017-01-01',
                          'NGA',
                          'USCG_Volume_V'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_IV/USCG_Volume_IV.pdf',
                          NULL,
                          'Gulf of Mexico (Econfina River, Florida to Rio Grande River, Texas)',
                          'LightList',
                          'New',
                          'USCG_Volume_IV.pdf',
                          '{USERDATA}/NGA',
                          '2017-01-01',
                          'NGA',
                          'USCG_Volume_IV'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_III/USCG_Volume_III.pdf',
                          NULL,
                          'Atlantic and Gulf Coast (Little River, South Carolina to Econfina River, Florida includes Puerto Rico and the U.S. Virgin Islands)',
                          'LightList',
                          'New',
                          'USCG_Volume_III.pdf',
                          '{USERDATA}/NGA',
                          '2017-01-01',
                          'NGA',
                          'USCG_Volume_III'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_II/USCG_Volume_II.pdf',
                          NULL,
                          'Atlantic Coast (Toms River, New Jersey to Little River, South Carolina)',
                          'LightList',
                          'New',
                          'USCG_Volume_II.pdf',
                          '{USERDATA}/NGA',
                          '2017-01-01',
                          'NGA',
                          'USCG_Volume_II'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/USCG_LL/Vol_I/USCG_Volume_I.pdf',
                          NULL,
                          'Atlantic Coast (St. Croix River, Maine to Shrewsbury River, New Jersey)',
                          'LightList',
                          'New',
                          'USCG_Volume_I.pdf',
                          '{USERDATA}/NGA',
                          '2017-01-01',
                          'NGA',
                          'USCG_Volume_I'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/ICOS/pub102.zip',
                          NULL,
                          'International Code of Signals',
                          'International Code of Signals',
                          'New',
                          'International Code of Signals.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'International Code of Signals'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/WPI/Pub150bk.pdf',
                          NULL,
                          'World Port Index Database (MS Access) (2 MB)',
                          'World Port Index',
                          'New',
                          'World Port Index Database (MS Access) (2 MB).pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'World Port Index Database (MS Access) (2 MB)'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/WPI/PUB150.ZIP',
                          NULL,
                          'World Port Index Database (MS Access)',
                          'World Port Index',
                          'New',
                          'World Port Index Database (MS Access).pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'World Port Index Database (MS Access)'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/WPI/WPI_Shapefile.zip',
                          NULL,
                          'World Port Index Shape file',
                          'World Port Index',
                          'New',
                          'World Port Index Shape file.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'World Port Index Shape file'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/DBP/Pub_151.zip',
                          NULL,
                          'Distance Between Ports',
                          'Distance Between Ports',
                          'New',
                          'Distance Between Ports.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Distance Between Ports'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://msi.nga.mil/MSISiteContent/StaticFiles/SD_Update_Summary.htm',
                          NULL,
                          NULL,
                          'Sailing Directions Summary',
                          'New',
                          NULL,
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          NULL
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTA/Pub249/Vol_2/Pub249Vol2.pdf',
                          NULL,
                          'Latitudes 0°-40° Declinations 0°-29°',
                          'Sight Reduction Tables for Air Nav. - Volume 2',
                          'New',
                          'Latitudes 0°-40° Declinations 0°-29°.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Latitudes 0°-40° Declinations 0°-29°'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://msi.nga.mil/MSISiteContent/StaticFiles/NAV_PUBS/SRTA/Pub249/Vol_3/Pub249Vol3.pdf',
                          NULL,
                          'Latitudes 39°-89° Declinations 0°-29°',
                          'Sight Reduction Tables for Air Nav. - Volume 3',
                          'New',
                          'Latitudes 39°-89° Declinations 0°-29°.pdf',
                          '{USERDATA}/NGA',
                          NULL,
                          'NGA',
                          'Latitudes 39°-89° Declinations 0°-29°'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/lightLists/ATON%20Plates.pdf',
                          NULL,
                          'Color Aids to Navigation Insert ',
                          'ATON',
                          'New',
                          'Color Aids to Navigation.pdf',
                          '{USERDATA}/USCG/LightLists',
                          NULL,
                          'USCG',
                          'Color Aids to Navigation'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://uscgboating.org/images/486.PDF',
                          NULL,
                          'U.S. Aids to Navigation System',
                          'NavAids',
                          'New',
                          'U.S. Aids to Navigation System.pdf',
                          '{USERDATA}/USCG/LightLists',
                          NULL,
                          'USCG',
                          'U.S. Aids to Navigation System'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/air_traffic/publications/media/aim.pdf',
                          NULL,
                          'Aeronautical Information Manual',
                          'AIM',
                          'New',
                          'Aeronautical Information Manual.pdf',
                          '{USERDATA}/FAA/Air Traffic',
                          '2017-10-12',
                          'FAA',
                          'Aeronautical Information Manual'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/air_traffic/publications/media/AIP.pdf',
                          NULL,
                          'Aeronautical Information Publication',
                          'AIP',
                          'New',
                          'Aeronautical Information Publication.pdf',
                          '{USERDATA}/FAA/Air Traffic',
                          '2017-10-12',
                          'FAA',
                          'Aeronautical Information Publication'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_61-98C.pdf',
                          '2017-12-22 18:02:04',
                          'Currency Requirements and Guidance for the Flight Review and Instrument Proficiency Check',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 61-98C.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2015-11-20',
                          'FAA',
                          'Advisory Circular 61-98C'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_61-65G.pdf',
                          '2017-12-22 18:02:06',
                          'Certification: Pilots and Flight and Ground Instructors ',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 61-65G.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2017-08-25',
                          'FAA',
                          'Advisory Circular 61-65G'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_107-2.pdf',
                          '2017-12-22 18:02:06',
                          'Small Unmanned Aircraft Systems (sUAS)',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 107-2.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2016-06-21',
                          'FAA',
                          'Advisory Circular 107-2'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_91-85A.pdf',
                          '2017-12-22 18:02:06',
                          'Authorization of Aircraft and Operators for Flight in Reduced Vertical Separation Minimum (RVSM) Airspace',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 91-85A.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2016-07-21',
                          'FAA',
                          'Advisory Circular 91-85A'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_00-6B.pdf',
                          '2017-12-22 18:02:11',
                          'Aviation Weather',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 00-6B.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2016-08-23',
                          'FAA',
                          'Advisory Circular 00-6B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_61-140A.pdf',
                          '2017-12-22 18:02:11',
                          'Autorotation Training ',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 61-140A.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2016-08-31',
                          'FAA',
                          'Advisory Circular 61-140A'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_91-70B.pdf',
                          '2017-12-22 18:02:13',
                          'Oceanic and Remote Continental Airspace Operations',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 91-70B.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2016-10-04',
                          'FAA',
                          'Advisory Circular 91-70B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_00-45H.pdf',
                          '2017-12-22 18:02:22',
                          'Aviation Weather Services ',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 00-45H.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2016-11-14',
                          'FAA',
                          'Advisory Circular 00-45H'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_90-109A.pdf',
                          '2017-12-22 18:02:23',
                          'Transition to Unfamiliar Aircraft',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 90-109A.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2015-06-29',
                          'FAA',
                          'Advisory Circular 90-109A'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_61-83H.pdf',
                          '2017-12-22 18:02:23',
                          'Nationally Scheduled, FAA Approved, Industry Conducted Flight Instructor Refresher Course',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 61-83H.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2015-08-04',
                          'FAA',
                          'Advisory Circular 61-83H'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_00-66.pdf',
                          '2017-12-22 18:02:23',
                          'Selection of Cyclic Redundancy Code and Checksum Algorithms to Ensure Critical Data Integrity',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 00-66.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2015-08-04',
                          'FAA',
                          'Advisory Circular 00-66'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC%20120-74B.pdf',
                          '2017-12-22 18:18:54',
                          'Parts 91, 121, 125, and 135 Flightcrew Procedures During Taxi Operations',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 91-74B.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2015-10-08',
                          'FAA',
                          'Advisory Circular 91-74B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC%2000-46E.pdf',
                          '2017-12-22 18:19:05',
                          'Aviation Safety Reporting Program',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 00-46E.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2011-12-16',
                          'FAA',
                          'Advisory Circular 00-46E'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC%2091-73B.pdf',
                          '2017-12-22 18:13:13',
                          'Parts 91 and 135 Single Pilot, Flight School Procedures During Taxi Operations',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 91-73B.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2012-07-30',
                          'FAA',
                          'Advisory Circular 91-73B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_91-74B.pdf',
                          '2017-12-22 18:17:19',
                          'Pilot Guide: Flight In Icing Conditions',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 102-74B.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2012-07-30',
                          'FAA',
                          'Advisory Circular 102-74B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentlibrary/media/advisory_circular/ac%2000-24c.pdf',
                          '2017-12-22 18:13:13',
                          'Thunderstorms',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 00-24C.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2013-02-19',
                          'FAA',
                          'Advisory Circular 00-24C'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_61-138.pdf',
                          '2017-12-22 18:02:26',
                          'Airline Transport Pilot Certification Training Program (Change 1)',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 61-138.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2013-07-02',
                          'FAA',
                          'Advisory Circular 61-138'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_90-23G.pdf',
                          '2017-12-22 18:02:27',
                          'Aircraft Wake Turbulence',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 90-23G.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2014-02-10',
                          'FAA',
                          'Advisory Circular 90-23G'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_00-63A.pdf',
                          '2017-12-22 18:02:28',
                          'Use of Cockpit Displays of Digital Weather and Aeronautical Information - Including Change 1',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 00-63A.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2014-07-04',
                          'FAA',
                          'Advisory Circular 00-63A'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_120-76C.pdf',
                          '2017-12-22 18:02:28',
                          'Guidelines for the Certification, Airworthiness, and Operational Use of Electronic Flight Bags',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 120-76C.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2014-05-09',
                          'FAA',
                          'Advisory Circular 120-76C'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'http://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_91.21-1D.pdf',
                          '2017-12-22 18:02:28',
                          'Use of Portable Electronic Devices Aboard Aircraft ',
                          'Advisory Circular',
                          'Current',
                          'Advisory Circular 91.21-1D.pdf',
                          '{USERDATA}/FAA/Advisory Circulars',
                          '2017-10-27',
                          'FAA',
                          'Advisory Circular 91.21-1D'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/airplane_handbook/media/airplane_flying_handbook.pdf',
                          NULL,
                          'Airplane Flying Handbook',
                          'FAA-H-8083-3B',
                          'New',
                          'Airplane Flying Handbook-FAA-H-8083-3B.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '2016-01-01',
                          'FAA',
                          'Airplane Flying Handbook-FAA-H-8083-3B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/media/00-80T-80.pdf',
                          NULL,
                          'Aerodynamics for Navy Aviators',
                          'NAVAIR 00-80T-80',
                          'New',
                          'Aerodynamics for Navy Aviators-NAVAIR 00-80T-80.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '1956-01-01',
                          'FAA',
                          'Aerodynamics for Navy Aviators-NAVAIR 00-80T-80'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/phak/media/pilot_handbook.pdf',
                          NULL,
                          'Pilot’s Handbook of Aeronautical Knowledge',
                          'FAA-H-8083-25B',
                          'New',
                          'Pilot’s Handbook of Aeronautical Knowledge-FAA-H-8083-25B.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '2016-01-01',
                          'FAA',
                          'Pilot’s Handbook of Aeronautical Knowledge-FAA-H-8083-25B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/instrument_procedures_handbook/media/FAA-H-8083-16B.pdf',
                          NULL,
                          'Instrument Procedures Handbook',
                          'FAA-H-8083-16B',
                          'New',
                          'Instrument Procedures Handbook-FAA-H-8083-16B.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '2017-09-01',
                          'FAA',
                          'Instrument Procedures Handbook-FAA-H-8083-16B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/media/ifh_errata.pdf',
                          NULL,
                          'Instrument Flying Handbook Errata Sheet ',
                          'FAA-H-8083-15B',
                          'New',
                          'Instrument Flying Handbook Errata Sheet-FAA-H-8083-15B.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '2014-10-10',
                          'FAA',
                          'Instrument Flying Handbook Errata Sheet-FAA-H-8083-15B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/aviation_instructors_handbook/media/FAA-H-8083-9A.pdf',
                          NULL,
                          'Aviation Instructor''s Handbook',
                          'FAA-H-8083-9A',
                          'New',
                          'Aviation Instructor''s Handbook-FAA-H-8083-9A.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '2008-01-01',
                          'FAA',
                          'Aviation Instructor''s Handbook-FAA-H-8083-9A'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/media/FAA-H-8083-15B.pdf',
                          NULL,
                          'Instrument Flying Handbook',
                          'FAA-H-8083-15B',
                          'New',
                          'Instrument Flying Handbook-FAA-H-8083-15B.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '2012-01-01',
                          'FAA',
                          'Instrument Flying Handbook-FAA-H-8083-15B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/media/ifh_addendum.pdf',
                          NULL,
                          'Instrument Flying Handbook Addendum',
                          'FAA-H-8083-15B',
                          'New',
                          'Instrument Flying Handbook Addendum-FAA-H-8083-15B.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '2015-04-10',
                          'FAA',
                          'Instrument Flying Handbook Addendum-FAA-H-8083-15B'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/media/remote_pilot_study_guide.pdf',
                          NULL,
                          'Remote Pilot — Small Unmanned Aircraft Systems Study Guide',
                          'FAA-G-8082-22',
                          'New',
                          'Remote Pilot — Small Unmanned Aircraft Systems Study Guide-FAA-G-8082-22.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '2016-08-18',
                          'FAA',
                          'Remote Pilot — Small Unmanned Aircraft Systems Study Guide-FAA-G-8082-22'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/regulations_policies/handbooks_manuals/aviation/media/airship_pilot_manual.pdf',
                          NULL,
                          'Airship Pilot Manual',
                          'USN',
                          'New',
                          'Airship Pilot Manual-USN.pdf',
                          '{USERDATA}/FAA/Regulations & Policies',
                          '1942-01-01',
                          'FAA',
                          'Airship Pilot Manual-USN'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_guides/media/FAA-G-8082-5H.pdf',
                          NULL,
                          'Commercial Pilot Knowledge Test Guide ',
                          'FAA-G-8082-5H',
                          'New',
                          'Commercial Pilot Knowledge Test Guide .pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2017-02-01',
                          'FAA',
                          'Commercial Pilot Knowledge Test Guide '
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_guides/media/FAA-G-8082-1.pdf',
                          NULL,
                          'Airline Transport Pilot, Aircraft Dispatcher, and Flight Navigator Knowledge Test Guide',
                          'FAA-G-8082-1',
                          'New',
                          'Airline Transport Pilot, Aircraft Dispatcher, and Flight Navigator Knowledge Test Guide.pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2017-02-01',
                          'FAA',
                          'Airline Transport Pilot, Aircraft Dispatcher, and Flight Navigator Knowledge Test Guide'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_guides/media/FAA-G-8082-7I.pdf',
                          NULL,
                          'Flight and Ground Instructor Knowledge Test Guide',
                          'FAA-G-8082-7I',
                          'New',
                          'Flight and Ground Instructor Knowledge Test Guide.pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2017-02-01',
                          'FAA',
                          'Flight and Ground Instructor Knowledge Test Guide'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_guides/media/FAA-G-8082-4D.pdf',
                          NULL,
                          'Sport Pilot and Flight Instructor with a Sport Pilot Rating Knowledge Test Guide',
                          'FAA-G-8082-4D',
                          'New',
                          'Sport Pilot and Flight Instructor with a Sport Pilot Rating Knowledge Test Guide.pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2017-02-01',
                          'FAA',
                          'Sport Pilot and Flight Instructor with a Sport Pilot Rating Knowledge Test Guide'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_guides/media/FAA-G-8082-13I.pdf',
                          NULL,
                          'Instrument Rating Knowledge Test Guide',
                          'FAA-G-8082-13I',
                          'New',
                          'Instrument Rating Knowledge Test Guide.pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2017-02-01',
                          'FAA',
                          'Instrument Rating Knowledge Test Guide'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_guides/media/remote_pilot_ktg.pdf',
                          NULL,
                          'Remote Pilot Knowledge Test Guide',
                          'FAA
-G-8082
-20',
                          'New',
                          'Remote Pilot Knowledge Test Guide.pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2017-02-01',
                          'FAA',
                          'Remote Pilot Knowledge Test Guide'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/acs/media/private_airplane_acs_6A.pdf',
                          NULL,
                          'Private Pilot - Airplane Airman Certification Standards (Change 1) ',
                          'FAA-S-ACS-6A',
                          'New',
                          'Private Pilot - Airplane Airman Certification Standards (Change 1) .pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2017-06-12',
                          'FAA',
                          'Private Pilot - Airplane Airman Certification Standards (Change 1) '
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/acs/media/commercial_airplane_acs.pdf',
                          NULL,
                          'Commercial Pilot Airman Certification Standards (Change 2)',
                          'FAA-S-ACS-7',
                          'New',
                          'Commercial Pilot Airman Certification Standards (Change 2).pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2017-06-01',
                          'FAA',
                          'Commercial Pilot Airman Certification Standards (Change 2)'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_standards/media/atp_pts.pdf',
                          NULL,
                          'Airline Transport Pilot and Aircraft Type Rating Practical Test Standards for Airplane ( with Changes 1, 2, 3, 4, 5, 6 & 7) ',
                          'FAA-S-8081-5F',
                          'New',
                          'Airline Transport Pilot and Aircraft Type Rating Practical Test Standards for Airplane ( with Changes 1, 2, 3, 4, 5, 6 & 7) .pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2016-07-27',
                          'FAA',
                          'Airline Transport Pilot and Aircraft Type Rating Practical Test Standards for Airplane ( with Changes 1, 2, 3, 4, 5, 6 & 7) '
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_standards/media/faa-s-8081-20.pdf',
                          NULL,
                          'Airline Transport Pilot Practical Test Standards for Helicopter ( with Changes 1, 2, 3, and 4)',
                          'FAA-S-8081-20',
                          'New',
                          'Airline Transport Pilot Practical Test Standards for Helicopter ( with Changes 1, 2, 3, and 4).pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2014-07-02',
                          'FAA',
                          'Airline Transport Pilot Practical Test Standards for Helicopter ( with Changes 1, 2, 3, and 4)'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_standards/media/FAA-S-8081-6D.pdf',
                          NULL,
                          'Flight Instructor Practical Test Standards for Airplane ( with Changes 1, 2, 3, 4, and 5)',
                          'FAA-S-8081-6D',
                          'New',
                          'Flight Instructor Practical Test Standards for Airplane ( with Changes 1, 2, 3, 4, and 5).pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2016-06-17',
                          'FAA',
                          'Flight Instructor Practical Test Standards for Airplane ( with Changes 1, 2, 3, 4, and 5)'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_standards/media/FAA-S-8081-3a.pdf',
                          NULL,
                          'Recreational Pilot Practical Test Standards for Airplane, Rotorcraft/Helicopter, and Rotorcraft/Gyroplane',
                          'FAA-S-8081-3A',
                          'New',
                          'Recreational Pilot Practical Test Standards for Airplane, Rotorcraft/Helicopter, and Rotorcraft/Gyroplane.pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2006-08-01',
                          'FAA',
                          'Recreational Pilot Practical Test Standards for Airplane, Rotorcraft/Helicopter, and Rotorcraft/Gyroplane'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_standards/media/faa-s-8081-29.pdf',
                          NULL,
                          'Sport Pilot Practical Test Standards for Airplane, Gyroplane, Glider, and Flight Instructor ( with Change 3)',
                          'FAA-S-8081-29',
                          'New',
                          'Sport Pilot Practical Test Standards for Airplane, Gyroplane, Glider, and Flight Instructor ( with Change 3).pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2014-05-02',
                          'FAA',
                          'Sport Pilot Practical Test Standards for Airplane, Gyroplane, Glider, and Flight Instructor ( with Change 3)'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/acs/media/instrument_rating_acs_8A.pdf',
                          NULL,
                          'Instrument Rating – Airplane Airman Certification Standards',
                          'FAA-S-ACS-8A',
                          'New',
                          'Instrument Rating – Airplane Airman Certification Standards.pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2013-09-11',
                          'FAA',
                          'Instrument Rating – Airplane Airman Certification Standards'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_standards/media/instrument_rating_pts_change5.pdf',
                          NULL,
                          'Instrument Rating Practical Test Standards for Airplane, Helicopter, and Powered Lift (with Changes 1, 2, 3, 4, & 5) ',
                          'FAA-S-8081-4E ',
                          'New',
                          'Instrument Rating Practical Test Standards for Airplane, Helicopter, and Powered Lift (with Changes 1, 2, 3, 4, & 5) .pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2013-09-11',
                          'FAA',
                          'Instrument Rating Practical Test Standards for Airplane, Helicopter, and Powered Lift (with Changes 1, 2, 3, 4, & 5) '
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.faa.gov/training_testing/testing/test_standards/media/FAA-S-8081-7B.pdf',
                          NULL,
                          'Flight Instructor Practical Test Standards for Rotorcraft (Helicopter, Gyroplane) ( with Changes 1, 2 & 3)',
                          'FAA-S-8081-7B',
                          'New',
                          'Flight Instructor Practical Test Standards for Rotorcraft (Helicopter, Gyroplane) ( with Changes 1, 2 & 3).pdf',
                          '{USERDATA}/FAA/Training & Testing',
                          '2016-07-26',
                          'FAA',
                          'Flight Instructor Practical Test Standards for Rotorcraft (Helicopter, Gyroplane) ( with Changes 1, 2 & 3)'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://prd-tnm.s3.amazonaws.com/StagedProducts/Maps/USTopo/1/27537/8777349.pdf',
                          NULL,
                          'USGS US Topo 7.5-minute map for Bluffton, SC 2017',
                          'USGS US Topo',
                          'New',
                          'USGS US Topo 7.5-minute map for Bluffton, SC 2017.pdf',
                          '{USERDATA}/Topo Maps',
                          '2017-07-18',
                          'USGS',
                          'USGS US Topo 7.5-minute map for Bluffton, SC 2017'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/lightLists/LightList%20V5.pdf',
                          '2017-12-22 16:53:21',
                          'Light List Western Rivers',
                          'LightList',
                          'Current',
                          'USCG Light List District 5.pdf',
                          '{USERDATA}/USCG/LightLists',
                          '2017-01-01',
                          'USCG',
                          'USCG Light List District 5'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/lightLists/LightList%20V4.pdf',
                          '2017-12-22 16:53:28',
                          'Light List Gulf Coast',
                          'LightList',
                          'Current',
                          'USCG Light List District 4.pdf',
                          '{USERDATA}/USCG/LightLists',
                          '2017-01-01',
                          'USCG',
                          'USCG Light List District 4'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/lightLists/LightList%20V1.pdf',
                          '2017-12-22 16:53:36',
                          'Light List Noretheast Atlantic',
                          'LightList',
                          'Current',
                          'USCG Light List District 1.pdf',
                          '{USERDATA}/USCG/LightLists',
                          '2017-01-01',
                          'USCG',
                          'USCG Light List District 1'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/lightLists/LightList%20V2.pdf',
                          '2017-12-22 16:53:44',
                          'Light List Mid Atlantic',
                          'LightList',
                          'Current',
                          'USCG Light List District 2.pdf',
                          '{USERDATA}/USCG/LightLists',
                          '2017-01-01',
                          'USCG',
                          'USCG Light List District 2'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/lightLists/LightList%20V3.pdf',
                          '2017-12-22 16:53:51',
                          'Light List Southern Atlantic Region',
                          'LightList',
                          'Current',
                          'USCG Light List District 3.pdf',
                          '{USERDATA}/USCG/LightLists',
                          '2017-01-01',
                          'USCG',
                          'USCG Light List District 3'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/lightLists/LightList%20V6.pdf',
                          '2017-12-22 16:54:03',
                          'Light List Pacific Coast',
                          'LightList',
                          'Current',
                          'USCG Light List District 6.pdf',
                          '{USERDATA}/USCG/LightLists',
                          '2017-01-01',
                          'USCG',
                          'USCG Light List District 6'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/navRules/CG_NRHB_20151130_Corrigendum.pdf',
                          NULL,
                          'Corrigendum (record of changes) to the USCG Navigation Rules and Regulations Handbook',
                          'NavRules',
                          'New',
                          'NavRules Updates.pdf',
                          '{USERDATA}/USCG',
                          '2015-11-30',
                          'USCG',
                          'NavRules Updates'
                      );

INSERT INTO Documents (
                          URL,
                          DateRetrieved,
                          Description,
                          DocumentType,
                          DownloadStatus,
                          Filename,
                          Path,
                          PublicationDate,
                          Source,
                          Title
                      )
                      VALUES (
                          'https://www.navcen.uscg.gov/pdf/lightLists/LightList%20V7.pdf',
                          '2017-12-22 16:54:03',
                          'Light List Pacific Coast',
                          'LightList',
                          'Current',
                          'USCG Light List District 5.pdf',
                          '{USERDATA}/USCG/LightLists',
                          '2017-01-01',
                          'USCG',
                          'USCG Light List District 7'
                      );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
