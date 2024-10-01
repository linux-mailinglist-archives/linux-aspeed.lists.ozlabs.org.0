Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 752DD98C995
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 01:45:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJF1C0lPfz308M
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 09:45:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727812816;
	cv=none; b=Wbtj8eTl9YLHa7czwWvRMmf1XaGnvP0CCp6hKZ6J79K6u6TWmZ/Zvzqy8gy0ZKW8aIk9rJADC3MmgCj9Ksn+6ND/Im7FYZiiplZ9OPhT389E4IaDftVin5ZNlajvrzQzBuLLz1SpOLLrHO9yo/7qVKcEGNXG0Gtwb2jyI6tcFI1rz5OZmhL0xTyIEERRNzGW1zvUQ9mKnkLjrHaQNpKGIZ9CgpkF+POCgAZhxkinzS3nhCCML16tnRKZSsUv87w7qLeu9kZjZpzsi2ZvUNzhOJCW7cj0NoNMLnEd+dgWWEvJO4Zhtk4amgFl883FWv6VEYjqqt6fBEz+KQ/x+6ohiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727812816; c=relaxed/relaxed;
	bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbqPu54urgr/HyuTNfjcn9KuDZrRMw9nH1ZIvsEI07uILRZyJ36KcoQJrDhyIgTXsCeppqIWxc9qNGnqKkCckzZP/L0Mj1dVmRw7m3pRl1O5uQa5xXZci3q/DxTizxpZJ1YXg+2KphQCPRBvSUEl+Z/V1KI1hVRwvKivVv8It1L7X7Q+nOXGbuJ1D2cZVG3bEdAAxTa/+5RIUZXlbx+FhxhitHYc+nbut3N0Db0MRtcXCXM0XI0KKxjzNXOMsbBe8IqKITE7Y8fBeC2A1VGTq/PJnhiHhUQap1W5Tq9ENB+EgikEM/1odCW+/EHCGgsDlNauOaUiCEaSJBCkWKCoWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20230601 header.b=eucGd+Bk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=martin.blumenstingl@googlemail.com; receiver=lists.ozlabs.org) smtp.mailfrom=googlemail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20230601 header.b=eucGd+Bk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=googlemail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=martin.blumenstingl@googlemail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ81X23cKz2xY6;
	Wed,  2 Oct 2024 06:00:14 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20b7a4336easo20243085ad.3;
        Tue, 01 Oct 2024 13:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727812810; x=1728417610; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=eucGd+Bk64IFspGf9lR62Sou0jQD8Ymwo1DLG1narSpDnuhCB22uuVz4nNsGUfOuoF
         EGuH0mi6gkWcOYskxKGVDKjW5G+ic5vQLJ0H3CSzisQt0qS1ozOinNwJUGdCl2yi4B1n
         oD2jvC0/YqZsyOM6zxcxRePxHuL2DH9FkeUdu1asK7Pp1EXT5xBc15M2XzHmmxtJu5R2
         PZiHMOXUDfF6o+fjhjcXanH+r9chfJCmbmebJsLrWV1pcLXgD2F6SGxCEPfmfr3zsjkO
         VybeVByG9Letxsd0tuSK4tkobBOv+ElusUoG4IBedGc+W1/6e/veBNXM4i2/4BgpJErG
         u6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727812810; x=1728417610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=tXdbvJO9jNcqjNHqMqBC/t2rKd5o+CqmiqcvNwkQ+BZh8SIf2uNwTO6wrn6KajMdQg
         Yv/eeA687pPkMw9nl0DE8iAT4TlfAe+hpyRP8MGJRDqqDKMUNdCybBHnT+n7HAMDacYR
         /xAYtepzLF5Zd9GAsn5FgDMdBJl7z+ugbHuZUag2BptQFd0eH7vMeFK2dhpFCOHKMR2a
         TR/b9gDd+NvjTHdOrZzCRJumVNov3HzIsQsPlmRRom896aHpxrrBr+76kh0ZcocUfKln
         YjV5vCYHKraJW+/0ppAsTbvhNSGBPF8+OvX+cSQ3PYVwEviiLrhhCUpsjXo1MHIwxBFD
         ZMpA==
X-Forwarded-Encrypted: i=1; AJvYcCWgI28ifJvTP9cRRuQiOmdc8KMK2RIwuPr4J9rCd0KgBY8IIcHMPnMnVBv3wwiVZ+SEGTQ8htmRgscGV10=@lists.ozlabs.org, AJvYcCWo/yuKu0lOcCNKoJ1zKrjppoRwg4fg3Bg/LKYYLiViV4UUfJb8ibX4k/qByUIViHsV/9S/+6utQg==@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyywy+rCT4o89MoiVsf9shroZUxRWmTZA1Qoe2/d9N5F8nuiMzZ
	JnTON/PeRuXCw8vrbRrVHTopdvAUpbrn+VL+ItwoZS0lhgEmjpt3oWFcEs5wkJOTSlQMON3CmQi
	TWsgiLCP1DNHVnzZhVNIrIH9DcDU=
X-Google-Smtp-Source: AGHT+IEzN68oFH6UETNrpbvCGpopcDsigqPvgYKygFNF7D6FUqPz4x1zQ8ZA7UoZNXXUi84OPMM6AhdceSvhM1DdNJ4=
X-Received: by 2002:a17:902:e550:b0:20b:720d:734 with SMTP id
 d9443c01a7336-20bc5a5cd06mr11151925ad.41.1727812809889; Tue, 01 Oct 2024
 13:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com> <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 1 Oct 2024 21:59:58 +0200
Message-ID: <CAFBinCB1Rz+C=Tj+RJAL5KZbk9K7cnpF_uR6rKkMeqyCuDBo4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: assign reg to memory nodes
To: Rosen Penev <rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 02 Oct 2024 09:45:16 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jisheng Zhang <jszhang@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Nicolas Chauvet <kwizart@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jernej Skrabec <jernej.skrabec@gmail.com>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>, Robert Eckelmann <longnoserob@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>, Enric Balletbo i Serra <eballetbo@gmail.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "maintainer:SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT" <soc@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Lars Persson <lars.persson@axis.com>, Santosh Shilimkar <ssantosh@kernel.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Denis Burkov <hitechshell@mail.ru>, Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Antoine Tenart <atenart@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>, "open list:DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT" <kernel@dh-electronics.com>, Alexey Charkov <alchark@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, "moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>, "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Rosen,

when you re-send this, please drop the Amlogic files.

On Tue, Oct 1, 2024 at 12:36=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
[...]
>  arch/arm/boot/dts/amlogic/meson6-atv1200.dts                    | 2 +-
This file was dropped with [0]

>  arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts               | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-ec100.dts                     | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-mxq.dts                       | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts                  | 2 +-
>  arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts               | 2 +-
These got updated with [1]


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3De2a3f11ae11c9f9ee780bf49f00a69f12dce3529
[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3D7947fd2d350e6057e7514459c7ee2db39d1096a2
