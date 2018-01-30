--
-- File generated with SQLiteStudio v3.1.1 on Fri Dec 22 19:08:18 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: AllTopoMaps
DROP TABLE IF EXISTS AllTopoMaps;

CREATE TABLE AllTopoMaps (
    Series              VARCHAR,
    Version             VARCHAR,
    CellID              INTEGER,
    MapName             VARCHAR,
    PrimaryState        VARCHAR,
    Scale               INTEGER,
    DateOnMap           INTEGER,
    ImprintYear         INTEGER,
    WoodlandTint        VARCHAR (1),
    VisualVersionNumber INTEGER,
    PhotoInspectionYear INTEGER,
    PhotoRevisionYear   INTEGER,
    AerialPhotoYear     INTEGER,
    EditYear            INTEGER,
    FieldCheckYear      INTEGER,
    SurveyYear          INTEGER,
    Datum               VARCHAR,
    Projection          VARCHAR,
    Advance             VARCHAR (1),
    Preliminary         VARCHAR (1),
    Provisional         VARCHAR (1),
    Interim             VARCHAR (1),
    Planimetric         VARCHAR (1),
    SpecialPrinting     VARCHAR (1),
    SpecialMap          VARCHAR (1),
    ShadedRelief        VARCHAR (1),
    Orthophoto          VARCHAR,
    PubUSGS             VARCHAR (1),
    PubArmyCorpsEng     VARCHAR (1),
    PubArmyMap          VARCHAR (1),
    PubForestServ       VARCHAR (1),
    PubMilitaryOther    VARCHAR (1),
    PubReclamation      VARCHAR (1),
    PubWarDept          VARCHAR (1),
    PubBurLandMgmt      VARCHAR (1),
    PubNatlParkServ     VARCHAR (1),
    PubIndianAffairs    VARCHAR (1),
    PubEPA              VARCHAR (1),
    PubTennValleyAuth   VARCHAR (1),
    PubUSCommerce       VARCHAR (1),
    Keywords            VARCHAR,
    MapLanguage         VARCHAR,
    ScannerResolution   INTEGER,
    CellName            VARCHAR,
    PrimaryStateName    VARCHAR,
    NLat                REAL,
    WLong               REAL,
    SLat                REAL,
    ELong               REAL,
    LinktoHTMCMetadata  VARCHAR,
    DownloadGeoPDF      VARCHAR,
    ViewFGDCMetadataXML VARCHAR,
    ViewThumbnailImage  VARCHAR,
    ScanID              INTEGER,
    GDAItemID           INTEGER     CONSTRAINT AllTopoMaps_PK PRIMARY KEY,
    CreateDate          VARCHAR,
    ByteCount           INTEGER,
    GridSize            VARCHAR,
    Download            VARCHAR (1) DEFAULT N,
    DownloadDate        DATETIME
);


-- Table: ChartSources
DROP TABLE IF EXISTS ChartSources;

CREATE TABLE ChartSources (
    name     VARCHAR (100),
    type     VARCHAR (5)   DEFAULT TBD,
    location VARCHAR (100),
    dir      VARCHAR (100),
    CONSTRAINT ChartSources_PK PRIMARY KEY (
        name,
        type
    )
    ON CONFLICT REPLACE
);


-- Table: CoastPilots
DROP TABLE IF EXISTS CoastPilots;

CREATE TABLE CoastPilots (
    Region         INTEGER       CONSTRAINT CoastPilots_PK PRIMARY KEY ON CONFLICT REPLACE,
    DateRetrieved  DATETIME,
    Description    VARCHAR (128),
    DownloadStatus VARCHAR (10)  NOT NULL
                                 DEFAULT New,
    DownloadURL    VARCHAR (80),
    Edition        INTEGER,
    Name           VARCHAR (20),
    ReleaseDate    DATE
);


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


-- Table: ENCCharts
DROP TABLE IF EXISTS ENCCharts;

CREATE TABLE ENCCharts (
    name                     VARCHAR (20)  CONSTRAINT ENCCharts_PK PRIMARY KEY ON CONFLICT REPLACE,
    cscale                   INTEGER,
    DownloadStatus           VARCHAR (5)   DEFAULT New,
    DateRetrieved            DATE          DEFAULT (CURRENT_TIMESTAMP),
    edtn                     INTEGER,
    isdt                     DATE,
    lname                    VARCHAR (100),
    src_chart                INTEGER,
    status                   VARCHAR (10),
    uadt                     DATE,
    updn                     INTEGER,
    zipfile_datetime         VARCHAR (15),
    zipfile_datetime_iso8601 VARCHAR (20),
    zipfile_location         VARCHAR (100),
    zipfile_size             INTEGER
);


-- Table: ENCCoastGuardDistricts
DROP TABLE IF EXISTS ENCCoastGuardDistricts;

CREATE TABLE ENCCoastGuardDistricts (
    ChartName            VARCHAR (20) CONSTRAINT ChartName_FK REFERENCES ENCCharts (name) ON DELETE CASCADE,
    coast_guard_district INTEGER,
    CONSTRAINT ENCCoastGuardDistricts_PK PRIMARY KEY (
        ChartName,
        coast_guard_district
    )
    ON CONFLICT REPLACE
);


-- Table: ENCCoverage
DROP TABLE IF EXISTS ENCCoverage;

CREATE TABLE ENCCoverage (
    ChartName VARCHAR (20) CONSTRAINT ENCCharts_FK REFERENCES ENCCharts (name) ON DELETE CASCADE,
    panel_no  INTEGER,
    lat       REAL,
    long      REAL,
    type      VARCHAR (5),
    CONSTRAINT ENCCoverage_UK PRIMARY KEY (
        ChartName,
        panel_no
    )
    ON CONFLICT REPLACE
);


-- Table: ENCLNMAgency
DROP TABLE IF EXISTS ENCLNMAgency;

CREATE TABLE ENCLNMAgency (
    ChartName  VARCHAR (20) CONSTRAINT ENCCharts_FK REFERENCES ENCCharts (name) ON DELETE CASCADE,
    lnm_agency VARCHAR (5),
    doc        INTEGER,-- latest published document through which the ENC is cleared
    date       DATE,
    CONSTRAINT ENCNMAgency_PK PRIMARY KEY (
        ChartName,
        lnm_agency,
        doc
    )
    ON CONFLICT REPLACE
);


-- Table: ENCNMAgency
DROP TABLE IF EXISTS ENCNMAgency;

CREATE TABLE ENCNMAgency (
    ChartName VARCHAR (20) CONSTRAINT ENCCharts_FK REFERENCES ENCCharts (name) ON DELETE CASCADE,
    nm_agency VARCHAR (5),
    doc       INTEGER,
    date      DATE,
    CONSTRAINT ENCNMAgency_PK PRIMARY KEY (
        ChartName,
        nm_agency,
        doc
    )
    ON CONFLICT REPLACE
);


-- Table: ENCRegions
DROP TABLE IF EXISTS ENCRegions;

CREATE TABLE ENCRegions (
    ChartName VARCHAR (20) CONSTRAINT ENCCharts_UK REFERENCES ENCCharts (name) ON DELETE CASCADE,
    region    INTEGER (2),
    CONSTRAINT ENCStates_PK PRIMARY KEY (
        ChartName,
        region
    )
    ON CONFLICT REPLACE
);


-- Table: ENCStates
DROP TABLE IF EXISTS ENCStates;

CREATE TABLE ENCStates (
    ChartName VARCHAR (20) CONSTRAINT ENCCharts_UK REFERENCES ENCCharts (name) ON DELETE CASCADE,
    state     VARCHAR (2),
    CONSTRAINT ENCStates_PK PRIMARY KEY (
        ChartName,
        state
    )
    ON CONFLICT REPLACE
);


-- Table: Locations
DROP TABLE IF EXISTS Locations;

CREATE TABLE Locations (
    chartName TEXT,
    loc       TEXT,
    loc_type  TEXT,
    CONSTRAINT Locations_PK PRIMARY KEY (
        chartName,
        loc
    )
    ON CONFLICT REPLACE
);


-- Table: Panels
DROP TABLE IF EXISTS Panels;

CREATE TABLE Panels (
    chartName     TEXT,
    file_name     TEXT,
    panel_no      TEXT,
    panel_title   TEXT,
    panel_type    TEXT,
    projection    TEXT,
    scale         INTEGER,
    sounding_unit TEXT,
    CONSTRAINT Panels_PK PRIMARY KEY (
        chartName,
        panel_no
    )
    ON CONFLICT REPLACE
);


-- Table: ProductCatalogs
DROP TABLE IF EXISTS ProductCatalogs;

CREATE TABLE ProductCatalogs (
    title         VARCHAR (50) CONSTRAINT ProductCatalogs_PK PRIMARY KEY ON CONFLICT REPLACE,
    date_created  DATE,
    date_valid    DATE,
    dt_valid      VARCHAR (20),
    ref_spec      VARCHAR (50),
    ref_spec_vers VARCHAR (5),
    s62AgencyCode VARCHAR (5),
    time_created  TIME,
    time_valid    TIME
);


-- Table: ProductCharts
DROP TABLE IF EXISTS ProductCharts;

CREATE TABLE ProductCharts (
    CatalogTitle VARCHAR (50) CONSTRAINT ProductCatalogs_FK REFERENCES ProductCatalogs (title) ON DELETE CASCADE,
    ChartName    VARCHAR (20),
    Directory    VARCHAR (50),
    CONSTRAINT ProductCharts_PK PRIMARY KEY (
        CatalogTitle,
        ChartName
    )
    ON CONFLICT REPLACE
);


-- Table: RNCCharts
DROP TABLE IF EXISTS RNCCharts;

CREATE TABLE RNCCharts (
    number                         VARCHAR (10)  CONSTRAINT ENCCharts_PK PRIMARY KEY ON CONFLICT REPLACE,
    DateRetrieved                  DATE          DEFAULT (CURRENT_TIMESTAMP),
    DownloadStatus                 VARCHAR (5)   DEFAULT New,
    format                         VARCHAR (50),
    horizontal_datum               VARCHAR (50),
    ntm_date                       DATE,
    ntm_edition                    INTEGER,
    ntm_edition_last_correction    INTEGER,
    raster_edition                 INTEGER,
    raster_edition_last_correction INTEGER,
    source_date                    DATE,
    source_edition                 INTEGER,
    source_edition_last_correction INTEGER,
    title                          VARCHAR (200),
    vertical_datum                 VARCHAR (50),
    zipfile_datetime               VARCHAR (15),
    zipfile_datetime_iso8601       VARCHAR (20),
    zipfile_location               VARCHAR (100),
    zipfile_size                   INTEGER
);


-- Table: RNCCoverage
DROP TABLE IF EXISTS RNCCoverage;

CREATE TABLE RNCCoverage (
    ChartNumber   INTEGER      CONSTRAINT RNCCharts_FK REFERENCES RNCCharts (number) ON DELETE CASCADE,
    panel_no      INTEGER,
    file_name     VARCHAR (50),
    lat           REAL,
    long          REAL,
    panel_title   VARCHAR (50),
    panel_type    VARCHAR (20),
    projection    VARCHAR (20),
    scale         INTEGER,
    sounding_unit VARCHAR (10),
    CONSTRAINT ENCCoverage_UK PRIMARY KEY (
        ChartNumber,
        panel_no
    )
    ON CONFLICT REPLACE
);


-- Table: TopoMaps
DROP TABLE IF EXISTS TopoMaps;

CREATE TABLE TopoMaps (
    Series              VARCHAR,
    Version             VARCHAR,
    CellID              INTEGER,
    MapName             VARCHAR,
    PrimaryState        VARCHAR,
    Scale               INTEGER,
    DateOnMap           INTEGER,
    ImprintYear         INTEGER,
    WoodlandTint        VARCHAR (1),
    VisualVersionNumber INTEGER,
    PhotoInspectionYear INTEGER,
    PhotoRevisionYear   INTEGER,
    AerialPhotoYear     INTEGER,
    EditYear            INTEGER,
    FieldCheckYear      INTEGER,
    SurveyYear          INTEGER,
    Datum               VARCHAR,
    Projection          VARCHAR,
    Advance             VARCHAR (1),
    Preliminary         VARCHAR (1),
    Provisional         VARCHAR (1),
    Interim             VARCHAR (1),
    Planimetric         VARCHAR (1),
    SpecialPrinting     VARCHAR (1),
    SpecialMap          VARCHAR (1),
    ShadedRelief        VARCHAR (1),
    Orthophoto          VARCHAR,
    PubUSGS             VARCHAR (1),
    PubArmyCorpsEng     VARCHAR (1),
    PubArmyMap          VARCHAR (1),
    PubForestServ       VARCHAR (1),
    PubMilitaryOther    VARCHAR (1),
    PubReclamation      VARCHAR (1),
    PubWarDept          VARCHAR (1),
    PubBurLandMgmt      VARCHAR (1),
    PubNatlParkServ     VARCHAR (1),
    PubIndianAffairs    VARCHAR (1),
    PubEPA              VARCHAR (1),
    PubTennValleyAuth   VARCHAR (1),
    PubUSCommerce       VARCHAR (1),
    Keywords            VARCHAR,
    MapLanguage         VARCHAR,
    ScannerResolution   INTEGER,
    CellName            VARCHAR,
    PrimaryStateName    VARCHAR,
    NLat                REAL,
    WLong               REAL,
    SLat                REAL,
    ELong               REAL,
    LinktoHTMCMetadata  VARCHAR,
    DownloadGeoPDF      VARCHAR,
    ViewFGDCMetadataXML VARCHAR,
    ViewThumbnailImage  VARCHAR,
    ScanID              INTEGER,
    GDAItemID           INTEGER      CONSTRAINT TopoMaps_PK PRIMARY KEY ON CONFLICT REPLACE,
    CreateDate          DATE,
    ByteCount           INTEGER,
    GridSize            VARCHAR,
    DateRetrieved       DATETIME,
    DownloadStatus      VARCHAR (10) DEFAULT New
);


-- Table: USACECharts
DROP TABLE IF EXISTS USACECharts;

CREATE TABLE USACECharts (
    name               VARCHAR (20)  CONSTRAINT ChartSources_PK PRIMARY KEY ON CONFLICT REPLACE,
    AreaNorth          REAL,
    AreaSouth          REAL,
    AreaEast           REAL,
    AreaWest           REAL,
    DateRetrieved      DATE          DEFAULT (CURRENT_TIMESTAMP),
    DownloadStatus     VARCHAR (5)   DEFAULT New,
    edition            VARCHAR (5),
    ENCLocation        VARCHAR (100),
    ENCdate_posted     DATE,
    ENCtime_posted     TIME,
    ENCfile_size       VARCHAR (10),
    KMLLocation        VARCHAR (100),
    KMLdate_posted     DATE,
    KMLtime_posted     TIME,
    KMLfile_size       VARCHAR (10),
    LocationFrom       VARCHAR (50),
    LocationTo         VARCHAR (50),
    MileageMarkerBegin INTEGER,
    MileageMarkerEnd   INTEGER,
    river_name         VARCHAR (20),
    SHPLocation        VARCHAR (100),
    SHPdate_posted     DATE,
    SHPtime_posted     TIME,
    SHPfile_size       VARCHAR (10) 
);


-- Table: Vertices
DROP TABLE IF EXISTS Vertices;

CREATE TABLE Vertices (
    chartName   TEXT,
    panel_no    TEXT,
    lat         REAL,
    long        REAL,
    pointNumber INTEGER,
    CONSTRAINT Vertices_PK PRIMARY KEY (
        chartName,
        panel_no,
        pointNumber
    )
    ON CONFLICT REPLACE
);


-- Trigger: ChartSources_Ins
DROP TRIGGER IF EXISTS ChartSources_Ins;
CREATE TRIGGER ChartSources_Ins
         AFTER INSERT
            ON ChartSources
      FOR EACH ROW
          WHEN new.type IS NULL OR 
               new.type = ''
BEGIN
    UPDATE ChartSources
       SET type = 'TBD'
     WHERE type IS NULL OR 
           new.type = '';
END;


-- Trigger: ENCChartView_UPD
DROP TRIGGER IF EXISTS ENCChartView_UPD;
CREATE TRIGGER ENCChartView_UPD
    INSTEAD OF UPDATE
            ON ENCChartView
BEGIN
    UPDATE ENCCHarts
       SET DateRetrieved = new.DAteRetrieved,
           DownloadStatus = new.DownloadStatus
     WHERE name = old.ChartName;
END;


-- Trigger: RNCChartView
DROP TRIGGER IF EXISTS RNCChartView;
CREATE TRIGGER RNCChartView
    INSTEAD OF UPDATE
            ON RNCChartView
BEGIN
    UPDATE RNCCHarts
       SET DateRetrieved = new.DAteRetrieved,
           DownloadStatus = new.DownloadStatus
     WHERE number = old.ChartName;
END;


-- Trigger: RNCChartView_UPD
DROP TRIGGER IF EXISTS RNCChartView_UPD;
CREATE TRIGGER RNCChartView_UPD
    INSTEAD OF UPDATE
            ON RNCChartView
BEGIN
    UPDATE RNCCHarts
       SET DateRetrieved = new.DAteRetrieved,
           DownloadStatus = new.DownloadStatus
     WHERE number = old.ChartName;
END;


-- Trigger: USACEChartView_UPD
DROP TRIGGER IF EXISTS USACEChartView_UPD;
CREATE TRIGGER USACEChartView_UPD
    INSTEAD OF UPDATE
            ON USACEChartView
BEGIN
    UPDATE USACECHarts
       SET DateRetrieved = new.DAteRetrieved,
           DownloadStatus = new.DownloadStatus
     WHERE name = old.ChartName;
END;


-- View: BoundingBox
DROP VIEW IF EXISTS BoundingBox;
CREATE VIEW BoundingBox AS
    SELECT MapName,
           PrimaryState,
           CellName,
           GDAItemID,
           Download
      FROM AllTopoMaps
     WHERE nlat BETWEEN 36.75 AND 39.625 AND 
           slat BETWEEN 36.75 AND 39.625 AND 
           elong BETWEEN -77.375 AND -75.25 AND 
           wlong BETWEEN -77.375 AND -75.25 AND 
           Version = 'Current'
     ORDER BY nlat,
              elong ASC;


-- View: ChartsToUpdate
DROP VIEW IF EXISTS ChartsToUpdate;
CREATE VIEW ChartsToUpdate AS
    SELECT 'ENCChartView' AS Tablename,
           a.DateRetrieved,
           a.DownloadStatus,
           a.ChartName,
           a.Title,
           a.LastAccessTime,
           a.CreationTime,
           a.LastWriteTime,
           a.URL,
           b.Directory
      FROM ENCChartView a
           JOIN
           ProductCharts b ON (a.ChartName = b.ChartName) 
     WHERE DownloadStatus IN ('Changed', 'New') 
    UNION
    SELECT 'RNCChartView' AS Tablename,
           a.DateRetrieved,
           a.DownloadStatus,
           a.ChartName,
           a.Title,
           a.LastAccessTime,
           a.CreationTime,
           a.LastWriteTime,
           a.URL,
           b.Directory
      FROM RNCChartView a
           JOIN
           ProductCharts b ON (a.ChartName = b.ChartName) 
     WHERE DownloadStatus IN ('Changed', 'New') 
    UNION
    SELECT 'USACEChartView' AS Tablename,
           a.DateRetrieved,
           a.DownloadStatus,
           a.ChartName,
           a.Title,
           a.LastAccessTime,
           a.CreationTime,
           a.LastWriteTime,
           a.URL,
           b.Directory
      FROM USACEChartView a
           JOIN
           ProductCharts b ON (a.ChartName = b.ChartName) 
     WHERE DownloadStatus IN ('Changed', 'New');


-- View: DocumentsToUpdate
DROP VIEW IF EXISTS DocumentsToUpdate;
CREATE VIEW DocumentsToUpdate AS
    SELECT *
      FROM Documents
     WHERE DownloadStatus IN ('New', 'Changed');


-- View: ENCChartView
DROP VIEW IF EXISTS ENCChartView;
CREATE VIEW ENCChartView AS
    SELECT 'ENCChartView' AS Viewname,
           a.DateRetrieved,
           a.DownloadStatus,
           a.name AS ChartName,
           a.lname AS Title,
           a.isdt AS LastAccessTime,
           a.uadt AS CreationTime,
           a.zipfile_datetime_iso8601 AS LastWriteTime,
           a.zipfile_location AS URL
      FROM ENCCharts a;


-- View: ToposToUpdate
DROP VIEW IF EXISTS ToposToUpdate;
CREATE VIEW ToposToUpdate AS
    SELECT *
      FROM AllTopoMaps
     WHERE Download = 'Y';


-- View: USACEChartView
DROP VIEW IF EXISTS USACEChartView;
CREATE VIEW USACEChartView AS
    SELECT 'USACEChartView' AS Tablename,
           a.DateRetrieved,
           a.DownloadStatus,
           a.name AS ChartName,
           a.river_name AS Title,
           a.ENCdate_posted AS LastAccessTime,
           a.ENCdate_posted AS CreationTime,
           a.ENCdate_posted || 'T' || ifnull(ENCtime_posted, '00:00') AS LastWriteTime,
           a.ENCLocation AS URL
      FROM USACECharts a;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
