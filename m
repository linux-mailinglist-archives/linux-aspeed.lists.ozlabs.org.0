Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51736681E80
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Jan 2023 23:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5NqW0tgJz2yXJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 31 Jan 2023 09:57:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iIx0SZmz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iIx0SZmz;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5NqL471bz2xjR
	for <linux-aspeed@lists.ozlabs.org>; Tue, 31 Jan 2023 09:57:18 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id kt14so36597050ejc.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Jan 2023 14:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkBzjJq8dDnqIBZNW123DWc2O3D9KQjXbTdjR7yFFus=;
        b=iIx0SZmzpWvo5KBaBxIfrMUcfEcDuxJHpqslG3d0FdNksklMpfZ2YhatvG80tS8hLD
         K0Xttf+6ia++PzsgojAzPQKGehG1qXP8moNjRfnUu5vbdiI9bHHi4Ltz+tTuhHt41lZV
         8lApFJ24ir2c0M2fo4RxeUcIXsisL2UOZOTDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkBzjJq8dDnqIBZNW123DWc2O3D9KQjXbTdjR7yFFus=;
        b=qxrA7xQbTczuIgmrEflCdXn0pqVv4mMkmUJMAusJTAfMrezn4iQazZqIvU3Q63DoT9
         oYOYpGswTKYE0qPMfSV94IAvnKkv1+/3utnmHPymv6LleeyaqqqV8tZN5RnfsqgOAkr3
         YuGhMthKn05qr3rnmSO0e+v1sdo9THI/LQHodHlh20I0c2JD/Itqx0Q3NRHH4YR62LNK
         TVV121395/UwzVSfDZbC8Okx8af33QFNvLAiJHpMsv1p6v9PMzswjA4clcEE1wAiDSRr
         srDT9rf9BfJHZhKK3uJRIejk/++B7RSOoU9gVdYjFy+ZRvwq1nLuA1b72YB3XVSReqld
         tm/g==
X-Gm-Message-State: AO0yUKXKw5SJHqN6UWXwPSYmr/S1/kcmyvKe1J0mdrg6azEwOoeVZyFc
	a6Va35T0ipvjmzbuhkXWpBKmKiwU//S0rMMsySA=
X-Google-Smtp-Source: AK7set8n1Do8voL7vPuCqZxncXCif6aSlU8/Z208iQcQFG89jDC2Fvg/Ri4HhPN3QbgDwFlt4qdZkLSb8nXVLaaFx1Y=
X-Received: by 2002:a17:907:2a03:b0:87f:5802:fd72 with SMTP id
 fd3-20020a1709072a0300b0087f5802fd72mr2837501ejc.237.1675119434143; Mon, 30
 Jan 2023 14:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20230130220845.917985-1-joel@jms.id.au> <CACRpkdY3VtkJZn4pHawFiW7yie+BWvT8o9Qx0Ym0ihgi3ACJ2A@mail.gmail.com>
In-Reply-To: <CACRpkdY3VtkJZn4pHawFiW7yie+BWvT8o9Qx0Ym0ihgi3ACJ2A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Jan 2023 22:57:01 +0000
Message-ID: <CACPK8XdCjpmx7rQoR2dBCovC6B60m-ovdn91jA7DpgOfp-LiyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Revert "Force to disable the function's signal"
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 30 Jan 2023 at 22:52, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jan 30, 2023 at 11:09 PM Joel Stanley <joel@jms.id.au> wrote:
>
> > For now, revert the offending patch while a correct solution is found.
> >
> > Fixes: cf517fef601b ("pinctrl: aspeed: Force to disable the function's signal")
> > Link: https://github.com/openbmc/linux/issues/218
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Patch applied for fixes, sorry for not getting around to reverting it
> myself, but the commit message got really nice in the meantime :)

:D

Thank you!
