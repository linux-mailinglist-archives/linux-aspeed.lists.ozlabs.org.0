Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A11A7726
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Apr 2020 11:16:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491fx44Jm4zDqRg
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Apr 2020 19:16:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491fwr2LNszDqHY
 for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Apr 2020 19:15:54 +1000 (AEST)
IronPort-SDR: QkD9ODMXBTZ0oX8QXVeWJA7hxDvXgyzsW2dNnTbpRzfpb7dGLpiZr+cbV8czl3Wo69odi25AIo
 1CclegoCbVog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 02:15:51 -0700
IronPort-SDR: XaAYwih13kluB8Qgni89e9NJqmeCKNVE2sToDlr5+9vgt6ce6+duySDm202IkG2rAZDr8JHY8B
 xm/SXmfn0eag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="241932506"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 14 Apr 2020 02:15:46 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOHfY-000UKW-Di; Tue, 14 Apr 2020 12:15:48 +0300
Date: Tue, 14 Apr 2020 12:15:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ernesto Corona <ernesto.corona@intel.com>
Subject: Re: [PATCH v29 6/6] drivers: jtag: Add JTAG core driver Maintainers
Message-ID: <20200414091548.GH34613@smile.fi.intel.com>
References: <20200413222920.4722-1-ernesto.corona@intel.com>
 <20200413222920.4722-7-ernesto.corona@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413222920.4722-7-ernesto.corona@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vadim Pasternak <vadimp@mellanox.com>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Jiri Pirko <jiri@mellanox.com>,
 Rgrs <rgrs@protonmail.com>, linux-arm-kernel@lists.infradead.org,
 Steven Filary <steven.a.filary@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Patrick Williams <patrickw3@fb.com>,
 "David S . Miller" <davem@davemloft.net>,
 Oleksandr Shamray <oleksandrs@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 13, 2020 at 03:29:20PM -0700, Ernesto Corona wrote:
> JTAG class driver provide infrastructure to support hardware/software
> JTAG platform drivers. It provide user layer API interface for flashing
> and debugging external devices which equipped with JTAG interface
> using standard transactions.

Don't forget to run
      scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS --order

> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Ernesto Corona <ernesto.corona@intel.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Jiri Pirko <jiri@mellanox.com>
> Cc: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Cc: Steven Filary <steven.a.filary@intel.com>
> Cc: Amithash Prasad <amithash@fb.com>
> Cc: Patrick Williams <patrickw3@fb.com>
> Cc: Rgrs <rgrs@protonmail.com>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64e5db31497..96d20fbb719c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9144,6 +9144,17 @@ L:	linux-serial@vger.kernel.org
>  S:	Orphan
>  F:	drivers/tty/serial/jsm/
>  
> +JTAG SUBSYSTEM
> +M:	Oleksandr Shamray <oleksandrs@mellanox.com>
> +M:	Vadim Pasternak <vadimp@mellanox.com>
> +M	Ernesto Corona <ernesto.corona@intel.com>
> +S:	Maintained
> +F:	include/linux/jtag.h
> +F:	include/uapi/linux/jtag.h
> +F:	drivers/jtag/
> +F:	Documentation/devicetree/bindings/jtag/
> +F:	Documentation/ABI/testing/jtag-dev
> +
>  K10TEMP HARDWARE MONITORING DRIVER
>  M:	Clemens Ladisch <clemens@ladisch.de>
>  L:	linux-hwmon@vger.kernel.org
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


