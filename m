Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F2D35576
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 05:02:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JYVZ6bMBzDqWY
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 13:02:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.65; helo=mail-lf1-f65.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J4602LnvzDqDM
 for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Jun 2019 17:57:43 +1000 (AEST)
Received: by mail-lf1-f65.google.com with SMTP id a9so14277631lff.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 04 Jun 2019 00:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KyJePs3XnLfOX3cvCnsFt2DsH4jTLKDr7Nu7LZwNhEw=;
 b=ftHiezy1HlJNkHWbHGBDzK3KWnpLoimvGdrLFZCsE7WRU5FhsdZE/UogU4u/1IK5zq
 dELJo3hKFk46nGaq+LQxJ0mr1zRuecv56Gat6x3WxaGsFYCbjS2CyDoSaMAgDJTRTWJK
 OawsV16SuYe7KMQ9Xh9TqyFpI4bQtS+BSSBpRgybAikPYF0zOWn+tUvZYKgcZirNRsUY
 vrCpuE7NRmcNo9cDISzZ2K0Qr2aQfJ5sXnEVCOsXvFMXU5pGVevyPX7CY3gG/dE+HMjA
 BP+hX9aN+iQVcxH+El9fo8QYMZNyTlAb/CsQrCbmd2yS1GjLHDqV1n3Gk1rMkhrjKNC8
 sbfw==
X-Gm-Message-State: APjAAAX5N/q6ULQUluxHDe+6Pu+OeeJVqD0lj8j4L20+V74nHncWAgEL
 +nsyLHBmq6U2fhT8lj1yylhDA+Ww4DHQ3sAQHoQ=
X-Google-Smtp-Source: APXvYqyZ1Y2BgRT07oWRCciUH//Gkp+j+D39P1c/BSfl+S9xfiOfkzKOZIBXZiSvjWyNUt5EWy6PY1aO97kA/vXC9Yc=
X-Received: by 2002:ac2:5a04:: with SMTP id q4mr15868697lfn.90.1559635059383; 
 Tue, 04 Jun 2019 00:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <1559634833-19980-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1559634833-19980-1-git-send-email-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2019 09:57:27 +0200
Message-ID: <CAMuHMdV0RNdB3_n7J0FWfhUTvzq4390HVsuzxXhexZ_zX-+nvg@mail.gmail.com>
Subject: Re: [PATCH] ARM: configs: Remove useless UEVENT_HELPER_PATH
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 05 Jun 2019 13:02:07 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mans Rullgard <mans@mansr.com>, linux-aspeed@lists.ozlabs.org,
 Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, arm-soc <arm@kernel.org>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 9:54 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Remove the CONFIG_UEVENT_HELPER_PATH because:
> 1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
>    CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
>    made default to 'n',
> 2. It is not recommended (help message: "This should not be used today
>    [...] creates a high system load") and was kept only for ancient
>    userland,
> 3. Certain userland specifically requests it to be disabled (systemd
>    README: "Legacy hotplug slows down the system and confuses udev").
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  arch/arm/configs/proceq_vf_bck_defconfig  | 255 +++++++++++++++++++++++++++
>  arch/arm/configs/proceq_vf_crc_defconfig  | 278 ++++++++++++++++++++++++++++++

These look like unrelated changes? Please drop.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
