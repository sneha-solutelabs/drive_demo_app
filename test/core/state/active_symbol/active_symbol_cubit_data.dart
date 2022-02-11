import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

final List<ActiveSymbol> activeSymbols = <ActiveSymbol>[
  ActiveSymbol(
    isTradingSuspended: false,
    market: 'indices',
    marketDisplayName: 'Stock Indices',
    pip: 0.01,
    submarket: 'americas_OTC',
    submarketDisplayName: 'Americas',
    symbol: 'OTC_DJI',
    symbolType: 'stockindex',
    displayName: 'Wall Street Index'
  ),
  ActiveSymbol(
      isTradingSuspended: false,
      market: 'forex',
      marketDisplayName: 'Forex',
      pip: 0.01,
      submarket: 'minor_pairs',
      submarketDisplayName: 'Minor Pairs',
      symbol: 'frxUSDMXN',
      symbolType: 'forex',
      displayName: 'USD/MXN'
  ),
  ActiveSymbol(
      isTradingSuspended: false,
      market: 'forex',
      marketDisplayName: 'Forex',
      pip: 0.00001,
      submarket: 'major_pairs',
      submarketDisplayName: 'Major Pairs',
      symbol: 'frxUSDCHF',
      symbolType: 'forex',
      displayName: 'USD/CHF'
  ),
];

