Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F10896B54BF
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Mar 2023 23:45:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYLjC6F51z3cK6
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 09:45:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QZ3qQGl3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QZ3qQGl3;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYLj43j5Gz308b
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Mar 2023 09:44:55 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id o1so6790289ybu.13
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 14:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678488292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yiatag0HBPlssT6lLHj1B1HKa5gHM0ni9RfFjV/A3Bw=;
        b=QZ3qQGl3ysCLYqc3+BIcJrkcZY3w56sert/WwHUWbfS/p8AQ9DaVUlS5eXZe4EBqVP
         9c9luQSVcOprbIBmT4aoo7qrOkqr6Of+9Q3dpcAurxosNUrUcxJ2ue80KuwxUHWbkLAD
         tW3n+zTvB7W+Mprlb3opzUwh3KimYqnigLOSovXrnjqyEFOQgL9RKx3OJ3GNyqaf6nRz
         uX8XydJa1GbBI2q6lG8NRTB71u+mvJGjxLA0Kh5EYyQdo+5l3bo2aFUo4u7ADFj3Nwaq
         zK9xR5f3b7lIyuSPqZXSZfVIaOEauYBccbtrSkZCYwSgbPaKaN14l5ul1WUuLxf8Emx3
         7WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678488292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yiatag0HBPlssT6lLHj1B1HKa5gHM0ni9RfFjV/A3Bw=;
        b=E1kI5B+GNjiJjC+5fGVPB7nk8NXSLAqSRC3Lwoxy50jY3wztZiLqpsik0jjcT9sLu8
         4i55oiIQYeIiVG19tdCDnEPbETLVrHJI2uVNFvw1//KHdKnNNwYt6eXegV92Vp6HAKJh
         Bcx/jCG4c2UNhO3ZoBUNgycHXcAhzAsUN0wIrrCN+WzYQQTZ6W2jc10OMw1coLU3zHyR
         OfKKbeS0gzmE1DHWREKsj5FrV9emzt6KcQEVupb0rmR+q69p+21aFnaY8I5FRzaz89sz
         SIxLMEiAOREeR1SSOTdB2wi+XwZeLcNgnNN2kRY5Bj7kYeqMCmurLGXNvGvX+3+Nq39H
         1CbA==
X-Gm-Message-State: AO0yUKWRPkvAioPxp/WD5cYLEc+4E2fEPResKMbpt0w7GPuEVSEKEmEt
	XlWa/3l3HpuTZap8uIN0P3hc9b6k1ciGm+WCIm9+fQ==
X-Google-Smtp-Source: AK7set9IjziFhtMIyDmTbNJQeJUGfaU6EwLqgkuRD5zd8aQOX/4BVX9GyyO8rgzvXcYU5bs7/TQU+5AK438In//pe/w=
X-Received: by 2002:a25:3f01:0:b0:b26:884:c35e with SMTP id
 m1-20020a253f01000000b00b260884c35emr2340474yba.4.1678488291762; Fri, 10 Mar
 2023 14:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org> <CAMRc=MdyjQDEMNxGYOKwWHry7MnEFMHYZSg=-FPohNwn6dxjaQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdyjQDEMNxGYOKwWHry7MnEFMHYZSg=-FPohNwn6dxjaQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Mar 2023 23:44:40 +0100
Message-ID: <CACRpkdYZvvPRgdctcFo+o24+PEWaz-dpPd0ntFg7qWQDYNPKsA@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] Mass convert GPIO IRQ chips to be immutable
To: Bartosz Golaszewski <brgl@bgdev.pl>
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
Cc: linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Kevin Hilman <khilman@kernel.org>, Marc Zyngier <maz@kernel.org>, William Breathitt Gray <william.gray@linaro.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jay Fang <f.fangjian@huawei.com>, linux-gpio@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Mun Yew Tham <mun.yew.tham@intel.com>, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, Romain Perier <romain.perier@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Mar 10, 2023 at 4:25=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Thu, Mar 9, 2023 at 8:45=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> >
> > We are getting tired of these irq_chips not getting converted
> > to be immutable, so I just take out the big hammer and fix
> > some that I deem not too complex as best I can.
> >
> > I stopped after doing some, I will take another sweep at some
> > point I guess.

> Normally these irq_chip conversions would go upstream as fixes but
> this time there are too many at once. I applied them to my
> gpio/for-next branch. Let's give them some time in next and later we
> can backport them if necessary.

That's fine since the maintainers didn't get around to fixing it themselves
yet anyway it can't be that important to them.

I will try to take a second sweep and see what is left on the floor, and
then I guess a sweep over the gpio_chips in pinctrl as well.

Yours,
Linus Walleij
