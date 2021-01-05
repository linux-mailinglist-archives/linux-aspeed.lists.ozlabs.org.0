Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D674E2EACEC
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Jan 2021 15:05:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9DmZ0YBRzDqhN
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Jan 2021 01:05:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=adrian.hunter@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9DML2kLYzDqZD
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Jan 2021 00:47:21 +1100 (AEDT)
IronPort-SDR: tQjLTT/vII2YnGaE6aCiF2P/pYKZUOlWtuH/61URWX8GXEAp3bA4DyJsAIZqsDqrc3/iqHgxJC
 taSPSn0U729w==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="176323284"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="176323284"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 05:47:18 -0800
IronPort-SDR: K+oOaHaTMm745c8x0yJQONHkJSAVG3HVrQAmqA2jXJ7BV8Ngd08TMocGk74SwwVLU82I49e0nR
 gfJydaJf775A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="421777717"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94])
 ([10.237.72.94])
 by orsmga001.jf.intel.com with ESMTP; 05 Jan 2021 05:47:15 -0800
Subject: Re: [PATCH v6 4/6] mmc: sdhci-of-aspeed: Add KUnit tests for phase
 calculations
To: Andrew Jeffery <andrew@aj.id.au>, linux-mmc@vger.kernel.org
References: <20201218035338.1130849-1-andrew@aj.id.au>
 <20201218035338.1130849-5-andrew@aj.id.au>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <ff588027-0fbb-100e-05a9-4a804662d838@intel.com>
Date: Tue, 5 Jan 2021 15:47:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201218035338.1130849-5-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 18/12/20 5:53 am, Andrew Jeffery wrote:
> Converting degrees of phase to logic delays is irritating to test on
> hardware, so lets exercise the function using KUnit.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/mmc/host/Kconfig                |  14 ++++
>  drivers/mmc/host/Makefile               |   1 +
>  drivers/mmc/host/sdhci-of-aspeed-test.c | 100 ++++++++++++++++++++++++
>  3 files changed, 115 insertions(+)
>  create mode 100644 drivers/mmc/host/sdhci-of-aspeed-test.c
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 596f32637315..d6f00d1d6251 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -168,6 +168,20 @@ config MMC_SDHCI_OF_ASPEED
>  
>  	  If unsure, say N.
>  
> +config MMC_SDHCI_OF_ASPEED_TEST
> +	bool "Tests for the ASPEED SDHCI driver"
> +	depends on MMC_SDHCI_OF_ASPEED && KUNIT=y
> +	help
> +	  Enable KUnit tests for the ASPEED SDHCI driver. Select this
> +	  option only if you will boot the kernel for the purpose of running
> +	  unit tests (e.g. under UML or qemu).
> +
> +	  The KUnit tests generally exercise parts of the driver that do not
> +	  directly touch the hardware, for example, the phase correction
> +	  calculations.
> +
> +	  If unsure, say N.
> +
>  config MMC_SDHCI_OF_AT91
>  	tristate "SDHCI OF support for the Atmel SDMMC controller"
>  	depends on MMC_SDHCI_PLTFM
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 451c25fc2c69..3ee59d5802cf 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -90,6 +90,7 @@ obj-$(CONFIG_MMC_SDHCI_DOVE)		+= sdhci-dove.o
>  obj-$(CONFIG_MMC_SDHCI_TEGRA)		+= sdhci-tegra.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)	+= sdhci-of-arasan.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+= sdhci-of-aspeed.o
> +obj-$(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)	+= sdhci-of-aspeed-test.o
>  obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
>  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
> diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
> new file mode 100644
> index 000000000000..fb79b278fb81
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright (C) 2020 IBM Corp. */
> +
> +#include <kunit/test.h>
> +
> +#include "sdhci-of-aspeed.c"

I am not sure including like that is advisable.  Did you consider instead
doing it the other way around i.e. adding an include to the bottom of
sdhci-of-aspeed.c?
