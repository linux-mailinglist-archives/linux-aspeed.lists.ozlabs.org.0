Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C31A806BBA
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Dec 2023 11:18:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UmMBEP+m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlYJM0Gphz2xdd
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Dec 2023 21:18:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UmMBEP+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=andi.shyti@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbHPJ0yHSz3cR8
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Nov 2023 10:23:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700695428; x=1732231428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wLu90c2ONU3nwRPuECsbNVwdI6Y/3s1bCFsGjUjQWds=;
  b=UmMBEP+m0KlVnCz5MQbFQsmqLO6g2FL71mXqPj96ZjPleT3JTz36Zcz2
   TLA0oYfahvnlUsHJxVirDaaTMsN1a7lzTNM3n3xznvbE+aWSyLNl+rdl4
   S+/xAbPJ91DNTBwXIYo3B6Aw6Zl/6jp1Ha/DWJ9e4Bj0rHETxOwSLMJpy
   K5G303bvSJ10GGkS+FUfzGa02QmktsGjhGOmFFqlxMxUNzz19eG6uEpTm
   /u/qXv/eotz1wm2Y0boLBfp5v2RmQEbsGnax5ZynT27Ktl+jHieM2SxUe
   iPxTjiZGQFC2ytR+BA4Jh2jM51gmhGMdO+dviFA3K8JJMzHcE6nwcvs3o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391935071"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="391935071"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760507612"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="760507612"
Received: from amongesa-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.57.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:23:31 -0800
Date: Thu, 23 Nov 2023 00:23:28 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 03/52] serial: 8250: Convert to platform remove callback
 returning void
Message-ID: <ZV6NcAXBUcj5wYx8@ashyti-mobl2.lan>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
 <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Wed, 06 Dec 2023 21:17:14 +1100
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Tony Lindgren <tony@atomide.com>, Al Cooper <alcooperx@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <florian.fainelli@broadcom.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andi Shyti <andi.shyti@linux.intel.com>, Chen-Yu Tsai <wenst@chromium.org>, Jacob Keller <jacob.e.keller@intel.com>, Ilpo =?iso-8859-15?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Petr Mladek <pmladek@suse.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, Ray Jui <rjui@broadcom.com>, Johan Hovold <johan
 @kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-rpi-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de, Thomas Richard <thomas.richard@bootlin.com>, linux-mediatek@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Uwe,

On Fri, Nov 10, 2023 at 04:29:31PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
