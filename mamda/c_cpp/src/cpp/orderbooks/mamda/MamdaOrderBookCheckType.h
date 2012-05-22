/* $Id$
 *
 * OpenMAMA: The open middleware agnostic messaging API
 * Copyright (C) 2011 NYSE Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA
 */

#ifndef MamdaOrderBookCheckTypeH
#define MamdaOrderBookCheckTypeH

#include <mama/log.h>

namespace Wombat
{

    enum MamdaOrderBookCheckType
    {
        MAMDA_BOOK_CHECK_TYPE_NONE        = 0,
        MAMDA_BOOK_CHECK_TYPE_SNAPSHOT    = 1,
        MAMDA_BOOK_CHECK_TYPE_APPLY_DELTA = 2
    };

    MAMAExpDLL
    extern const char* mamdaOrderBookCheckTypeToString (
        MamdaOrderBookCheckType  type);

} // namespace

#endif // MamdaOrderBookCheckTypeH