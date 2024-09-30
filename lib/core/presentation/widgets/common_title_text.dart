import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scalers_demo/core/constants/app_colors.dart';
import 'package:scalers_demo/core/constants/app_constants.dart';

class CommonTitleText extends StatelessWidget {
  final String textKey;
  final Color? textColor;
  final FontWeight textWeight;
  final double textFontSize;
  final double minTextFontSize;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow textOverflow;
  final TextDecoration? textDecoration;
  final double? textHeight;
  final String? fontFamily;

  const CommonTitleText({
    super.key,
    required this.textKey,
    this.textColor,
    this.textWeight = FontWeight.w600,
    this.textFontSize = AppConstants.fontSize16,
    this.minTextFontSize = 9,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.textOverflow = TextOverflow.visible,
    this.textHeight = 1.3,
    this.textDecoration,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      textKey,
      overflow: TextOverflow.ellipsis,
      minFontSize: minTextFontSize,
      textAlign: textAlign,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: textColor ?? AppColors.blackColor,
            fontSize: textFontSize,
            fontWeight: textWeight,
            overflow: textOverflow,
            decoration: textDecoration,
            height: textHeight,
            fontFamily: fontFamily ?? AppConstants.iBMPlexSansArabicRegular,
          ),
    );
  }
}

// class CommonTitleText extends StatelessWidget {
//   const CommonTitleText({
//     required this.textKey,
//     super.key,
//     this.textStyle,
//     this.strutStyle,
//     this.textAlign,
//     this.textDirection,
//     this.locale,
//     this.softWrap,
//     this.textOverflow,
//     this.textScaleFactor,
//     this.maxLines,
//     this.semanticsLabel,
//     this.textWidthBasis,
//     this.textHeightBehavior,
//     this.selectionColor,
//   }) : textSpan = null;

//   const CommonTitleText.rich(
//     InlineSpan this.textSpan, {
//     required this.textKey,
//     super.key,
//     this.textStyle,
//     this.strutStyle,
//     this.textAlign,
//     this.textDirection,
//     this.locale,
//     this.softWrap,
//     this.textOverflow,
//     this.textScaleFactor,
//     this.maxLines,
//     this.semanticsLabel,
//     this.textWidthBasis,
//     this.textHeightBehavior,
//     this.selectionColor,
//   });

//   final String textKey;

//   final InlineSpan? textSpan;

//   final TextStyle? textStyle;

//   final StrutStyle? strutStyle;

//   final TextAlign? textAlign;

//   final TextDirection? textDirection;

//   final Locale? locale;

//   final bool? softWrap;

//   final TextOverflow? textOverflow;

//   final double? textScaleFactor;

//   final int? maxLines;

//   final String? semanticsLabel;

//   final TextWidthBasis? textWidthBasis;

//   final ui.TextHeightBehavior? textHeightBehavior;

//   final Color? selectionColor;

//   @override
//   Widget build(BuildContext context) {
//     final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
//     TextStyle? effectiveTextStyle = textStyle;
//     if (textStyle == null || textStyle!.inherit) {
//       effectiveTextStyle = defaultTextStyle.style.merge(textStyle);
//     }
//     if (MediaQuery.boldTextOf(context)) {
//       effectiveTextStyle = effectiveTextStyle!.merge(const TextStyle(fontWeight: FontWeight.bold));
//     }
//     final SelectionRegistrar? registrar = SelectionContainer.maybeOf(context);
//     Widget result = RichText(
//       textAlign: textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start,
//       textDirection:
//           textDirection, // RichText uses Directionality.of to obtain a default if this is null.
//       locale: locale, // RichText uses Localizations.localeOf to obtain a default if this is null
//       softWrap: softWrap ?? defaultTextStyle.softWrap,
//       overflow: textOverflow ?? effectiveTextStyle?.overflow ?? defaultTextStyle.overflow,
//       maxLines: maxLines ?? defaultTextStyle.maxLines,
//       textScaler: TextScaler.linear(textScaleFactor ?? 1.0),
//       strutStyle: strutStyle,
//       textWidthBasis: textWidthBasis ?? defaultTextStyle.textWidthBasis,
//       textHeightBehavior: textHeightBehavior ??
//           defaultTextStyle.textHeightBehavior ??
//           DefaultTextHeightBehavior.maybeOf(context),
//       selectionRegistrar: registrar,
//       selectionColor: selectionColor ??
//           DefaultSelectionStyle.of(context).selectionColor ??
//           DefaultSelectionStyle.defaultColor,
//       text: TextSpan(
//         style: effectiveTextStyle,
//         text: textKey,
//         children: textSpan != null ? <InlineSpan>[textSpan!] : null,
//       ),
//     );
//     if (registrar != null) {
//       result = MouseRegion(
//         cursor: DefaultSelectionStyle.of(context).mouseCursor ?? SystemMouseCursors.text,
//         child: result,
//       );
//     }
//     if (semanticsLabel != null) {
//       result = Semantics(
//         textDirection: textDirection,
//         label: semanticsLabel,
//         child: ExcludeSemantics(
//           child: result,
//         ),
//       );
//     }
//     return result;
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(StringProperty('data', textKey, showName: false));
//     if (textSpan != null) {
//       properties.add(
//           textSpan!.toDiagnosticsNode(name: 'textSpan', style: DiagnosticsTreeStyle.transition));
//     }
//     textStyle?.debugFillProperties(properties);
//     properties.add(EnumProperty<TextAlign>('textAlign', textAlign, defaultValue: null));
//     properties.add(EnumProperty<TextDirection>('textDirection', textDirection, defaultValue: null));
//     properties.add(DiagnosticsProperty<Locale>('locale', locale, defaultValue: null));
//     properties.add(FlagProperty('softWrap',
//         value: softWrap,
//         ifTrue: 'wrapping at box width',
//         ifFalse: 'no wrapping except at line break characters',
//         showName: true));
//     properties.add(EnumProperty<TextOverflow>('overflow', textOverflow, defaultValue: null));
//     properties.add(DoubleProperty('textScaleFactor', textScaleFactor, defaultValue: null));
//     properties.add(IntProperty('maxLines', maxLines, defaultValue: null));
//     properties
//         .add(EnumProperty<TextWidthBasis>('textWidthBasis', textWidthBasis, defaultValue: null));
//     properties.add(DiagnosticsProperty<ui.TextHeightBehavior>(
//         'textHeightBehavior', textHeightBehavior,
//         defaultValue: null));
//     if (semanticsLabel != null) {
//       properties.add(StringProperty('semanticsLabel', semanticsLabel));
//     }
//   }
// }
