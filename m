Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D87EAA82
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Nov 2023 07:26:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STxBh1C8sz3cVx
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Nov 2023 17:26:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQLc1KBPz2xVW
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Nov 2023 21:16:08 +1100 (AEDT)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b4145e887bso2427171b6e.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Nov 2023 02:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870565; x=1700475365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTO0ERk3BWfb6UISnsbuegKh0j43MXQ3l4j0lmIgta4=;
        b=qwaXv3vjwfQwoi4bvRAzqKRXNb2jK0LhgwhJ/L4OuTYXAINZOaQum34ACf0OelkcxT
         ULGn/GsiGBfrdEPWhGIGGqev8Ib5GmgiYmSvHUsvZG7MzpxgERUr2ZGTeYpV1UVp9lxd
         UrNzItjOcMXCy33yl9UuKgEsMKKJEVEJnLdp+kyP9v36Tjs7Q6ljixO+AyPhf68nfVJY
         tbBNGy75kUI0Kc7hApxowzZVV1Bi7pG67WTCKozZSf8X7xaakUrgXAb82XX0Jeg4Sv7q
         acbIEWAeru/Rww5ligRorKoJAvLRvoVWvc5p0k4vKf+yx5zuHtjznkG/XIJ37Xo3TtQU
         WCxA==
X-Gm-Message-State: AOJu0YzOlTtj4LmRm62QmQ1/U7U+P5Sf56QdS+SIq/7Vy+oeoKAF0JGS
	hlg/QoXpu8Ih22EtqopvbWbFHXgUam3KaA==
X-Google-Smtp-Source: AGHT+IFZuhN+n6t2/z75FcZMsi4g9CMW16G7UEL7Sjrp3Y3+ckKNDnJUbP2gskbmcTqm47+MgiyN/w==
X-Received: by 2002:a05:6808:3a19:b0:3b2:ef9c:d1b1 with SMTP id gr25-20020a0568083a1900b003b2ef9cd1b1mr8989986oib.6.1699870565488;
        Mon, 13 Nov 2023 02:16:05 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id n7-20020a0568080a0700b003ae540759a0sm762141oij.40.2023.11.13.02.16.04
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 02:16:04 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b4145e887bso2427162b6e.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Nov 2023 02:16:04 -0800 (PST)
X-Received: by 2002:a0d:d74d:0:b0:5a7:d86c:988 with SMTP id
 z74-20020a0dd74d000000b005a7d86c0988mr6382133ywd.28.1699870543575; Mon, 13
 Nov 2023 02:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de> <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2023 11:15:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8nCWzTuBeSTPkR=heWqdAYrhAJ9ZgydzWNRqkTuT+xg@mail.gmail.com>
Message-ID: <CAMuHMdU8nCWzTuBeSTPkR=heWqdAYrhAJ9ZgydzWNRqkTuT+xg@mail.gmail.com>
Subject: Re: [PATCH 03/52] serial: 8250: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Tony Lindgren <tony@atomide.com>, Al Cooper <alcooperx@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <florian.fainelli@broadcom.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andi Shyti <andi.shyti@linux.intel.com>, Chen-Yu Tsai <wenst@chromium.org>, Jacob Keller <jacob.e.keller@intel.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Petr Mladek <pmladek@suse.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, Ray Jui <rjui@broadcom.com>, Johan Hovold <johan@ke
 rnel.org>, Vladimir Zapolskiy <vz@mleia.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-rpi-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de, Thomas Richard <thomas.richard@bootlin.com>, linux-mediatek@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Nov 10, 2023 at 4:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
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
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

>  drivers/tty/serial/8250/8250_dw.c           | 6 ++----
>  drivers/tty/serial/8250/8250_em.c           | 5 ++---

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
