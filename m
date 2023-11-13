Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E28A7EAA81
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Nov 2023 07:26:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gQ3C+vqt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STxBc6n55z2xmC
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Nov 2023 17:26:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gQ3C+vqt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=46.235.227.172; helo=madras.collabora.co.uk; envelope-from=angelogioacchino.delregno@collabora.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 405 seconds by postgrey-1.37 at boromir; Mon, 13 Nov 2023 20:16:26 AEDT
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STP1k5xMhz2xmC
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Nov 2023 20:16:26 +1100 (AEDT)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25D3C66003B2;
	Mon, 13 Nov 2023 09:09:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699866575;
	bh=+biIpFAEesmQeyQ0ajxFqoWe4IfKev4rpI+PhrI9rhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gQ3C+vqtj839O3n3L/ymQgH5t2FA4orXI/4KbT4WaNjrPKOE9Zd2VJsOerugMFMDK
	 7gxj104S3lY4XsC0+1zWzEjORjCy5vKauxi14SaX5z8noDgNuw8aoDj4GM3bQ6XZW5
	 5v7erfC5J0ixZXoprbrjUaiIQK+96g2IW61NrTRRuFSTHaXINn0BVekFaloiQoIyuy
	 j0DwcdKMIoMh+5EKeg9qKvTxq1q/mrjYZtKPpPd1wg2R54ahkspMyhbHSdZb8nuxxc
	 EaavpD76t7v/qgNdgboQD5sK0vkceUzToyzWcyjYaEU5TlVl28UA7jGHq/fJuGr/vv
	 7c2XU5BP2NyGA==
Message-ID: <023e2184-c2e4-4f3e-a1e1-492dbf7a2e7f@collabora.com>
Date: Mon, 13 Nov 2023 10:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/52] serial: 8250: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
 <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Nov 2023 17:25:47 +1100
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Tony Lindgren <tony@atomide.com>, Al Cooper <alcooperx@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <florian.fainelli@broadcom.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andi Shyti <andi.shyti@linux.intel.com>, Chen-Yu Tsai <wenst@chromium.org>, Jacob Keller <jacob.e.keller@intel.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Petr Mladek <pmladek@suse.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, Ray Jui <rjui@broadcom.com>, Johan Hovold <johan@kernel.org>, Vladimir Zapolskiy <
 vz@mleia.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Scott Branden <sbranden@broadcom.com>, Thomas Richard <thomas.richard@bootlin.com>, linux-mips@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de, linux-mediatek@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Il 10/11/23 16:29, Uwe Kleine-König ha scritto:
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

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

