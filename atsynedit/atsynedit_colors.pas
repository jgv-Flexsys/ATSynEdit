unit ATSynEdit_Colors;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics;

type
  TATSynEditColors = class(TPersistent)
  private
    FTextFont,
    FTextBG,
    FTextDisabledFont,
    FTextDisabledBG,
    FTextSelFont,
    FTextSelBG,
    FCaret,
    FMarkers,
    FGutterFont,
    FGutterBG,
    FGutterCaretBG,
    FGutterPlusBorder,
    FGutterPlusBG,
    FGutterFoldLine,
    FGutterFoldBG,
    FGutterSeparatorBG,
    FCurrentLineBG,
    FMarginRight,
    FMarginCaret,
    FMarginUser,
    FIndentVertLines,
    FBookmarkBG,
    FRulerFont,
    FRulerBG,
    FCollapseLine,
    FCollapseMarkFont,
    FCollapseMarkBG,
    FCollapseMarkBorder,
    FUnprintedFont,
    FUnprintedBG,
    FUnprintedHexFont,
    FMinimapBorder,
    FMinimapSelBG,
    FStateChanged,
    FStateAdded,
    FStateSaved,
    FTextHintFont,
    FBlockStaple,
    FBlockSepLine,
    FLockedBG,
    FMarkedLinesBG,
    FComboboxArrow,
    FComboboxArrowBG: TColor;
  published
    property TextFont: TColor read FTextFont write FTextFont;
    property TextBG: TColor read FTextBG write FTextBG;
    property TextDisabledFont: TColor read FTextDisabledFont write FTextDisabledFont;
    property TextDisabledBG: TColor read FTextDisabledBG write FTextDisabledBG;
    property TextSelFont: TColor read FTextSelFont write FTextSelFont;
    property TextSelBG: TColor read FTextSelBG write FTextSelBG;
    property Caret: TColor read FCaret write FCaret;
    property Markers: TColor read FMarkers write FMarkers;
    property GutterFont: TColor read FGutterFont write FGutterFont;
    property GutterBG: TColor read FGutterBG write FGutterBG;
    property GutterCaretBG: TColor read FGutterCaretBG write FGutterCaretBG;
    property GutterPlusBorder: TColor read FGutterPlusBorder write FGutterPlusBorder;
    property GutterPlusBG: TColor read FGutterPlusBG write FGutterPlusBG;
    property GutterFoldLine: TColor read FGutterFoldLine write FGutterFoldLine;
    property GutterFoldBG: TColor read FGutterFoldBG write FGutterFoldBG;
    property GutterSeparatorBG: TColor read FGutterSeparatorBG write FGutterSeparatorBG;
    property CurrentLineBG: TColor read FCurrentLineBG write FCurrentLineBG;
    property MarginRight: TColor read FMarginRight write FMarginRight;
    property MarginCaret: TColor read FMarginCaret write FMarginCaret;
    property MarginUser: TColor read FMarginUser write FMarginUser;
    property IndentVertLines: TColor read FIndentVertLines write FIndentVertLines;
    property BookmarkBG: TColor read FBookmarkBG write FBookmarkBG;
    property RulerFont: TColor read FRulerFont write FRulerFont;
    property RulerBG: TColor read FRulerBG write FRulerBG;
    property CollapseLine: TColor read FCollapseLine write FCollapseLine;
    property CollapseMarkFont: TColor read FCollapseMarkFont write FCollapseMarkFont;
    property CollapseMarkBG: TColor read FCollapseMarkBG write FCollapseMarkBG;
    property CollapseMarkBorder: TColor read FCollapseMarkBorder write FCollapseMarkBorder;
    property UnprintedFont: TColor read FUnprintedFont write FUnprintedFont;
    property UnprintedBG: TColor read FUnprintedBG write FUnprintedBG;
    property UnprintedHexFont: TColor read FUnprintedHexFont write FUnprintedHexFont;
    property MinimapBorder: TColor read FMinimapBorder write FMinimapBorder;
    property MinimapSelBG: TColor read FMinimapSelBG write FMinimapSelBG;
    property StateChanged: TColor read FStateChanged write FStateChanged;
    property StateAdded: TColor read FStateAdded write FStateAdded;
    property StateSaved: TColor read FStateSaved write FStateSaved;
    property BlockStaple: TColor read FBlockStaple write FBlockStaple;
    property BlockSepLine: TColor read FBlockSepLine write FBlockSepLine;
    property LockedBG: TColor read FLockedBG write FLockedBG;
    property TextHintFont: TColor read FTextHintFont write FTextHintFont;
    property MarkedLinesBG: TColor read FMarkedLinesBG write FMarkedLinesBG;
    property ComboboxArrow: TColor read FComboboxArrow write FComboboxArrow;
    property ComboboxArrowBG: TColor read FComboboxArrowBG write FComboboxArrowBG;
  end;

procedure InitDefaultColors(C: TATSynEditColors);


implementation

procedure InitDefaultColors(C: TATSynEditColors);
begin
  C.TextFont:= clBlack;
  C.TextBG:= clWhite;
  C.TextSelFont:= clHighlightText;
  C.TextSelBG:= clHighlight;
  C.TextDisabledFont:= clGray;
  C.TextDisabledBG:= $f0f0f0;
  C.Caret:= clBlack;
  C.Markers:= $0000c0;
  C.GutterFont:= clGray;
  C.GutterBG:= $e0e0e0;
  C.GutterCaretBG:= $c8c8c8;
  C.GutterPlusBorder:= clGray;
  C.GutterPlusBG:= $f4f4f4;
  C.GutterFoldLine:= clGray;
  C.GutterFoldBG:= $c8c8c8;
  C.GutterSeparatorBG:= clBlack;
  C.CurrentLineBG:= $e0f0f0;
  C.BookmarkBG:= clMoneyGreen;
  C.RulerBG:= C.GutterBG;
  C.RulerFont:= clGray;
  C.CollapseLine:= $a06060;
  C.CollapseMarkFont:= $e08080;
  C.CollapseMarkBG:= clCream;
  C.CollapseMarkBorder:= $e08080;
  C.MarginRight:= clLtGray;
  C.MarginCaret:= clLime;
  C.MarginUser:= clYellow;
  C.IndentVertLines:= clMedGray;
  C.UnprintedFont:= $5050f0;
  C.UnprintedBG:= $e0e0e0;
  C.UnprintedHexFont:= clMedGray;
  C.MinimapBorder:= clLtGray;
  C.MinimapSelBG:= $eeeeee;
  C.StateChanged:= $00f0f0;
  C.StateAdded:= $20c020;
  C.StateSaved:= clMedGray;
  C.TextHintFont:= clGray;
  C.BlockStaple:= clMedGray;
  C.BlockSepLine:= clMedGray;
  C.LockedBG:= $e0e0e0;
  C.MarkedLinesBG:= $f0e0b0;
  C.ComboboxArrow:= clGray;
  C.ComboboxArrowBG:= $f0f0f0;
end;

end.

