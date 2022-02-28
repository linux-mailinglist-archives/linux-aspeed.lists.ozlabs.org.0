Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D54C62C1
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 07:07:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6VK43LXXz3bVd
	for <lists+linux-aspeed@lfdr.de>; Mon, 28 Feb 2022 17:07:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UJLrcu+K;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=UJLrcu+K; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6VK04LVSz2yPv
 for <linux-aspeed@lists.ozlabs.org>; Mon, 28 Feb 2022 17:07:15 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id bc10so8080567qtb.5
 for <linux-aspeed@lists.ozlabs.org>; Sun, 27 Feb 2022 22:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dX1IYuv+pKoE5RWQMebZf9zpCqSCm/Io5TiFn1oToxU=;
 b=UJLrcu+KI8inQtMLqAneJSCusa/UZBrkhLT4UfuM574uAB9MAt84mJh8YJmOeo1pH2
 fkeZvXwH8jtTmOzk/IQITotZ0akAy9IiDX/cFqmSi8zlPw8AdfG7hVTJAZG0cGaVnJ0Z
 fDcaGovRGGCqNQcL3V8LQZjLAsWfeOL1Bs6XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dX1IYuv+pKoE5RWQMebZf9zpCqSCm/Io5TiFn1oToxU=;
 b=k6D02KGkLnm6hAiiPCs2Y2/qreTIZOhhCHTKDcUDOzFgxL2Lz9UyWhR+0MFPuHMpwy
 n1Iym/q0QMJYgqZ7iE/t0kcqy0CbMjuNe4ntlXQDOKCH7b37gt77Ty/7F7GdVnoLASGh
 jdVL8LY/TgtQTWMdKYoee/fCttb0YA44TugVrQx+AUfG+NJTdf9h9g1bg0HUgqTvSoDe
 2ZFQiG1sBRUj9F7sxHTmUDqx/aM9hqGVyvh/NKAZlySVNJDsQAJkn1NpaPbKaZ4Qf41B
 dYdqp+Lv0YJ/3xtbnG2a01X8x5ULIcmtb8GL6bed0Es3BLGjRwmyxyTgpB8+BV/1wrK5
 zOLA==
X-Gm-Message-State: AOAM531YFx7x35wspLI29GD6aUtTcMTLZcVUViu/eWbHyJMaL+oR0cuG
 MCd/FajFLze3nFSKSJiKed0iIHeFo4xuJ7xh+D4=
X-Google-Smtp-Source: ABdhPJwx6e/7afLlxfw9imZxLs7kaRmaUVuH7jsAW+iB4UW00tnsvFIFNSUOuVEkA/Ke6pPE4HgOwn0IBfi1momwe5k=
X-Received: by 2002:a05:622a:283:b0:2de:b3a2:b52d with SMTP id
 z3-20020a05622a028300b002deb3a2b52dmr11796494qtw.625.1646028432862; Sun, 27
 Feb 2022 22:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-2-clg@kaod.org>
 <20220225073155.f2cxfhm7surf34d4@ti.com>
 <688b7a65-d4b6-682b-494a-1d4178699dba@kaod.org>
In-Reply-To: <688b7a65-d4b6-682b-494a-1d4178699dba@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 06:07:01 +0000
Message-ID: <CACPK8XeCfLmEJSLV6q5BLpCVztzG3dZehCgqrjgrNr7LaOiReQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 27 Feb 2022 at 18:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 2/25/22 08:31, Pratyush Yadav wrote:
> > On 14/02/22 10:42AM, C=C3=A9dric Le Goater wrote:
> >> To prepare transition to the new Aspeed SMC SPI controller driver usin=
g
> >> the spi-mem interface, change the kernel CONFIG option of the current
> >> driver to reflect that the implementation uses the MTD SPI-NOR interfa=
ce.
> >> Once the new driver is sufficiently exposed, we should remove the old =
one.
> >
> > I don't quite understand the reasoning behind this. Why keep the old
> > driver around? Why not directly replace it with the new one? Does the
> > new one have any limitations that this one doesn't?
>
> No. The old one has more limitations than the new one. The old one in
> mainline is half baked since we could never merge the necessary bits
> for training. We have been keeping a full version on the OpenBMC tree.
>
> Joel, could we simply drop the old driver in mainline and keep the old
> one in the OpenBMC tree until we feel comfortable ? I guess we need
> more testing.

I would answer Pratyush's question with: the old one is well tested,
and the new one is not. We would intend to keep the old one around for
a release cycle or two, and once we're confident the new one is stable
we would remove the old.
