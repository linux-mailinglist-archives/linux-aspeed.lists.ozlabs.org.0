Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE97885FE
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:39:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CAh/v16T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXHzf3pKDz3cDk
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:39:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CAh/v16T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVkj905NMz2yTx;
	Wed, 23 Aug 2023 08:36:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C768363267;
	Tue, 22 Aug 2023 22:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2700AC433C7;
	Tue, 22 Aug 2023 22:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692743786;
	bh=NjYZtuuDSprtGhXi35X3nTK9OBfVVh4gcwf3JptlP0g=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CAh/v16TAyXS6VO2ALNXtF2z0iRgcCCKE7nkjOLQellZv0WJnN86cgMH5yfZM03mJ
	 Jx7K+pGTv+F3J4t4qdynaJ4n+9KzyQL/Kl4q//xGrAaann0vW+KcGY9xzp2weGiAEm
	 AM2toYc5L90AHzt2FPD4Mu0ypPk8pnXSL+CD0gBQDaMwYb/M9sBM4CHI+zjnuQj2ri
	 39GiQ6h30YJ4VP+pOIvNDAKT+qCvo3e7cRjfCnGmssz08Ht+w9j4URgHcKpYBGxip3
	 FWaX/yBtm5Mb9ACd7PY7MPuGJvuu+s2iDMLyik9tB/h7AKE//+xsiAOJyPubVbG9Rm
	 fAD8TLwq5Lm3A==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31969580797so4455868f8f.3;
        Tue, 22 Aug 2023 15:36:26 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx3vVFg6XOmsxhIIfGGM7365W+TG+1ySuZwXFoEjj+yBbnOr1f+
	5THutVZdKesDaJexzQNpPe8kKlxTD8ht6S1N7Q==
X-Google-Smtp-Source: AGHT+IE9Tj4RwFZn6igP8wgaaZ8RvFIFIaigPEIiJVjQdchFweTdVVeIAYobrH0bchiVGw+zmZLMPKDd//GHA7HUmZ0=
X-Received: by 2002:a2e:b0d0:0:b0:2bc:c3ad:f41b with SMTP id
 g16-20020a2eb0d0000000b002bcc3adf41bmr4736964ljl.2.1692743763933; Tue, 22 Aug
 2023 15:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-21-d8de2cc88bff@kernel.org>
 <5696647.DvuYhMxLoT@jernej-laptop> <CAL_Jsq+Ssha5KdBdJ+7c3cxuy+VqWRUjSa=YM78gKi5mZAwvgQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Ssha5KdBdJ+7c3cxuy+VqWRUjSa=YM78gKi5mZAwvgQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Aug 2023 17:35:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKL7x0JCW476dU=Q5dQOCjLkBq4xcZSJAKzBiLK94nsHA@mail.gmail.com>
Message-ID: <CAL_JsqKL7x0JCW476dU=Q5dQOCjLkBq4xcZSJAKzBiLK94nsHA@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] soc: sunxi: Explicitly include correct DT includes
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 25 Aug 2023 21:33:58 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Stuart Yoder <stuyoder@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-aspeed@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qiang Zhao <q
 iang.zhao@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, linux-pm@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Jay Fang <f.fangjian@huawei.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, soc@kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, Dinh Nguyen <dinguyen@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shiraz Has him <shiraz.linux.kernel@
 gmail.com>, openbmc@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 22, 2023 at 5:30=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Aug 6, 2023 at 6:42=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabe=
c@gmail.com> wrote:
> >
> > Dne petek, 04. avgust 2023 ob 00:43:01 CEST je Rob Herring napisal(a):
> > > The DT of_device.h and of_platform.h date back to the separate
> > > of_platform_bus_type before it as merged into the regular platform bu=
s.
> > > As part of that merge prepping Arm DT support 13 years ago, they
> > > "temporarily" include each other. They also include platform_device.h
> > > and of.h. As a result, there's a pretty much random mix of those incl=
ude
> > > files used throughout the tree. In order to detangle these headers an=
d
> > > replace the implicit includes with struct declarations, users need to
> > > explicitly include the correct includes.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Applied to sunxi tree, thanks!
>
> Did you really? Doesn't look like this is in linux-next.

Sorry, it's just the genpd part that isn't since that moved.

Rob
