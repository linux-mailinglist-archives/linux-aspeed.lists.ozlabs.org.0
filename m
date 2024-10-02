Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB598E638
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 00:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJqf62QXNz2yXm
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 08:45:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727840950;
	cv=none; b=U7NL8E3ehoBVCSx6SoGpR9JWxz2aD8Ne4sQlYTWABcwmsvUrruIZgQDV5Ep7gMOfK7fe2SEq3IqsFZv4C0atd0vOPxSUaI0WX+MBSExmx+W5JEL2ld7siz+3WlCv+51PmdMcgF9NZ+U7HAtt5soDUb7w4J/oUj++Vcq6Gk5xhWYUsz+4RV2tJO4h5Krcw1DmtYERKzIB/o4pdqkhbitRX0NdA1ebNXjenUkWxChfe3QFLn46jz8HVM+xfPjd5yjH/fPCI+klOHI8fqkfU5PgdF+dZEYBQDrTQTigcm+9IPL4XeqAvmo5HHRHdZ2GzfFq/RnO3ZmOVAKXYqN9pnZGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727840950; c=relaxed/relaxed;
	bh=nAEKTIpBmymWLR+e+hBkypCfwSNJotZOEB0oMjBgW3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfkGsDNq0D4/rqCJzkq2vowueFVBg1OmQCgLC4pFGZc7h3M0Qxwi6MARes2BnPdz7HjeVdZYEviajO3z5hzPwXqjrKt53WdTW4mqoGD3uqf938aPVDVbP0qeozCmTjw/f0o4gWZasMj792dFgpNf+Sj223JyOcQp/IbnNMvdacHkT32phWSgBocADMJEEzhCUD8WK7zdKdmNilAxbmwgOgbuBz91p2dj74HXNM+gu9FTq8m6rxsPGnUvIXVfEEvNMBSWO0w7n9/rHyCHqrHEnTaOnTKqvGsbjPVFJLNti6W9u3SzRPokpQDhtYkWfwDQKMHdYIrjwmAoPG0JLN/ezg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Af2UjTVf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Af2UjTVf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJLQZ1hPdz2yF4;
	Wed,  2 Oct 2024 13:49:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE4CCA43686;
	Wed,  2 Oct 2024 03:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE88C4CEC5;
	Wed,  2 Oct 2024 03:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727840945;
	bh=nAEKTIpBmymWLR+e+hBkypCfwSNJotZOEB0oMjBgW3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Af2UjTVfNh6y+KURqioy4b8Bj7Yu5BpvrE0pOuTAaCdsWVGE8VQdAPbay4eP9DqPg
	 vWMLCMNoxrjpq2dgf0Gkki5SuP7pwmk7jkH2meg7cuorJVxX/VF75raABEWvzkaMHi
	 vhhxdgRpR3b7B5ke0UhpF0oO9c3sZ7F6qfo5LaAZzh2DiImZJl6yUno80Km9y1f2VX
	 IIlH0yPKwIL8OBus0S8hdF72eqSA5xm2L3CztnHUgtzPMXEtvUhtadchDi41GC6Mt7
	 Ca1gozPG5gv1ZiW5uDRIVS53lJA/EuDl2IF4CK5RlPgdKNeNXNE2aGU70QMIY0HzW0
	 QHOaUeFAAHJ5A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5399675e14cso3479992e87.3;
        Tue, 01 Oct 2024 20:49:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkdMjXgD363ukRbA3K4mHgY3oQW5V0tRCdQQsnUZ7/fHXkyBkVdieFSoAGNb923HgMHvc8QyQywygT3DE=@lists.ozlabs.org, AJvYcCXANuEyuKr+hevSul1IIzYgClnvynwtflaqVnKIlC8QWl8eoQnfJCTUk6QHUpFfISkMOIJUZnUd8A==@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMfbnG/M9K/0b0v7BU5nGRYq+gklOP8hXcTYyXJdTpYDdE+z0j
	v7LgtorgFHu/9Yv1Tt3gWq3oFtrJFewiwa+T5SzyGk3iSfn+dRuVs5hKxq9M6JBr/Vo5MLr74WF
	sfjkBNbNUibHBPBsAENGOiyWA7w==
X-Google-Smtp-Source: AGHT+IEqtnQCtoRUlnvKJ/juvutRb8LD+WF2Ji1IL7egoXyMFlaAGJMVK219VrK0qM0doCIPbjzZD5sR9nPD1sht5+g=
X-Received: by 2002:a05:6512:1113:b0:533:4638:df40 with SMTP id
 2adb3069b0e04-539a067f65cmr743356e87.27.1727840943291; Tue, 01 Oct 2024
 20:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com> <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Oct 2024 22:48:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKNMhUy3HUAanod27FnJAz35w7FLp7tp0Uo3SeVbG7EGw@mail.gmail.com>
Message-ID: <CAL_JsqKNMhUy3HUAanod27FnJAz35w7FLp7tp0Uo3SeVbG7EGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: assign reg to memory nodes
To: Rosen Penev <rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 03 Oct 2024 08:45:48 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jisheng Zhang <jszhang@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, Jesper Nilsson <jesper.nilsson@axis.com>, "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Nicolas Chauvet <kwizart@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jernej Skrabec <jernej.skrabec@gmail.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Robert Eckelmann <longnoserob@gmail.com>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, Javier Martinez Canillas <javier@dowhile0.org>, "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "maintainer:SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT" <soc@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Lars Persson <lars.persson@axis.com>, Santosh Shilimkar <ssantosh@kernel.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Denis Burkov <hitechshell@mail.ru>, Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Antoine Tenart <atenart@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>, "open list:DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT" <kernel@dh-electronics.com>, Alexey Charkov <alchark@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, "moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>, "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 30, 2024 at 5:36=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Fixes dtc warnings:

Unfortunately we cannot make this change treewide. Any platform that
relies on the ATAGS to DT bootloader support in the kernel
decompressor expects /memory.

Rob
