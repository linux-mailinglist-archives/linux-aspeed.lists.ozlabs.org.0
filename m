Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED3795795E
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJJ6rWCz7BX5
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mBZgYDuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqjcC4svhz3bsT;
	Thu, 30 May 2024 20:46:49 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52b7ebb2668so632267e87.2;
        Thu, 30 May 2024 03:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717065997; x=1717670797; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz3V9iZ9GUeS/4lYsW1iAj8Ti45jGQbQe9Z5iScKCj8=;
        b=mBZgYDuDx0JzuFXMMXN2ZnC6VGWfxsQSD+JFzV4O7DnhPW4S6UugkFDvvWPCzwesja
         FQ+NqUt6oiDg/mUgJgWypT/gF6gjB2EwALJS5ka6qDUTJvtOje01PYzB2SKmPgyRR5Z0
         9Na/Mg2+9ahkf1jyxMUhyvtj+ikOG/i717oZhAn1FS1tljQMN0X47Iagyqi3aajU7lZW
         UC3ZhQ5VvHYLfUFV/lrGDKzSKhBdBXf7HIbDsQq6zaBf19q0AKVHP3shT7Z8UQKLohXI
         tuuFYXf38X3GKpfOTPh7Iq6b2U0VBAjyWh9RxI4L1p9uMBNSjYDG15OJ4d8Ape/K6e7O
         cRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717065997; x=1717670797;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz3V9iZ9GUeS/4lYsW1iAj8Ti45jGQbQe9Z5iScKCj8=;
        b=lKIxfg0NbFHUidJhMzKk08iW8FCO0QGsorQY7SmhMolJlBMNLVSU3bJCBbsqHCLyMo
         OTBVjIj5G0MBFlWGWbMQFfgWZoVXtHq1TB+MIZon1nM6mQVgTF5QxkSXf58tCvPQp1hz
         0coBQmhg3Z8QTgceB1oIDf/VHU74nH4vXn/UPf4Dh5YP/9hbCWgEpL4dwczcIZ2HB9Ga
         jDVRYXbswuWTfMGWZ5qjOPKPz3AKNS5xSsP84L3myHIZoUoNX+OmCPhyCV0Y0V2yCLgF
         98CC2FhTXn8k4oHjgU5RwCvNnhnQZxab/m3Iy/sXv+k4XNKFD4K2gz7s6NsHQcAknPA3
         uApg==
X-Forwarded-Encrypted: i=1; AJvYcCU8NYPhUqNAKekubw4gROeBaFS2wQXpBqI1xNPsaEZ6K+85/2+Ttv6LXl3N/hEhVGc7hNqZ5srm4TVB3WaTHxXhNT2VIC2QD3FDwZTfqHlXrqHz18GPAeduBlESTIIhokW7vAqNvTX9
X-Gm-Message-State: AOJu0YxmZeXXGrI8p1v735cbFHxjpkBF8K3jcMkDtrgqKIRsfNegoUtZ
	dgrpcCiVOLXIzY1kSJbU1DzklZ552Trjj9yd5EV5X4/LEAyQT7V+
X-Google-Smtp-Source: AGHT+IF8HtLfN2jy2u5b6qrXpWEdw3o5ChBVoUHw6Bx6hyhWP9jrTNwrZOX6TBLkr1VZDWVNaz6SDA==
X-Received: by 2002:ac2:5979:0:b0:51a:c3b8:b9cf with SMTP id 2adb3069b0e04-52b7d4b1c97mr1485781e87.69.1717065996469;
        Thu, 30 May 2024 03:46:36 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c9376dasm807478466b.54.2024.05.30.03.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 03:46:36 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 30 May 2024 12:46:34 +0200
Message-Id: <D1MX3G6VN849.WKRMI0MU71Q@gmail.com>
Subject: Re: [PATCH v2 02/20] pinctrl: tegra: Use scope based of_node_put()
 cleanups
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Dvorkin Dmitry" <dvorkin@tibbo.com>, "Wells Lu" <wellslutw@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Emil Renner Berthing" <kernel@esmil.dk>,
 "Jianlong Huang" <jianlong.huang@starfivetech.com>, "Hal Feng"
 <hal.feng@starfivetech.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chunyan Zhang"
 <zhang.lyra@gmail.com>, "Viresh Kumar" <vireshk@kernel.org>, "Shiraz
 Hashim" <shiraz.linux.kernel@gmail.com>, <soc@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Patrice Chotard"
 <patrice.chotard@foss.st.com>, "Heiko Stuebner" <heiko@sntech.de>, "Damien
 Le Moal" <dlemoal@kernel.org>, "Ludovic Desroches"
 <ludovic.desroches@microchip.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Dong Aisheng" <aisheng.dong@nxp.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Shawn Guo" <shawnguo@kernel.org>, "Jacky
 Bai" <ping.bai@nxp.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Chester Lin" <chester62515@gmail.com>, "Matthias Brugger"
 <mbrugger@suse.com>, "Ghennadi Procopciuc"
 <ghennadi.procopciuc@oss.nxp.com>, "Sean Wang" <sean.wang@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Joel Stanley" <joel@jms.id.au>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Tony Lindgren" <tony@atomide.com>, "Stephen
 Warren" <swarren@wwwdotorg.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-2-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-2-26c5f2dc1181@nxp.com>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat May 4, 2024 at 3:20 PM CEST, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 7 ++-----
>  drivers/pinctrl/tegra/pinctrl-tegra.c      | 4 +---
>  2 files changed, 3 insertions(+), 8 deletions(-)

Looks good to me:

Acked-by: Thierry Reding <treding@nvidia.com>

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYWQsACgkQ3SOs138+
s6H2yBAAgeFKUkMlk3cWjVf9KNcypicIrr3j8r7LwohalNat613qoJ9YbzqqhwI4
Gz6WRZUeiS7foiJu4a7gpc+lM2BsBe1fH2Qp8quSuXvd3qUCG7X5x3lf3NKsgqTY
cXTyByotLJvYp5A/oUqWp1lwEyHec33GjJhuUzl7SD/HXun7zOdGWkBDonQJBlLj
Bs5fE7wt9ekYvMAU7EHBDbIg10fvay+qWs4EJoqxhFgSgnmFSK9NrRZIW8IpWcU+
AYMf2SPzWXdNPHij0BrXcWhV94d+XhSjSk1ERGByH2AOAr9WJ2YtrZm/W+7KVHXe
G/4DE+Ss2wpYr6d4kAVn9GEDwH21w3DBKY38Ah/0B2SE1Nv1LXdaPD2m4SiNSIMb
X55kEyxnrVPM9TTH9LlMKeJBwUDqohmQ9vYKDVuTVGO6Kdu3fc8euMIjCaWW7RkA
lbmgGT83eBp279Bw72mbM83wtPgVvBY9ufV0oy6Ox8cY7D0pDOFCCxLhxYld7XT1
7Sqg9E9rNlM/OX0QBFtCqcx/RtAY6ILPMioWUfFOS6FX8JjA9hviTvPYGNrSdvRl
ZC6LcNmGEY9OjNMxft3NCl+kjz3fkiYyd9UglVHjAi+q4odk2HFwg93bVAEC705u
xsy5uZQ96h1OIwzr643CV9p79G4CjuxDndqb4RfPWrnW3Dkw0iY=
=tJx3
-----END PGP SIGNATURE-----

--0af7656c2f06897086bd91562b0d7ec8235257f5e63bfa8c4a36e7a56c11--
