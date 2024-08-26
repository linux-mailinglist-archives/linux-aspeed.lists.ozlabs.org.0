Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E595FE10
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2024 02:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt88D5R5Vz30BG
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2024 10:49:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724659867;
	cv=none; b=loZA9aqKEkN1nVmMzytjS76scStb80abNP4DC7UggR6HoLTvdApv0yDUulbnm/lZDrIbUI4sqNTwKKRPAFOkDvRUaTZQPq2pz/pbQBv41e5fcPd0s3NQfJGKAYAzURg1Ll72d2DT8mztbbJ3hqiMtJ7N6rf+zqvm0NbSFft0ZZI1wJaNKG+yLMb2HPyVQU2KmG+nWz055Tg0dBjEmyGXSmnsblGumudmE95akSKaLH8zgWdpBEka/ihISvdtje/zRVnJ/u4Pir/2u3F7I+TpJU010V2ZMPAH7h5Z+7SBxqU3GEgy4h737Jed+S2u75yNZGcJwijtJr9zkmi+Z2YcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724659867; c=relaxed/relaxed;
	bh=IFgD/NSL0WJrKXnkqNks0aX5A7Stfo4Zhha7qxndCFk=;
	h=X-Greylist:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned:X-PTX-Original-Recipient; b=lhC+CtmITXXDbVNGFB2tC2WP2MRICBt5pER+paFPNQ33kJemjJ58/mZ1GIC3yweiAdT8TZLqNEPgxG2Gwk77S0b4eTgyHPV+UxTi51A0ppQpNpVEVBcJv8iTy2WmJFfR8CxD4I8G+iKw40St3I2ntoVNc0AvxGNLhVGKMz3p/W4tsNtJcWen6LD0M3Op5ArPbrQDUtxZaXEXdqQqU8Ws7aFN1be7qLdNlsZ5ySEOiYDNiSSNkN5nUUWS+fAyjWLgeXvirmst6y8b32ggr0djhG6tgkgPEj8GW0d4peKHPnBKjMyQlHN/vhDsU3tww87GKuZ+jYm08m953vEz/qi24A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mfe@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mfe@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1083 seconds by postgrey-1.37 at boromir; Mon, 26 Aug 2024 18:11:06 AEST
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsjzt3hxhz2yFQ
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 18:11:06 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVR-0006mO-Jk; Mon, 26 Aug 2024 09:51:17 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVK-0038Ph-Cg; Mon, 26 Aug 2024 09:51:10 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVK-006xmZ-0b;
	Mon, 26 Aug 2024 09:51:10 +0200
Date: Mon, 26 Aug 2024 09:51:10 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 0/9] AT24 EEPROM MTD Support
Message-ID: <20240826075110.u3cxc6dootou72eq@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <Zsi3s9XithGEROwX@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zsi3s9XithGEROwX@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Mailman-Approved-At: Tue, 27 Aug 2024 10:49:46 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, Shawn Guo <shawnguo@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Andy,

On 24-08-23, Andy Shevchenko wrote:
> On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> > This series adds the intial support to handle EEPROMs via the MTD layer
> > as well. This allow the user-space to have separate paritions since
> > EEPROMs can become quite large nowadays.
> > 
> > With this patchset applied EEPROMs can be accessed via:
> >   - legacy 'eeprom' device
> >   - nvmem device
> >   - mtd device(s)
> > 
> > The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> > to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> > 
> > Note: I'm not familiar with Kconfig symbol migration so I don't know if
> > the last patch is required at the moment. Please be notified that the
> > list of recipients is quite large due to the defconfig changes.
> 
> FWIW, I think that MTD is *not* the place for EEPROMs.
> 
> Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
> historical reasons and absence an umbrella subsystem for them), but it's not
> the reason to hack them into something which is not quite suitable.

Thank you for you input. There are two things to mention:
 1st) I send a RFC patch and asked for feedback and all I got was: looks
      okay, please send a proper patch [1] which I did.
 2nd) I don't see the hacky part in this patchset.

Anyway the customer doesn't need the nvmem-partitions anymore and
therefore this patchset can be seen as obsolote.

Regards,
  Marco

[1] https://lore.kernel.org/lkml/20231201144441.imk7rrjnv2dugo7p@pengutronix.de/T/#m1e0e5778448971b50a883f62bd95622f6422b9a2

> 
> If NVMEM needs to be updated and may cover these cases after all (and do not
> forget about *small* size EEPROMs that most likely appear on the devices with
> limited amount of resources!) in a reasonable size and performance, why not?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 
